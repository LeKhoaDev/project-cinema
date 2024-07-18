using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Tieu_Luan01.Models;

namespace Tieu_Luan01.Controllers
{
    public class LoginController : Controller
    {
		[HttpGet]
		// GET: Login
		public ActionResult Index()
        {
			return View();
		}
		[HttpPost]
		[ValidateAntiForgeryToken]
		public ActionResult Index(string Admin, string Password)
		{
			//đọc tài khoản từ database để xét có đúng tài khoản vs mật khẩu
			TaiKhoan tk = new PhimOnlineConnect5().TaiKhoans.Where(x => x.taiKhoan1.Equals(Admin.ToLower().Trim()) && x.matKhau.Equals(Password)).FirstOrDefault<TaiKhoan>();
			//If nhập đúng vào được database
			bool isAuthentic = tk != null && tk.taiKhoan1.Equals(Admin.ToLower().Trim()) && tk.matKhau.Equals(Password);
			if (isAuthentic)
			{
				Session["TtDangNhap"] = tk;
				return RedirectToAction("Index", "Dashboard", new { Area = "PrivatePages" });

			}

			return View();
		}
	}
}