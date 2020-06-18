using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using RentalManagement.Models;

namespace RentalManagement.Controllers
{
    public class InvoicesController : Controller
    {
        private RentalManagementEntities db = new RentalManagementEntities();

        // GET: Invoices
        public ActionResult Index()
        {
            var invoices = db.Invoices.Include(i => i.Equipment).Include(i => i.User).Include(i => i.Job).Include(i => i.Rental).Include(i => i.Vendor);
            return View(invoices.ToList());
        }

        // GET: Invoices/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Invoice invoice = db.Invoices.Find(id);
            if (invoice == null)
            {
                return HttpNotFound();
            }
            return View(invoice);
        }

        // GET: Invoices/Create
        public ActionResult Create()
        {
            ViewBag.Equipment_ID = new SelectList(db.Equipments, "Equipment_Id", "Equipment_Category");
            ViewBag.User_ID = new SelectList(db.Users, "User_ID", "FirstName");
            ViewBag.Job_ID = new SelectList(db.Jobs, "Job_ID", "Job_Description");
            ViewBag.Rental_ID = new SelectList(db.Rentals, "Rental_ID", "Rental_ID");
            ViewBag.Vendor_ID = new SelectList(db.Vendors, "Vendor_ID", "SalesPerson");
            return View();
        }

        // POST: Invoices/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Invoice_ID,User_ID,Invoice_No,Amount,Job_ID,Rental_ID,Equipment_ID,Vendor_ID")] Invoice invoice)
        {
            if (ModelState.IsValid)
            {
                db.Invoices.Add(invoice);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Equipment_ID = new SelectList(db.Equipments, "Equipment_Id", "Equipment_Category", invoice.Equipment_ID);
            ViewBag.User_ID = new SelectList(db.Users, "User_ID", "FirstName", invoice.User_ID);
            ViewBag.Job_ID = new SelectList(db.Jobs, "Job_ID", "Job_Description", invoice.Job_ID);
            ViewBag.Rental_ID = new SelectList(db.Rentals, "Rental_ID", "Rental_ID", invoice.Rental_ID);
            ViewBag.Vendor_ID = new SelectList(db.Vendors, "Vendor_ID", "SalesPerson", invoice.Vendor_ID);
            return View(invoice);
        }

        // GET: Invoices/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Invoice invoice = db.Invoices.Find(id);
            if (invoice == null)
            {
                return HttpNotFound();
            }
            ViewBag.Equipment_ID = new SelectList(db.Equipments, "Equipment_Id", "Equipment_Category", invoice.Equipment_ID);
            ViewBag.User_ID = new SelectList(db.Users, "User_ID", "FirstName", invoice.User_ID);
            ViewBag.Job_ID = new SelectList(db.Jobs, "Job_ID", "Job_Description", invoice.Job_ID);
            ViewBag.Rental_ID = new SelectList(db.Rentals, "Rental_ID", "Rental_ID", invoice.Rental_ID);
            ViewBag.Vendor_ID = new SelectList(db.Vendors, "Vendor_ID", "SalesPerson", invoice.Vendor_ID);
            return View(invoice);
        }

        // POST: Invoices/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Invoice_ID,User_ID,Invoice_No,Amount,Job_ID,Rental_ID,Equipment_ID,Vendor_ID")] Invoice invoice)
        {
            if (ModelState.IsValid)
            {
                db.Entry(invoice).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Equipment_ID = new SelectList(db.Equipments, "Equipment_Id", "Equipment_Category", invoice.Equipment_ID);
            ViewBag.User_ID = new SelectList(db.Users, "User_ID", "FirstName", invoice.User_ID);
            ViewBag.Job_ID = new SelectList(db.Jobs, "Job_ID", "Job_Description", invoice.Job_ID);
            ViewBag.Rental_ID = new SelectList(db.Rentals, "Rental_ID", "Rental_ID", invoice.Rental_ID);
            ViewBag.Vendor_ID = new SelectList(db.Vendors, "Vendor_ID", "SalesPerson", invoice.Vendor_ID);
            return View(invoice);
        }

        // GET: Invoices/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Invoice invoice = db.Invoices.Find(id);
            if (invoice == null)
            {
                return HttpNotFound();
            }
            return View(invoice);
        }

        // POST: Invoices/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Invoice invoice = db.Invoices.Find(id);
            db.Invoices.Remove(invoice);
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
    }
}
