using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Tieu_Luan01.Models;

namespace Tieu_Luan01.Areas.PrivatePages.Controllers
{
    public class LoaiHangController : Controller
    {
		private static bool isUpdate = false;
		// GET: PrivatePages/LoaiHang
		[HttpGet]// GET: PrivatePages/LoaiHang
		public ActionResult Index()
        {
			List<LoaiPhim> l = new PhimOnlineConnect5().LoaiPhims.OrderBy(x => x.tenLoai).ToList<LoaiPhim>();
			ViewData["DsLoai"] = l;
			return View();
		}
		[HttpPost]
		public ActionResult Index(LoaiPhim x)
		{
			PhimOnlineConnect5 db = new PhimOnlineConnect5();
			if (!isUpdate)
				db.LoaiPhims.Add(x);
			else
			{
				LoaiPhim y = db.LoaiPhims.Find(x.maLoai);
				y.tenLoai = x.tenLoai;
				y.ghiChu = x.ghiChu;
				isUpdate = false;
			}
			//B1:Add
			db.LoaiPhims.Add(x);
			//Cập nhập thay đổi
			db.SaveChanges();
			//B2:Upadte

			ViewData["DsLoai"] = db.LoaiPhims.OrderBy(z => z.tenLoai).ToList<LoaiPhim>();
			return View();
		}
		[HttpPost]
		public ActionResult Delete(string maLoai)
		{
			PhimOnlineConnect5 db = new PhimOnlineConnect5();
			int ma = int.Parse(maLoai);
			//Find LoaiSP
			LoaiPhim x = db.LoaiPhims.Find(ma);
			//Remove LoaiSP
			db.LoaiPhims.Remove(x);
			//Update
			db.SaveChanges();
			//Upadte data on View
			ViewData["DsLoai"] = db.LoaiPhims.OrderBy(z => z.tenLoai).ToList<LoaiPhim>();
			return View("Index");
		}
		[HttpPost]
		public ActionResult Update(string ml)
		{
			PhimOnlineConnect5 db = new PhimOnlineConnect5();
			int ma = int.Parse(ml);
			//B1:Find LoaiSP
			LoaiPhim x = db.LoaiPhims.Find(ma);
			isUpdate = true;
			//--------------------------------------------------------------------------
			ViewData["DsLoai"] = db.LoaiPhims.OrderBy(z => z.tenLoai).ToList<LoaiPhim>();
			return View("Index", x);
		}
	}
}