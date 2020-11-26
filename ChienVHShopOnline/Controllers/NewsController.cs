using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ChienVHShopOnline.Models;
using PagedList;

namespace ChienVHShopOnline.Controllers
{
    public class NewsController : Controller
    {
        ChienVHShopDBEntities db = new ChienVHShopDBEntities();
        // GET: News
        public ActionResult Index()
        {
            return View();
        }

        public PartialViewResult NewsListPartial(int? page)
        {
            var pageNumber = page ?? 1;
            var pageSize = 2;
            var newsList = db.News.OrderByDescending(x => x.NewsId).ToPagedList(pageNumber, pageSize);
            return PartialView(newsList);
        }
    }
}