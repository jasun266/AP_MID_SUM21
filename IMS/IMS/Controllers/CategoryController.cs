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
    public class CategoryController : ApiController
    {
       
        [Route("api/category/GetAll")]
        [HttpGet]
        public List<CategoryModel> GetAllCategories()
        {
            return CategoryService.GetCategories();
        }
        [Route("api/category/Add")]
        [HttpPost]
        public void Add(CategoryModel ctg)
        {
            CategoryService.AddCategory(ctg);
        }
      
    }
}
