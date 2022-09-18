using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebDT.Models;

namespace WebDT.Controllers
{
    public class GioHangController : Controller
    {
        //
        // GET: /GioHang/
        private int tongSoLuong()
        {
            int tsl = 0;
            List<GioHang> lst = Session["GioHang"] as List<GioHang>;
            if (lst != null)
            {
                tsl = lst.Sum(n => n.SoLuong);
            }
            return tsl;
        }
        private int? tongTien()
        {
            int? tt = 0;
            List<GioHang> lst = Session["GioHang"] as List<GioHang>;
            if (lst != null)
            {
                tt = lst.Sum(t => t.ThanhTien);
            }
            return tt;
        }

        public List<GioHang> LayGioHang()
        {
            List<GioHang> lst = Session["GioHang"] as List<GioHang>;
            if (lst == null)
            {
                lst = new List<GioHang>();
                Session["GioHang"] = lst;
            }
            return lst;
        }

        public ActionResult XemGioHang()
        {
            List<GioHang> lst = LayGioHang();
            ViewBag.tongSL = tongSoLuong();
            ViewBag.tongT = tongTien();
            return View(lst);
        }

        public ActionResult ThemGioHang(string ma)
        {
            List<GioHang> lst = LayGioHang();
            GioHang gh = lst.FirstOrDefault(s => s.MaSanPham.Equals(ma));
            if (gh == null)
            {
                GioHang a = new GioHang(ma);
                lst.Add(a);
            }
            else
            {
                gh.SoLuong++;
            }
            return RedirectToAction("XemGioHang");
        }

        public ActionResult GioHangPartial()
        {
            if (tongSoLuong() == 0)
            {
                ViewBag.tongSL = 0;
                ViewBag.tongTien = 0;
                return PartialView();
            }
            ViewBag.tongSL = tongSoLuong();
            ViewBag.tongTien = tongTien();
            return PartialView();
        }

        public ActionResult GiamGioHang(string ma)
        {
            List<GioHang> lst = LayGioHang();
            GioHang a = lst.FirstOrDefault(s => s.MaSanPham == ma);
            if (a.SoLuong == 1)
            {
                return RedirectToAction("XemGioHang");
            }
            else
            {
                a.SoLuong--;
            }
            return RedirectToAction("XemGioHang");
        }

        public ActionResult XoaMatHang(string ma)
        {
            List<GioHang> lst = LayGioHang();
            GioHang a = lst.FirstOrDefault(s => s.MaSanPham == ma);
            if (a != null)
            {
                lst.Remove(a);
            }
            return RedirectToAction("XemGioHang");

        }

        public ActionResult XoaGioHang()
        {
            List<GioHang> lst = LayGioHang();
            lst.Clear();
            return RedirectToAction("XemGioHang");
        }

        [HttpGet]
        public ActionResult DatHang()
        {
            List<GioHang> lst = LayGioHang();
            if (Session["TaiKhoan"] == null || Session["TaiKhoan"].ToString() == "")
            {
                return RedirectToAction("DangNhapDangKy", "KhachHang");
            }
            if (tongSoLuong() == 0)
            {
                return RedirectToAction("Index", "Home");
            }
            ViewBag.TongSoLuong = tongSoLuong();
            ViewBag.TongTien = tongTien();
            return View(lst);
        }

        public ActionResult DatHang(FormCollection fc)
        {
            List<GioHang> lst = LayGioHang();
            if (Session["TaiKhoan"] == null || Session["TaiKhoan"].ToString() == "")
            {
                return RedirectToAction("DangNhapDangKy", "KhachHang");
            }
            if (tongSoLuong() == 0)
            {
                return RedirectToAction("Index", "Home");
            }
            using (WEBDTEntities db = new WEBDTEntities())
            {
                DONHANG dh = new DONHANG();
                KHACHHANG kh = (KHACHHANG)Session["TaiKhoan"];
                dh.MAKH = kh.MAKHACH;
                dh.NGAYDAT = DateTime.Now;
                dh.TINHTRANGGIAOHANG = false;
                dh.DATHANHTOAN = false;
                db.DONHANGs.Add(dh);
                db.SaveChanges();
                foreach (var item in lst)
                {
                    CHITIETDONHANG ctdh = new CHITIETDONHANG();
                    ctdh.MADON = dh.MADONHANG;
                    ctdh.MASP = item.MaSanPham;
                    ctdh.SOLUONG = item.SoLuong;
                    ctdh.DONGIA = item.Gia;
                    db.CHITIETDONHANGs.Add(ctdh);
                }
                db.SaveChanges();
                Session["GioHang"] = null;
                return RedirectToAction("XacNhanDonHang", "GioHang");
            }
        }

        public ActionResult XacNhanDonHang()
        {
            return View();
        }
	}
}