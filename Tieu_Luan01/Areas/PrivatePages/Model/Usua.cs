using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Tieu_Luan01.Models;

namespace Tieu_Luan01.Areas.PrivatePages.Model
{
	public class Usua
	{
		/// <summary>
		/// đọc thông tin tài khoản đã đăng nhập
		/// </summary>
		/// <returns></returns>
		public static TaiKhoan GetTaiKhoanHH()
		{
			TaiKhoan kq = new TaiKhoan();
			kq = HttpContext.Current.Session["TtDangNhap"] as TaiKhoan;
			return kq;
		}
		/// <summary>
		/// lấy tên tài khoản đã đăng nhập
		/// </summary>
		/// <returns></returns>
		public static string GetTenTaiKhoan()
		{
			return GetTaiKhoanHH().taiKhoan1;
		}
	}
}