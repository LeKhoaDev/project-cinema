using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using Microsoft.Ajax.Utilities;
using System.Runtime.CompilerServices;
using Tieu_Luan01.Models;
using System.Web.Configuration;
namespace Tieu_Luan01.Models
{
	public class Common
	{
		PhimOnlineConnect5 objonlineDemoEntities18 = new PhimOnlineConnect5();
		static DbContext cn = new DbContext("name=PhimOnlineConnect");

		public List<PHIM> ListProduct { get; set; }
		public List<LoaiPhim> ListCategory { get; set; }

		public List<PHIM> PostProduct { get; set; }
		public List<PHIM> LstProduct { get; set; }
		public List<VE> VeMenu { get; set; }
		public List<MenuPhim> Menu { get; set; }

		public static MenuPhim GetMenuPhimbyId(int? MAPHIM)
		{
			return cn.Set<MenuPhim>().Find(MAPHIM);
		}
		//Lấy đường dẫn tên sản phẩm tai menu
		public static string getNameMenuById(int? MAPHIM)
		{
			return cn.Set<MenuPhim>().Find(MAPHIM).TENPHIM;
		}
		//Lấy đường dẫn hình đại diện menu
		public static string getImagesMenuById(int? MAPHIM)
		{
			return cn.Set<MenuPhim>().Find(MAPHIM).hinhDD;
		}


		public static PHIM GetProductById(int? MAPHIM)
		{
			return cn.Set<PHIM>().Find(	MAPHIM);
		}
		//Lấy đường dẫn tên sản phẩm
		public static string getNameOfProductById(int? MAPHIM)
		{
			return cn.Set<PHIM>().Find(MAPHIM).TENPHIM;
		}
		//Lấy đường dẫn hình đại diện
		public static string getImagesOfProductById(int? MAPHIM)
		{
			return cn.Set<PHIM>().Find(MAPHIM).hinhDD;
		}
		/// <summary>
		/// Ve Xem Phim
		/// </summary>
		/// <param name="n"></param>
		/// <returns></returns>
		public static VE GetVEById(int MAPHIM)
		{
			return cn.Set<VE>().Find(MAPHIM);
		}
		//Lấy đường dẫn tên sản phẩm
		public static string getNameVEById(int MAPHIM)
		{
			return cn.Set<VE>().Find(MAPHIM).TENPHIM;
		}
		//Lấy đường dẫn hình đại diện
		public static string getImagesVEById(int MAPHIM)
		{
			return cn.Set<VE>().Find(MAPHIM).hinhDD;
		}



		// Bai Viet 
		public static List<BaiViet> getBaiViet(int n)
		{
			List<BaiViet> l = new List<BaiViet>();
			PhimOnlineConnect5 db = new PhimOnlineConnect5();
			l = db.BaiViets.Where(m => m.daDuyet == true).OrderByDescending(bv => bv.ngayDang).Take(n).ToList<BaiViet>();
			return l;
		}

	}
}