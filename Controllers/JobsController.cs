using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using RentalManagement.Models;
using PagedList;

namespace RentalManagement.Controllers
{
    public class JobsController : Controller
    {
        private RentalManagementEntities db = new RentalManagementEntities();

        // GET: Jobs

        public ActionResult Index(String sortOrder, String searchString, String Filter_Value, int? Page_No)
        {
            ViewBag.CurrentSort = sortOrder;
            ViewBag.TitleSortParam = String.IsNullOrEmpty(sortOrder) ? "Title_DESC" : "";
            ViewBag.StartDateSortParam = sortOrder == "Start_Date" ? "Start_DESC" : "Start_Date";
            ViewBag.EndDateSortParam = sortOrder == "End_Date" ? "End_DESC" : "End_Date";
            ViewBag.UpdateDateSortParam = sortOrder == "Last_Updated" ? "Updated_DESC" : "Last_Updated";


            if (searchString != null)
            {
                Page_No = 1;
            }
            else
            {
                searchString = Filter_Value;
            }

            ViewBag.FilterValue = searchString;
            var jobs = from j in db.Jobs
                          select j;

            if (!String.IsNullOrEmpty(searchString))
            {

                jobs = jobs.Where(j => j.Job_Title.Contains(searchString));
            }

            switch (sortOrder)
            {

                case "Title_DESC":
                    jobs = jobs.OrderByDescending(j => j.Job_Title);
                    break;
                case "Start_Date":
                    jobs = jobs.OrderBy(j => j.Start_Date);
                    break;
                case "Start_DESC":
                    jobs = jobs.OrderByDescending(j => j.Start_Date);
                    break;

                case "End_Date":
                    jobs = jobs.OrderBy(j => j.End_Date);
                    break;
                case "End_DESC":
                    jobs = jobs.OrderByDescending(j => j.End_Date);
                    break;
                case "Last_Updated":
                    jobs = jobs.OrderBy(j => j.Start_Date);
                    break;
                case "Updated_DESC":
                    jobs = jobs.OrderByDescending(j => j.Start_Date);
                    break;
                default:
                    jobs = jobs.OrderBy(j => j.Job_Title);
                    break;
            }

            int Page_size = 10;
            int PageNumber = (Page_No ?? 1);
            return View(jobs.ToPagedList(PageNumber, Page_size));



        }
       /* public ActionResult Index()
        {
            return View(db.Jobs.ToList());
        }
        */

        // GET: Jobs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Job job = db.Jobs.Find(id);
            if (job == null)
            {
                return HttpNotFound();
            }
            return View(job);
        }

        // GET: Jobs/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Jobs/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Job_ID,Start_Date,End_Date,Job_Description,Last_Update,Job_Title")] Job job)
        {
            if (job!= null) job.Last_Update = DateTime.UtcNow;

            if (ModelState.IsValid)
            {
                db.Jobs.Add(job);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(job);
        }

        // GET: Jobs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Job job = db.Jobs.Find(id);
            if (job == null)
            {
                return HttpNotFound();
            }
            return View(job);
        }

        // POST: Jobs/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Job_ID,Start_Date,End_Date,Job_Description,Last_Update,Job_Title")] Job job)
        {
            if (job != null) job.Last_Update = DateTime.UtcNow;
            if (ModelState.IsValid)
            {
                db.Entry(job).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(job);
        }

        // GET: Jobs/Delete/5
      public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Job job = db.Jobs.Find(id);
            if (job == null)
            {
                return HttpNotFound();
            }
            return View(job);
        }
        

        // POST: Jobs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {

            Job job = db.Jobs.Find(id);
            db.Jobs.Remove(job);
            db.SaveChanges();
           /* try
            {
               
                String message= "SUCCESS";
                return Json(new { Message = message, JsonRequestBehavior.AllowGet });
            }
            catch
            {

                return Json(new { Message = "FAIL", JsonRequestBehavior.AllowGet });
            }    */   
            
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
    }
}
