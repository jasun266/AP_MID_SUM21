using PagedList;
using ReviewHub.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ReviewHub.Controllers
{
    public class advertiserController : Controller
    {
        ReviewHubEntities db = new ReviewHubEntities();
       
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(user ac)
        {
            user a = db.users.Where(x => x.Username == ac.Username && x.Password == ac.Password).SingleOrDefault();
            if (a != null)
            {
                Session["Id"] = a.Id.ToString();
               
                return RedirectToAction("AllAds");
            }
            else
            {
                ViewBag.error = "Invalid username or password";

            }
            return View();
        }
        public ActionResult Create()
        {

            if (Session["Id"] == null)
            {
                return RedirectToAction("login");
            }
            return View();
        }


        [HttpPost]
        public ActionResult Create(advertise_categories cg, HttpPostedFileBase Image)
        {
            string path = uploadimgfile(Image);
            if (path.Equals("-1"))
            {
                ViewBag.error = "Image could not be uploaded....";
            }
            else
            {
                advertise_categories c = new advertise_categories();
                c.Name = cg.Name;
                c.Image = path;
          

                db.advertise_categories .Add(c);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View();
        }



        public ActionResult Index(int? page, string search)
        {
            if (Session["Id"] == null)
            {
                return RedirectToAction("login");
            }
            else
            {

                int pagesize = 7, pageindex = 1;
                pageindex = page.HasValue ? Convert.ToInt32(page) : 1;
                var list = db.advertise_categories.OrderByDescending(x => x.Id).ToList();
                
                IPagedList<advertise_categories> stu = list.ToPagedList(pageindex, pagesize);

                return View(stu);

            }


        }




        public string uploadimgfile(HttpPostedFileBase file)
        {
            Random r = new Random();
            string path = "-1";
            int random = r.Next();
            if (file != null && file.ContentLength > 0)
            {
                string extension = Path.GetExtension(file.FileName);
                if (extension.ToLower().Equals(".jpg") || extension.ToLower().Equals(".jpeg") || extension.ToLower().Equals(".png"))
                {
                    try
                    {

                        path = Path.Combine(Server.MapPath("~/Content/upload"), random + Path.GetFileName(file.FileName));
                        file.SaveAs(path);
                        path = "~/Content/upload/" + random + Path.GetFileName(file.FileName);

                        
                    }
                    catch (Exception ex)
                    {
                        path = "-1";
                    }
                }
                else
                {
                    Response.Write("<script>alert('Only jpg ,jpeg or png formats are acceptable....'); </script>");
                }
            }

            else
            {
                Response.Write("<script>alert('Please select a file'); </script>");
                path = "-1";
            }



            return path;
        }
        [HttpGet]
        public ActionResult PostAd()
        {
            if (Session["Id"] == null)
            {
                return RedirectToAction("login");
            }
            List<advertise_categories> li = db.advertise_categories.ToList();
            ViewBag.categorylist = new SelectList(li, "Id", "Name");

            return View();
        }

        [HttpPost]
        public ActionResult PostAd(Detail p, HttpPostedFileBase Image)
        {

            List<advertise_categories> li = db.advertise_categories.ToList();
            ViewBag.categorylist = new SelectList(li, "Id", "Name");


            string path = uploadimgfile(Image);
            if (path.Equals("-1"))
            {
                ViewBag.error = "Image could not be uploaded....";
            }
            else
            {
                advertis a = new advertis();
                advertise_locations al = new advertise_locations();



                a.Title = p.Title;
                a.Image = path;
                a.Description = p.Description;
                a.UserId = Convert.ToInt32(Session["Id"].ToString());
                a.ExpirationDate = p.ExpirationDate;
                a.AdvertiseCategoryId = p.AdvertiseCategoryId;
                a.Created_at = p.Created_at;
                al.Street = p.Street;
                al.City = p.City;
                al.Country = p.Country;
                al.Zip = p.Zip;
                db.advertise_locations.Add(al);
                db.advertises.Add(a);
                db.SaveChanges();
                Response.Redirect("AllAds");

            }

            return View();
        }

        public ActionResult Ads(int? id, int? page)
        {
            if (Session["Id"] == null)
            {
                return RedirectToAction("login");
            }
            int pagesize = 5, pageindex = 1;
            pageindex = page.HasValue ? Convert.ToInt32(page) : 1;
            var list = db.advertises.Where(x => x.AdvertiseCategoryId == id).OrderByDescending(x => x.Id).ToList();
            IPagedList<advertis> stu = list.ToPagedList(pageindex, pagesize);


            return View(stu);


        }

        [HttpPost]
        public ActionResult Ads(int? page, string search)
        {
            int pagesize = 6, pageindex = 1;
            pageindex = page.HasValue ? Convert.ToInt32(page) : 1;
            var list = db.advertises.Where(x => x.Title.Contains(search)).OrderByDescending(x => x.Id).ToList();
            IPagedList<advertis> stu = list.ToPagedList(pageindex, pagesize);


            return View(stu);


        }
        public ActionResult AllAds(int? page)
        {
            if (Session["Id"] == null)
            {
                return RedirectToAction("login");
            }
            int pagesize = 5, pageindex = 1;
            pageindex = page.HasValue ? Convert.ToInt32(page) : 1;
            var list = db.advertises.OrderByDescending(x => x.Id).ToList();
            IPagedList<advertis> stu = list.ToPagedList(pageindex, pagesize);


            return View(stu);
        }
        [HttpPost]
        public ActionResult AllAds(int? page, string search)
        {
            if (Session["Id"] == null)
            {
                return RedirectToAction("login");
            }
            int pagesize = 5, pageindex = 1;
            pageindex = page.HasValue ? Convert.ToInt32(page) : 1;
            var list = db.advertises.Where(x => x.Title.Contains(search)).OrderByDescending(x => x.Id).ToList();
            IPagedList<advertis> stu = list.ToPagedList(pageindex, pagesize);


            return View(stu);
        }

        public ActionResult ViewAd(int? id)
        {

            if (Session["Id"] == null)
            {
                return RedirectToAction("login");
            }
            Detail d = new Detail();

            advertis a = db.advertises.Where(x => x.Id == id).SingleOrDefault();

            d.Id = a.Id;
            d.Title = a.Title;
            d.Image = a.Image;
            d.Description = a.Description;
            d.UserId = a.UserId;

            advertise_categories adc = db.advertise_categories.Where(x=>x.Id == a.AdvertiseCategoryId).SingleOrDefault();
            d.Name = adc.Name;
            

            advertise_locations adrs = db.advertise_locations.Where(x => x.AdvertiseId == a.Id).SingleOrDefault();
            d.Street = adrs.Street;
            d.Country = adrs.Country;
            d.City = adrs.City;
            d.Zip = adrs.Zip;

            user u = db.users.Where(x => x.Id == a.UserId).SingleOrDefault();

            d.Username = u.Username;
            d.Email = u.Email;

            return View(d);
        }
        public ActionResult Signout()
        {
            Session.RemoveAll();
            Session.Abandon();

            return RedirectToAction("AllAds");
        }



        public ActionResult DeleteAd(int? id)
        {

            advertis p = db.advertises.Where(x => x.Id == id).SingleOrDefault();
            db.advertises.Remove(p);
            db.SaveChanges();

            return RedirectToAction("AllAds");
        }

    }
}