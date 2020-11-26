using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ChienVHShopOnline.Models;

namespace ChienVHShopOnline.Controllers
{
    public class ContactUsController : Controller
    {
        ChienVHShopDBEntities db = new ChienVHShopDBEntities();
        // GET: ContactUs
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult ValidateCaptcha(FormCollection collection)
        {
            var respone = Request["g-recaptcha-response"];
            const string secret = "6Le2GC8UAAAAAKzGJ7VQ3kIC6zqqbcWFpbp-l6Qv";

            var client = new WebClient();
            var reply = client.DownloadString(
                        string.Format("https://www.google.com/recaptcha/api/siteverify?secret={0}&response={1}",secret,respone)
                );
            var captchaResponse = JsonConvert.DeserializeObject<CaptchaResponse>(reply);

            // Check error returns from google recaptcha
            if (!captchaResponse.Success)
            {
                // TODO: Handle error messages
                if (captchaResponse.ErrorCodes.Count <= 0) return View("Index");
                var error = captchaResponse.ErrorCodes[0].ToLower();
                switch (error)
                {
                    case "missing-input-secret":
                        ViewBag.Message = "Missing secret parameter";
                        break;
                    case "invalid-input-secret":
                        ViewBag.Message = "The secret is invalid or malformed";
                        break;
                    case "missing-input-response":
                        ViewBag.Message = "Missing response parameter";
                        break;
                    case "invalid-input-response":
                        ViewBag.Message = "The response parameter is invalid of malformed";
                        break;
                    default:
                        ViewBag.Message = "Error occured. Please try again later";
                        break;
                }
            }
            else
            {
                // TODO: Handle success case
                ContactU contact = new ContactU()
                {
                    name = collection["cusName"],
                    email = collection["cusEmail"],
                    phone = collection["cusPhone"],
                    content = collection["cusContent"]
                };
                db.ContactUs.Add(contact);
                db.SaveChanges();
                ViewBag.Message = "Your query has been submitted successfully. We will get back you you shortly!";
            }
            return View("Index");
        }
        // GET: ContactUs/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: ContactUs/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: ContactUs/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: ContactUs/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: ContactUs/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: ContactUs/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: ContactUs/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
