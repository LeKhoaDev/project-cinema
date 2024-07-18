using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Tieu_Luan01.Models;

namespace Tieu_Luan01.Areas.PrivatePages.Controllers
{
    public class DanhmucBVController : Controller
    {
		private static PhimOnlineConnect5 db = new PhimOnlineConnect5();
		private static bool daDuyet;
		[HttpGet]
		// GET: PrivatePages/DanhmucBV
		public ActionResult Index(string IsActive)
        {
			daDuyet = IsActive.Equals("1");
			Updatedatabase();
			return View();
		}
		[HttpPost]
		public ActionResult Delete(string maBaiViet)
		{
			//dùng lệnh xóa bài viết
			BaiViet x = db.BaiViets.Find(maBaiViet);
			db.BaiViets.Remove(x);
			//cập nhập database
			db.SaveChanges();
			//hiển thị lại danh sách sau update
			Updatedatabase();
			return View("Index");
		}
		public ActionResult Active(string maBaiViet)
		{
			//dùng lệnh cấm bài viết
			BaiViet x = db.BaiViets.Find(maBaiViet);
			x.daDuyet = !daDuyet;
			//cập nhập database
			db.SaveChanges();
			//hiển thị lại danh sách sau update
			Updatedatabase();
			return View("Index");
		}
		/// <summary>
		/// hàm phục vụ việc cập nhập dữ liệu.
		/// </summary>
		private void Updatedatabase()
		{
			List<BaiViet> l = db.BaiViets.Where(x => x.daDuyet == daDuyet).ToList<BaiViet>();
			ViewData["DanhSachBV"] = l;
			ViewBag.tdCuaNut = daDuyet ? "Cấm hiển thị" : "Kiểm duyệt bài";
		}
	}
}