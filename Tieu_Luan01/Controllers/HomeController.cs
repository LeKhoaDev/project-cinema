using Antlr.Runtime.Tree;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Tieu_Luan01.Models;

namespace Tieu_Luan01.Controllers
{
	public class HomeController : Controller
	{
		PhimOnlineConnect5 objPhimOnline = new PhimOnlineConnect5();
		[HttpGet]
		public ActionResult Index(int Id = 5)
		{
			Common objcommon = new Common();
			objcommon.ListCategory = objPhimOnline.LoaiPhims.ToList();
			objcommon.Menu = objPhimOnline.MenuPhims.Where(n => n.maLoai == Id).ToList();
			return View(objcommon);
		}
		public ActionResult Index01(int Id = 6)
		{
			Common objcommon = new Common();
			objcommon.ListCategory = objPhimOnline.LoaiPhims.ToList();
			objcommon.Menu = objPhimOnline.MenuPhims.Where(n => n.maLoai == Id).ToList();
			return View(objcommon);
		}
		public ActionResult About()
		{
			ViewBag.Message = "Your application description page.";

			return View();
		}

		public ActionResult Contact()
		{
			ViewBag.Message = "Your contact page.";

			return View();
		}
	}
}