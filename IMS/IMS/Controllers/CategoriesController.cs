using BEL;
using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace IMS.Controllers
{
    public class CategoriesController : ApiController
    {
       

        [Route("api/category/GetAll")]
        [HttpGet]
        public List<categoryModel> Getcategorys()
        {
            return categoryservice.Getcategories();
        }
        [Route("api/category/Add")]
        [HttpPost]
        public void Add(categoryModel ctg)
        {
            categoryservice.Addcategory(ctg);
        }
       
    }
}
