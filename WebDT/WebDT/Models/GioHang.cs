using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebDT.Models
{
    public class GioHang
    {
        WEBDTEntities db = new WEBDTEntities();
        public string MaSanPham { get; set; }

        public string TenSanPham { get; set; }

        public string HinhAnh { get; set;}

        public int SoLuong { get; set; }

        public int? Gia { get; set;}

        public int? ThanhTien{
            get{ return SoLuong * Gia;}
        }

        public GioHang(string _masp)
        {
            MaSanPham = _masp;
            SANPHAM sp = db.SANPHAMs.FirstOrDefault(s => s.MASANPHAM == _masp);
            TenSanPham = sp.TENSANPHAM;
            HinhAnh = sp.HINHANH;
            Gia = sp.GIABAN;
            SoLuong = 1;
        }
    }
}