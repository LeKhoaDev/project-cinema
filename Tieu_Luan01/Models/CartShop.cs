using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Tieu_Luan.Models;
using Tieu_Luan01.Models;

namespace Tieu_Luan.Models
{
	public class CartShop
	{

		public string MaKH { get; set; }
		public string TaiKhoan { get; set; }
		public DateTime NgayDat { get; set; }
		public DateTime NgayGiao { get; set; }
		public string DiaChi { get; set; }
		//sortedList
		//Default Contructor

		public CartShop()
		{

			this.MaKH = "";
			this.TaiKhoan = "";
			this.NgayDat = DateTime.Now;
			this.NgayGiao = DateTime.Now.AddDays(2);
			this.DiaChi = "";
		}
		//public bool isEmpty()
		//{
		//	return (SanPhamDC.Keys.Count == 0);
		//}
		////2 tình huống mua hàng hóa
		//public void addItem(int maSP)
		//{
		//	if (SanPhamDC.Keys.Contains(maSP))
		//	{
		//		CtDonHang x = SanPhamDC.Values[SanPhamDC.IndexOfKey(maSP)];
		//		x.soLuong++;
		//		SanPhamDC.Values[SanPhamDC.IndexOfKey(maSP)] = x;
		//	}
		//	else
		//	{
		//		CtDonHang i = new CtDonHang();
		//		i.maSP = maSP;
		//		i.soLuong = 1;
		//		SanPham z = Common.GetProductById(i.maSP);
		//		i.giaBan = z.giaBan;
		//		i.giamGia = z.giamGia;
		//		SanPhamDC.Add(maSP, i);
		//	}
		//}
		//public void updateOneItem(CtDonHang x)
		//{
		//	this.SanPhamDC.Remove(x.maSP);
		//	this.SanPhamDC.Add(x.maSP, x);
		//}
		////xóa 1 đơn hàng
		//public void DeleteItem(int Id)
		//{
		//	if (SanPhamDC.Keys.Contains(Id))
		//	{
		//		SanPhamDC.Remove(Id);
		//	}
		//}
		////Giảm số lượng sản phẩm hoặc xóa luôn sản phẩm trong giỏ hàng
		//public void decreate(int maSP)
		//{
		//	CtDonHang x = SanPhamDC.Values[SanPhamDC.IndexOfKey(maSP)];
		//	if (x.soLuong > 1)
		//	{
		//		x.soLuong--;
		//		SanPhamDC.Values[SanPhamDC.IndexOfKey(maSP)] = x;
		//	}
		//	else
		//	{
		//		DeleteItem(maSP);
		//	}
		//}
		//public long moneyOfOneProduct(CtDonHang x)
		//{
		//	return (long)(x.soLuong * x.giamGia);
		//}
		////tổng thành tiền cho toàn bộ đơn hàng
		//public long totalOfCartShop()
		//{
		//	long kq = 0;
		//	foreach (CtDonHang i in SanPhamDC.Values)
		//		kq += moneyOfOneProduct(i);
		//	return kq;
		//}
	}
}