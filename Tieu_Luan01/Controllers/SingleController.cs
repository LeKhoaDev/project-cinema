using Antlr.Runtime.Tree;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Tieu_Luan01.Models;

namespace Tieu_Luan01.Controllers
{
    public class SingleController : Controller
    {
		PhimOnlineConnect5 objPhimOnline = new PhimOnlineConnect5();
		[HttpGet]
		public ActionResult Index(int? Id)
        {
			Common objcommon = new Common();
			objcommon.ListProduct = objPhimOnline.PHIMs.ToList();
			objcommon.ListCategory = objPhimOnline.LoaiPhims.ToList();
			objcommon.LstProduct = objPhimOnline.PHIMs.Where(n => n.MAPHIM == Id).ToList();
			return View(objcommon);
		}
    }
}