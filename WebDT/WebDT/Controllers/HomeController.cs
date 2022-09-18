using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebDT.Models;

namespace WebDT.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/
        public ActionResult Index()
        {
            var lstDienThoai = new List<SANPHAM>();
            using (WEBDTEntities db = new WEBDTEntities())
            {
                lstDienThoai = db.SANPHAMs.Take(100).ToList();
            }
            return View(lstDienThoai);
        }
        public ActionResult DanhMucDienThoai()
        {
            using (WEBDTEntities db = new WEBDTEntities())
            {
                List<NHASANXUAT> lst = db.NHASANXUATs.ToList();
                return PartialView(lst);
            }  
        }
        public ActionResult DanhSachDienThoai()
        {
            var lstDienThoai = new List<SANPHAM>();
            using (WEBDTEntities db = new WEBDTEntities())
            {
                lstDienThoai = db.SANPHAMs.OrderBy(s => s.GIABAN).ToList();
            }
            return View(lstDienThoai);
        }

        public ActionResult HienThiDienThoaiTheoNSX(string maLoai)
        {
            using (WEBDTEntities db = new WEBDTEntities())
            {
                int maloai = int.Parse(maLoai);
                List<SANPHAM> lst = db.SANPHAMs.ToList();
                List<SANPHAM> lst2 = lst.Where(t => t.MANSX == maLoai).ToList();
                return View("DanhSachDienThoai", lst2);
            }
        }

        public ActionResult TimKiem(FormCollection fc)
        {
            var key = fc["timkiem"];
            using(WEBDTEntities db = new WEBDTEntities()){
                List<SANPHAM> lst = db.SANPHAMs.ToList();
                List<SANPHAM> lst2 = lst.Where(s => s.TENSANPHAM.Contains(key) == true).ToList();
                return View("DanhSachDienThoai", lst2);
            }
            
        }
	}
}