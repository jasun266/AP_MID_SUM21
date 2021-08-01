using Feedhub.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Feedhub.Controllers
{
    public class advertiserController : Controller
    {
        FHEntities db = new FHEntities();
        // GET: advertiser
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(AccountInfo ac)
        {
            AccountInfo a = db.AccountInfoes.Where(x => x.Name == ac.Name && x.Password == ac.Password).SingleOrDefault();
            if (a != null)
            {
                Session["ID"] = a.ID.ToString();
                Session["Address"] = a.Address.ToString();
                Session["Phone"] = a.Phone.ToString();
                Session["Email"] = a.Email.ToString();
                return RedirectToAction("Index");
            }
            else
            {
                ViewBag.error = "Invalid username or password";

            }
            return View();
        }
        public ActionResult Create()
        {

            if (Session["ID"] == null)
            {
                return RedirectToAction("login");
            }
            return View();
        }


        [HttpPost]
        public ActionResult Create(Category cg, HttpPostedFileBase Image)
        {
            string path = uploadimgfile(Image);
            if (path.Equals("-1"))
            {
                ViewBag.error = "Image could not be uploaded....";
            }
            else
            {
                Category c = new Category();
                c.Name = cg.Name;
                c.Image = path;
                c.Add_PID = Convert.ToInt32(Session["ID"].ToString());

                db.Categories.Add(c);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View();
        } //end,,,,,,,,,,,,,,,,,,,



        public ActionResult Index(int? page)
        {
            if (Session["ID"] == null)
            {
                return RedirectToAction("login");
            }
            else
            {

                int pagesize = 7, pageindex = 1;
                pageindex = page.HasValue ? Convert.ToInt32(page) : 1;
                var list = db.Categories.OrderByDescending(x => x.ID).ToList();
                IPagedList<Category> stu = list.ToPagedList(pageindex, pagesize);

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

                        //    ViewBag.Message = "File uploaded successfully";
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
            if (Session["ID"] == null)
            {
                return RedirectToAction("login");
            }
            List<Category> li = db.Categories.ToList();
            ViewBag.categorylist = new SelectList(li, "ID", "Name");

            return View();
        }

        [HttpPost]
        public ActionResult PostAd(add p, HttpPostedFileBase Image)
        {

            List<Category> li = db.Categories.ToList();
            ViewBag.categorylist = new SelectList(li, "ID", "Name");


            string path = uploadimgfile(Image);
            if (path.Equals("-1"))
            {
                ViewBag.error = "Image could not be uploaded....";
            }
            else
            {
                add a = new add();



                a.Name = p.Name;
                a.Price = p.Price;
                a.Image = path;
                a.Discription = p.Discription;
                a.advertiser_id = Convert.ToInt32(Session["ID"].ToString());
                a.Category_id = p.Category_id;
                a.Shop_id = p.Shop_id;
                a.Address_id = Convert.ToInt32(Session["Address"].ToString());
                db.adds.Add(a);
                db.SaveChanges();
                Response.Redirect("Index");

            }

            return View();
        }

        public ActionResult Ads(int? id, int? page)
        {
            if (Session["ID"] == null)
            {
                return RedirectToAction("login");
            }
            int pagesize = 5, pageindex = 1;
            pageindex = page.HasValue ? Convert.ToInt32(page) : 1;
            var list = db.adds.Where(x => x.Category_id == id).OrderByDescending(x => x.ID).ToList();
            IPagedList<add> stu = list.ToPagedList(pageindex, pagesize);


            return View(stu);


        }

        [HttpPost]
        public ActionResult Ads(int? id, int? page, string search)
        {
            int pagesize = 6, pageindex = 1;
            pageindex = page.HasValue ? Convert.ToInt32(page) : 1;
            var list = db.adds.Where(x => x.Name.Contains(search)).OrderByDescending(x => x.ID).ToList();
            IPagedList<add> stu = list.ToPagedList(pageindex, pagesize);


            return View(stu);


        }
        public ActionResult ViewAd(int? id)
        {

            if (Session["ID"] == null)
            {
                return RedirectToAction("login");
            }
            Detail d = new Detail();

            add a = db.adds.Where(x => x.ID == id).SingleOrDefault();

            d.ID= a.ID;
            d.Name = a.Name;
            d.Image = a.Image;
            d.Price = a.Price;
            d.Discription = a.Discription;

            Address adrs = db.Addresses.Where(x => x.Advertiser_id == a.advertiser_id).SingleOrDefault();
            d.Area = adrs.Area;
            d.Country = adrs.Country;
            d.City = adrs.City;
            d.Thana = adrs.Thana;

            Email e = db.Emails.Where(x => x.Address_id == a.advertiser_id).SingleOrDefault();

            d.Email1 = e.Email1;

            Phone p = db.Phones.Where(x => x.Address_id == a.advertiser_id).SingleOrDefault();
            d.PhoneNumber = p.PhoneNumber;





            return View(d);
        }

    }
}