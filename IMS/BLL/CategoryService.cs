using BEL;
using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
	public class CategoryService
	{
        
        public static List<CategoryModel> GetCategories()
        {
            var categories = CategoryRepo.GetCategories();
            var data = AutoMapper.Mapper.Map<List<category>, List<CategoryModel>>(categories);
            return data;
        }
        public static void AddCategory(CategoryModel ctg)
        {
            var c = AutoMapper.Mapper.Map<CategoryModel, category>(ctg);
            
            CategoryRepo.AddCategory(c);
        }

      
    }
}
