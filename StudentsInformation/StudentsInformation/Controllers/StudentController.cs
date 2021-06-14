using StudentsInformation.Models;
using StudentsInformation.Models.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace StudentsInformation.Controllers
{
	public class StudentController : Controller
	{
		public ActionResult DASHBORD()
		{
            Database db = new Database();
            var Students = db.Students.GetAll();
            return View(Students);
		}

        public ActionResult Create()
        {
            Student p = new Student();
            return View(p);
        }
        [HttpPost]
        public ActionResult Create(Student p)
        {
            
            if (ModelState.IsValid)
            {
                Database db = new Database();
                db.Students.Insert(p);
                return RedirectToAction("DASHBORD");
            }
            return View();

        }

        public ActionResult Edit(int id)
        {

            Database db = new Database();
            var p = db.Students.Get(id);

            return View(p);
        }
        [HttpPost]
        public ActionResult Edit(Student p)
        {
            Database db = new Database();
            db.Students.Update(p);
            return RedirectToAction("DASHBORD");
        }
        public ActionResult Delete(int id)
        {

            Database db = new Database();
            var p = db.Students.Get(id);

            return View(p);
        }
        [HttpPost]
        public ActionResult Delete(Student p)
        {
            Database db = new Database();
            db.Students.Delete(p);
            return RedirectToAction("DASHBORD");
        }
    }
}