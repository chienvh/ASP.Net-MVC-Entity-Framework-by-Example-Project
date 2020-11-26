using ChienVHShopOnline.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using PayPal.Api;

namespace ChienVHShopOnline.Controllers
{
    public class ShoppingCartController : Controller
    {
        ChienVHShopDBEntities db = new ChienVHShopDBEntities();
        private string strCart = "Cart";
        // GET: ShoppingCart
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult OrderNow(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(System.Net.HttpStatusCode.BadRequest);
            }
            if (Session[strCart] == null)
            {
                List<Cart> lsCart = new List<Cart>
                {
                    new Cart(db.Products.Find(id),1)
                };
                Session[strCart] = lsCart;
            }
            else
            {
                List<Cart> lsCart = (List<Cart>)Session[strCart];
                int check = IsExistingCheck(id);
                if (check == -1)
                    lsCart.Add(new Cart(db.Products.Find(id), 1));
                else
                    lsCart[check].Quantity++;
                Session[strCart] = lsCart;
            }
            return View("Index");
        }

        private int IsExistingCheck(int? id)
        {
            List<Cart> lsCart = (List<Cart>)Session[strCart];
            for (int i = 0; i < lsCart.Count; i++)
            {
                if (lsCart[i].Product.ProductId == id) return i;
            }
            return -1;
        }

        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(System.Net.HttpStatusCode.BadRequest);
            }
            int check = IsExistingCheck(id);
            List<Cart> lsCart = (List<Cart>)Session[strCart];
            lsCart.RemoveAt(check);
            return View("Index");
        }

        public ActionResult UpdateCart(FormCollection frc)
        {
            string[] quantities = frc.GetValues("quantity");
            List<Cart> lstCart = (List<Cart>)Session[strCart];
            for (int i = 0; i < lstCart.Count; i++)
            {
                lstCart[i].Quantity = Convert.ToInt32(quantities[i]);
            }
            Session[strCart] = lstCart;
            return View("Index");
        }

        public ActionResult CheckOut()
        {
            return View("CheckOut");
        }

        public ActionResult ProcessOrder(FormCollection frc)
        {
            List<Cart> lstCart = (List<Cart>)Session[strCart];
            //1. Save the order into Order table
            var order = new ChienVHShopOnline.Models.Order()
            {
                CustomerName = frc["cusName"],
                CustomerPhone = frc["cusPhone"],
                CustomerEmail = frc["cusEmail"],
                CustomerAddress = frc["cusAddress"],
                OrderDate = DateTime.Now,
                PaymentType = "Cash",
                Status = "Processing"
            };
            db.Orders.Add(order);
            db.SaveChanges();

            //2. Save the order detail into Order Detail table
            foreach (Cart cart in lstCart)
            {
                OrderDetail orderDetail = new OrderDetail()
                {
                    OrderID = order.OrderID,
                    ProductID = cart.Product.ProductId,
                    Quantity = cart.Quantity,
                    Price = cart.Product.Price
                };
                db.OrderDetails.Add(orderDetail);
                db.SaveChanges();
            }
            //3. Remove shopping cart session
            Session.Remove(strCart);
            return View("OrderSuccess");
        }

        // Work with Paypal Payment
        private Payment payment;

        // Create a paypment using an APIContext
        private Payment CreatePayment(APIContext apiContext, string redirectUrl)
        {
            var listItems = new ItemList() { items = new List<Item>() };

            List<Cart> listCarts = (List<Cart>)Session[strCart];
            foreach (var cart in listCarts)
            {
                listItems.items.Add(new Item()
                {
                    name = cart.Product.ProductName,
                    currency = "USD",
                    price = cart.Product.Price.ToString(),
                    quantity = cart.Quantity.ToString(),
                    sku = "sku"
                });
            }

            var payer = new Payer() { payment_method = "paypal" };

            // Do the configuration RedirectURLs here with redirectURLs object
            var redirUrls = new RedirectUrls()
            {
                cancel_url = redirectUrl,
                return_url = redirectUrl
            };

            // Create details object
            var details = new Details()
            {
                tax = "1",
                shipping = "2",
                subtotal = listCarts.Sum(x => x.Quantity * x.Product.Price).ToString()
            };

            // Create amount object
            var amount = new Amount()
            {
                currency = "USD",
                total = (Convert.ToDouble(details.tax) + Convert.ToDouble(details.shipping) + Convert.ToDouble(details.subtotal)).ToString(),// tax + shipping + subtotal
                details = details
            };

            // Create transaction
            var transactionList = new List<Transaction>();
            transactionList.Add(new Transaction()
            {
                description = "Chien Testing transaction description",
                invoice_number = Convert.ToString((new Random()).Next(100000)),
                amount = amount,
                item_list = listItems
            });

            payment = new Payment()
            {
                intent = "sale",
                payer = payer,
                transactions = transactionList,
                redirect_urls = redirUrls
            };

            return payment.Create(apiContext);
        }

        // Create ExecutePayment method
        private Payment ExecutePayment(APIContext apiContext, string payerId, string paymentId)
        {
            var paymentExecution = new PaymentExecution()
            {
                payer_id = payerId
            };
            payment = new Payment() { id = paymentId };
            return payment.Execute(apiContext, paymentExecution);
        }

        // Create PaymentWithPaypal method
        public ActionResult PaymentWithPaypal()
        {
            // Gettings context from the paypal bases on clientId and clientSecret for payment
            APIContext apiContext = PaypalConfiguration.GetAPIContext();

            try
            {
                string payerId = Request.Params["PayerID"];
                if (string.IsNullOrEmpty(payerId))
                {
                    // Creating a payment
                    string baseURI = Request.Url.Scheme + "://" + Request.Url.Authority + "/ShoppingCart/PaymentWithPaypal?";
                    var guid = Convert.ToString((new Random()).Next(100000));
                    var createdPayment = CreatePayment(apiContext, baseURI + "guid=" + guid);

                    // Get links returned from paypal response to create call funciton
                    var links = createdPayment.links.GetEnumerator();
                    string paypalRedirectUrl = string.Empty;

                    while (links.MoveNext())
                    {
                        Links link = links.Current;
                        if (link.rel.ToLower().Trim().Equals("approval_url"))
                        {
                            paypalRedirectUrl = link.href;
                        }
                    }

                    Session.Add(guid, createdPayment.id);
                    return Redirect(paypalRedirectUrl);
                }
                else
                {
                    // This one will be executed when we have received all the payment params from previous call
                    var guid = Request.Params["guid"];
                    var executedPayment = ExecutePayment(apiContext, payerId, Session[guid] as string);
                    if (executedPayment.state.ToLower() != "approved")
                    {
                        //Remove shopping cart session
                        Session.Remove(strCart);
                        return View("Failure");                        
                    }
                }
            }
            catch (Exception ex)
            {
                PaypalLogger.Log("Error: "+ ex.Message);
                //Remove shopping cart session
                Session.Remove(strCart);
                return View("Failure");
            }

            //Remove shopping cart session
            Session.Remove(strCart);
            return View("Success");
        }
    }
}