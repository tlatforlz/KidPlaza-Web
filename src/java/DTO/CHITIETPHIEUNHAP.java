/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

/**
 *
 * @author tranl
 */
public class CHITIETPHIEUNHAP {

    private int ID;
    private String tb_phieunhap_MaPhieuNhap;
    private String MaSanPham;
    private int DonGiaNhap;
    private int SoLuong;

    public CHITIETPHIEUNHAP() {
    }

    public CHITIETPHIEUNHAP(int ID, String tb_phieunhap_MaPhieuNhap, String MaSanPham, int DonGiaNhap, int SoLuong) {
        this.ID = ID;
        this.tb_phieunhap_MaPhieuNhap = tb_phieunhap_MaPhieuNhap;
        this.MaSanPham = MaSanPham;
        this.DonGiaNhap = DonGiaNhap;
        this.SoLuong = SoLuong;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getTb_phieunhap_MaPhieuNhap() {
        return tb_phieunhap_MaPhieuNhap;
    }

    public void setTb_phieunhap_MaPhieuNhap(String tb_phieunhap_MaPhieuNhap) {
        this.tb_phieunhap_MaPhieuNhap = tb_phieunhap_MaPhieuNhap;
    }

    public String getMaSanPham() {
        return MaSanPham;
    }

    public void setMaSanPham(String MaSanPham) {
        this.MaSanPham = MaSanPham;
    }

    public int getDonGiaNhap() {
        return DonGiaNhap;
    }

    public void setDonGiaNhap(int DonGiaNhap) {
        this.DonGiaNhap = DonGiaNhap;
    }

    public int getSoLuong() {
        return SoLuong;
    }

    public void setSoLuong(int SoLuong) {
        this.SoLuong = SoLuong;
    }

    
}
