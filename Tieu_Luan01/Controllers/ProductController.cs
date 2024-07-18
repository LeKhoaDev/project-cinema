using Antlr.Runtime.Tree;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Tieu_Luan01.Models;

namespace Tieu_Luan01.Controllers
{
    public class ProductController : Controller
    {
		PhimOnlineConnect5 objPhimOnline = new PhimOnlineConnect5();
		[HttpGet]
		public ActionResult PhimChieu(int Id = 2)
        {
			Common objcommon = new Common();
			objcommon.ListCategory = objPhimOnline.LoaiPhims.ToList();
			objcommon.ListProduct = objPhimOnline.PHIMs.Where(n => n.maLoai == Id).ToList();
			return View(objcommon);
		}
        public ActionResult PhimSapChieu(int Id = 3) {
			Common objcommon = new Common();
			objcommon.ListCategory = objPhimOnline.LoaiPhims.ToList();
			objcommon.ListProduct = objPhimOnline.PHIMs.Where(n => n.maLoai == Id).ToList();
			return View(objcommon);
		}
		public ActionResult VeTheoPhim(int Id = 4)
		{
			Common objcommon = new Common();
			objcommon.ListCategory = objPhimOnline.LoaiPhims.ToList();
			objcommon.VeMenu = objPhimOnline.VEs.Where(n => n.maLoai == Id).ToList();
			return View(objcommon);
		}
		public ActionResult VeTheoRap(int Id = 4)
		{
			Common objcommon = new Common();
			objcommon.ListCategory = objPhimOnline.LoaiPhims.ToList();
			objcommon.VeMenu = objPhimOnline.VEs.Where(n => n.maLoai == Id).ToList();
			return View(objcommon);
		}
	}
}