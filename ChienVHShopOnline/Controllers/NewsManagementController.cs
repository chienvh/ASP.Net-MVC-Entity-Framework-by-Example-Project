using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ChienVHShopOnline.Models;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ChienVHShopOnline.Controllers
{
    public class NewsManagementController : Controller
    {
        private ChienVHShopDBEntities db = new ChienVHShopDBEntities();

        // GET: NewsManagement
        public ActionResult Index()
        {
            var news = db.News.Include(n => n.User);
            return View(news.ToList());
        }

        // GET: NewsManagement/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            News news = db.News.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }
            return View(news);
        }

        // GET: NewsManagement/Create
        public ActionResult Create()
        {
            ViewBag.UserId = new SelectList(db.Users, "UserId", "Username");
            return View();
        }

        // POST: NewsManagement/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "NewsId,UserId,Title,ShortDescription,Image,Content,CreatedDate,Status")] News news)
        {
            if (ModelState.IsValid)
            {
                db.News.Add(news);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.UserId = new SelectList(db.Users, "UserId", "Username", news.UserId);
            return View(news);
        }

        // GET: NewsManagement/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            News news = db.News.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }
            ViewBag.UserId = new SelectList(db.Users, "UserId", "Username", news.UserId);
            return View(news);
        }

        // POST: NewsManagement/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "NewsId,UserId,Title,ShortDescription,Image,Content,CreatedDate,Status")] News news)
        {
            if (ModelState.IsValid)
            {
                db.Entry(news).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.UserId = new SelectList(db.Users, "UserId", "Username", news.UserId);
            return View(news);
        }

        // GET: NewsManagement/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            News news = db.News.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }
            return View(news);
        }

        // POST: NewsManagement/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            News news = db.News.Find(id);
            db.News.Remove(news);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        public void ExportContentToCSV()
        {
            var strw = new StringWriter();
            strw.WriteLine("\"NewsId\",\"Title\",\"ShortDescription\",\"CreatedDate\",\"Status\"");
            Response.ClearContent();
            Response.AddHeader("content-disposition",
                                string.Format("attachment;filename=NewsListing_{0}.csv",DateTime.Now));
            Response.ContentType = "text/csv";

            var listNews = db.News.OrderBy(x => x.NewsId).ToList();
            foreach (var news in listNews)
            {
                strw.WriteLine(string.Format("\"{0}\",\"{1}\",\"{2}\",\"{3}\",\"{4}\"",
                              news.NewsId, news.Title, news.ShortDescription,news.CreatedDate, news.Status));
            }
            Response.Write(strw.ToString());
            Response.End();
        }

        public void ExportContentToExcel()
        {
            var gv = new GridView()
            {
                DataSource = db.News.OrderBy(x => x.NewsId).ToList()
            };
            gv.DataBind();

            Response.ClearContent();
            Response.AddHeader("content-disposition",
                                string.Format("attachment;filename=NewsListing_{0}.xls", DateTime.Now));
            Response.ContentType = "application/excel";

            var strw = new StringWriter();
            var htmlTw = new HtmlTextWriter(strw);

            gv.RenderControl(htmlTw);
            Response.Write(strw.ToString());
            Response.End();
        }
    }
}
