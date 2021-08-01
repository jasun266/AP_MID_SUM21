using BEL;
using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
	 public class ProductService
	{
        public static void AddProduct(ProductModel model)
        {
            var data = AutoMapper.Mapper.Map<ProductModel, product>(model);
            productRepo.AddProduct(data);
        }
        public static ProductModel GetProduct(int id)
        {
            var data = productRepo.GetProduct(id);
            var st = AutoMapper.Mapper.Map<product, ProductModel>(data);
            return st;
        }
        public static List<ProductModel> GetAllProducts()
        {
            var data = productRepo.GetAllProducts();
            var pd = AutoMapper.Mapper.Map<List<product>,List<ProductModel>>(data);
            //var pd = AutoMapper.Mapper.Map<List<product>, List<ProductModel>>(data);
            return pd;
        }
        

        public static List<string> GetProductNames()
        {
            var data = productRepo.GetProductNames();
            return data;
        }
    }
}
