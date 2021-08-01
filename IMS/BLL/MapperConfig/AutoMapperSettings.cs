using AutoMapper;
using BEL;
using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.MapperConfig
{
	public class AutoMapperSettings : Profile
	{
        public AutoMapperSettings()
        {
            CreateMap<CategoryModel, category>().ForMember(e => e.products, d => d.Ignore());
          
            CreateMap<ProductModel, product>().ForMember(e => e.category, sm => sm.Ignore());

        }
    }
}
