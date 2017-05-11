/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

import java.util.Date;

/**
 *
 * @author tranl
 */
public class SANPHAM {

    private int ID;
    private String MaPhieuNhap;
    private String MaSanPham;
    private String TenSanPham;
    private int GiaGoc;
    private int DonGia;
    private int GiamGia;

    private Date NgayCapNhap;
    private String MoTa;
    private int SoLuong;

    private int LuotXem;
    private int LuotBinhLuan;
    private int SoLanMua;
    private String[] HinhAnh;
    

    public int getSoLuong() {
        return SoLuong;
    }

    public void setSoLuong(int SoLuong) {
        this.SoLuong = SoLuong;
    }    

    private String tb_nhasanxuat_MaNSX;

    public String getMaPhieuNhap() {
        return MaPhieuNhap;
    }

    public void setMaPhieuNhap(String MaPhieuNhap) {
        this.MaPhieuNhap = MaPhieuNhap;
    }

    
    
    public SANPHAM(int ID, String MaSanPham, String TenSanPham, int DonGia, int GiamGia, Date NgayCapNhap, String MoTa, int LuotXem, int LuotBinhLuan, int SoLanMua, String tb_nhasanxuat_MaNSX) {
        this.ID = ID;
        this.MaSanPham = MaSanPham;
        this.TenSanPham = TenSanPham;
        this.DonGia = DonGia;
        this.GiamGia = GiamGia;
        this.NgayCapNhap = NgayCapNhap;
        this.MoTa = MoTa;
        this.LuotXem = LuotXem;
        this.LuotBinhLuan = LuotBinhLuan;
        this.SoLanMua = SoLanMua;
        this.tb_nhasanxuat_MaNSX = tb_nhasanxuat_MaNSX;
    }

    public int getGiaGoc() {
        return GiaGoc;
    }

    public void setGiaGoc(int GiaGoc) {
        this.GiaGoc = GiaGoc;
    }

    
    
    
    public void Show(){
        System.out.println("ID " + ID + "\nMaSanPham : " + this.MaSanPham + "\nTenSanPham : " + this.TenSanPham + "\nDonGia : " + this.DonGia + "\nNgayCapNhap " + this.NgayCapNhap + "\nMoTa : " + this.MoTa);
    }
    public SANPHAM() {
    }

    public String[] getHinhAnh() {
        return HinhAnh;
    }

    public void setHinhAnh(String[] HinhAnh) {
        this.HinhAnh = HinhAnh;
    }

    public static String convertToVND(int giaTien) {
        String giaTienCD = String.valueOf(giaTien);
        String result = "";
        int count = 0;
        for (int i = giaTienCD.length() - 1; i >= 0; i--) {
            result += giaTienCD.charAt(i);
            count++;

            if (count % 3 == 0 && i != 0) {
                result += ".";
            }
        }
        return new StringBuffer(result).reverse().toString();
    }

    public String getDonGiaString() {
        return convertToVND(this.DonGia);
    }

    public String getGiamGiaString() {
        return convertToVND(this.GiamGia);
    }

    public int getGiamGia() {
        return GiamGia;
    }

    public void setGiamGia(int GiamGia) {
        this.GiamGia = GiamGia;
    }

    public String getTenSanPham() {
        return TenSanPham;
    }

    public void setTenSanPham(String TenSanPham) {
        this.TenSanPham = TenSanPham;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getMaSanPham() {
        return MaSanPham;
    }

    public void setMaSanPham(String MaSanPham) {
        this.MaSanPham = MaSanPham;
    }

    public int getDonGia() {
        return DonGia;
    }

    public void setDonGia(int DonGia) {
        this.DonGia = DonGia;
    }

    public Date getNgayCapNhap() {
        return NgayCapNhap;
    }

    public void setNgayCapNhap(Date NgayCapNhap) {
        this.NgayCapNhap = NgayCapNhap;
    }

    public String getMoTa() {
        return MoTa;
    }

    public void setMoTa(String MoTa) {
        this.MoTa = MoTa;
    }

 

    public int getLuotXem() {
        return LuotXem;
    }

    public void setLuotXem(int LuotXem) {
        this.LuotXem = LuotXem;
    }

    public int getLuotBinhLuan() {
        return LuotBinhLuan;
    }

    public void setLuotBinhLuan(int LuotBinhLuan) {
        this.LuotBinhLuan = LuotBinhLuan;
    }

    public int getSoLanMua() {
        return SoLanMua;
    }

    public void setSoLanMua(int SoLanMua) {
        this.SoLanMua = SoLanMua;
    }


    public String getTb_nhasanxuat_MaNSX() {
        return tb_nhasanxuat_MaNSX;
    }

    public void setTb_nhasanxuat_MaNSX(String tb_nhasanxuat_MaNSX) {
        this.tb_nhasanxuat_MaNSX = tb_nhasanxuat_MaNSX;
    }

    public static String removeCharAt(String s, int pos) {
      return s.substring(0, pos) + s.substring(pos + 1);
   }
}

