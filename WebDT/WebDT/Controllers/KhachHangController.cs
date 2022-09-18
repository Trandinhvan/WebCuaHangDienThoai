using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebDT.Models;

namespace WebDT.Controllers
{
    public class KhachHangController : Controller
    {
        //
        // GET: /KhachHang/
        

        public ActionResult DangNhapDangKy()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangKy(FormCollection fc,KHACHHANG kh)
        {
            using (WEBDTEntities db = new WEBDTEntities())
            {
                kh.TENKHACH = fc["hoten"];
                var ngaysinh = String.Format("{0:dd/MM/yyyy}", fc["ngaysinh"]);
                kh.NGAYSINH = DateTime.Parse(ngaysinh);
                kh.GIOITINH = fc["gioitinh"];
                kh.DIENTHOAI = fc["dienthoai"];
                kh.EMAIL = fc["email"];
                kh.DIACHI = fc["diachi"];
                kh.TAIKHOAN = fc["taikhoan"];
                kh.MATKHAU = fc["matkhau"];
                db.KHACHHANGs.Add(kh);
                db.SaveChanges();
                return RedirectToAction("DangNhapDangKy", "KhachHang");
            }
        }
        public ActionResult DangNhap(FormCollection fc)
        {
            var tendn = fc["taikhoan"];
            var matkhau = fc["matkhau"];
            if (string.IsNullOrEmpty(tendn))
            {
                ViewData["Loi"] = "Phải nhập tên đăng nhập";
            }
            else if (string.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi"] = "Phải nhập mật khẩu";
            }
            else
            {
                using (WEBDTEntities db = new WEBDTEntities())
                {
                    KHACHHANG kh = db.KHACHHANGs.SingleOrDefault(n => n.TAIKHOAN == tendn && n.MATKHAU == matkhau);
                    if (kh != null)
                    {
                        Session["TaiKhoan"] = kh;
                        return RedirectToAction("DanhSachDienThoai", "Home");
                    }
                    else
                    {
                        ViewData["Loi"] = "Tên đăng nhập hoặc mật khẩu không chính xác";
                        return View("DangNhapDangKy");
                    }
                }
            }
            return View("DangNhapDangKy");
        }

        public ActionResult DangXuat()
        {
            Session["TaiKhoan"] = null;
            return RedirectToAction("Index", "Home");
        }
	}
}