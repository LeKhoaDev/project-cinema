using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Tieu_Luan01.Models;
using Tieu_Luan01.Areas.PrivatePages.Model;
using System.IO;

namespace Tieu_Luan01.Areas.PrivatePages.Controllers
{
    public class DangbaiController : Controller
    {
		// GET: PrivatePages/Dangbai
		[HttpGet]
		public ActionResult Index()
        {
			BaiViet x = new BaiViet();
			//thiết lập thông tin mặc định
			x.ngayDang = DateTime.Now;
			x.soLanDoc = 0;
			x.taiKhoan = Usua.GetTenTaiKhoan();
			ViewBag.ddHinh = "/Materials/Images/DangBai/text_01.jpg";
			return View(x);
		}
		[HttpPost]
		[ValidateInput(false)]
		public ActionResult Index(BaiViet x, HttpPostedFileBase HinhDaiDien)
		{
			try
			{
				//B1: Xử lý thông tin
				x.maBV = string.Format("{0:yyMMddhhmm}", DateTime.Now);
				x.daDuyet = false;
				x.ngayDang = DateTime.Now;
				x.taiKhoan = Usua.GetTenTaiKhoan();
				x.soLanDoc = 0;
				x.loaiTin = "QC";
				//-------------------
				if (HinhDaiDien != null)
				{
					//B1: Save Imnages 
					string virPath = "/Materials/Images/DangBai/";
					string phyPath = Server.MapPath("~/" + virPath); //xác định vị trí lưu hình
																	 //B2: đặt tên
					string ext = Path.GetExtension(HinhDaiDien.FileName);
					string tenF = "HDD" + x.maBV + ext;
					HinhDaiDien.SaveAs(phyPath + tenF); //lưu dựa vào đường dẫn vật lý
					x.hinhDD = virPath + tenF; // đường ảo theo domain
											   //Cập nhập hình vừa đăng
					ViewBag.ddHinh = x.hinhDD;
				}
				else
				{
					x.hinhDD = "";
				}
				//B2: Cập nhập đối tượng bài viết vào data model
				PhimOnlineConnect5 db = new PhimOnlineConnect5();
				db.BaiViets.Add(x);
				//B3: Lưu thông tin vào database
				db.SaveChanges();
				return RedirectToAction("Index", "DanhmucBV", new { IsActive = 0 });
			}
			catch
			{

			}
			return View(x);
		}
	}
}