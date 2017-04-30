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
public class PHIEUNHAP {
    private int ID;
    private String MaPhieuNhap;
    private String tb_nhacungcap_MaNhaCungCap;
    private Date NgayNhap;

    public PHIEUNHAP() {
    }

    public PHIEUNHAP(int ID, String MaPhieuNhap, String tb_nhacungcap_MaNhaCungCap, Date NgayNhap) {
        this.ID = ID;
        this.MaPhieuNhap = MaPhieuNhap;
        this.tb_nhacungcap_MaNhaCungCap = tb_nhacungcap_MaNhaCungCap;
        this.NgayNhap = NgayNhap;
    }

  
    
    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getMaPhieuNhap() {
        return MaPhieuNhap;
    }

    public void setMaPhieuNhap(String MaPhieuNhap) {
        this.MaPhieuNhap = MaPhieuNhap;
    }

  
    public String getTb_nhacungcap_MaNhaCungCap() {
        return tb_nhacungcap_MaNhaCungCap;
    }

    public void setTb_nhacungcap_MaNhaCungCap(String tb_nhacungcap_MaNhaCungCap) {
        this.tb_nhacungcap_MaNhaCungCap = tb_nhacungcap_MaNhaCungCap;
    }

    public Date getNgayNhap() {
        return NgayNhap;
    }

    public void setNgayNhap(Date NgayNhap) {
        this.NgayNhap = NgayNhap;
    }
    
    
}
