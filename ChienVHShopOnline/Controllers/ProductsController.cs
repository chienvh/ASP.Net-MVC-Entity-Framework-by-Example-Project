using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ChienVHShopOnline.Models;
using PagedList;
using System.Net;

namespace ChienVHShopOnline.Controllers
{
    public class ProductsController : Controller
    {
        ChienVHShopDBEntities db = new ChienVHShopDBEntities();
        // GET: Products
        public ActionResult Index()
        {
            return View();
        }

        public PartialViewResult ProductListPartial(int? page, int? category)
        {
            var pageNumber = page ?? 1;
            var pageSize = 10;
            if (category != null)
            {
                ViewBag.category = category;
                var productList = db.Products
                                .OrderByDescending(x => x.ProductId)
                                .Where(x=> x.CategoryId == category)
                                .ToPagedList(pageNumber, pageSize);
                return PartialView(productList);
            }
            else
            {
                var productList = db.Products.OrderByDescending(x => x.ProductId).ToPagedList(pageNumber, pageSize);
                return PartialView(productList);
            }
        }

        // GET: Products/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }
    }
}