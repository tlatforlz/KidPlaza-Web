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
public class KHACHHANG {
    private int ID;
    private String MaKhachHang;
    private String HoKhachHang;
    private String TenKhachHang;
    private String DiaChi;
    private String Tinh;
    private String QuocGia;
    private String Email;
    private String SoDienThoai;
    private String MatKhau;
    private String  tb_loaikhachhang_MaLoaiKhachHang;
    private int XacThuc;
    public KHACHHANG() {
    }

    public void Show(){
        System.out.println("ID " + ID);
        System.out.println("MaKhachHang " + MaKhachHang);
        System.out.println("HoKhachHang " + HoKhachHang);
        System.out.println("TenKhachHang " + TenKhachHang);
        System.out.println("DiaChi " + DiaChi);
        System.out.println("Email " + Email);
        System.out.println("SoDienThoai " + SoDienThoai);
        System.out.println("MatKhau " + MatKhau);
        System.out.println("tb_loaikhachhang_MaLoaiKhachHang " + tb_loaikhachhang_MaLoaiKhachHang);
    }

    public int getXacThuc() {
        return XacThuc;
    }

    public void setXacThuc(int XacThuc) {
        this.XacThuc = XacThuc;
    }
    
    
    public KHACHHANG(int ID, String MaKhachHang, String HoKhachHang, String TenKhachHang, String DiaChi, String Tinh, String QuocGia, String Email, String MatKhau, String SoDienThoai, String tb_loaikhachhang_MaLoaiKhachHang) {
        this.ID = ID;
        this.HoKhachHang = HoKhachHang;
        this.SoDienThoai = SoDienThoai;
        this.MaKhachHang = MaKhachHang;
        this.TenKhachHang = TenKhachHang;
        this.DiaChi = DiaChi;
        this.Tinh = Tinh;
        this.QuocGia = QuocGia;
        this.Email = Email;
        this.MatKhau = MatKhau;
        this.tb_loaikhachhang_MaLoaiKhachHang = tb_loaikhachhang_MaLoaiKhachHang;
    }

    public String getTinh() {
        return Tinh;
    }

    public void setTinh(String Tinh) {
        this.Tinh = Tinh;
    }

    public String getQuocGia() {
        return QuocGia;
    }

    public void setQuocGia(String QuocGia) {
        this.QuocGia = QuocGia;
    }

    
    public String getHoKhachHang() {
        return HoKhachHang;
    }

    public void setHoKhachHang(String HoKhachHang) {
        this.HoKhachHang = HoKhachHang;
    }

    public String getSoDienThoai() {
        return SoDienThoai;
    }

    public void setSoDienThoai(String SoDienThoai) {
        this.SoDienThoai = SoDienThoai;
    }

    public String getMatKhau() {
        return MatKhau;
    }

    public void setMatKhau(String MatKhau) {
        this.MatKhau = MatKhau;
    }

    
    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getMaKhachHang() {
        return MaKhachHang;
    }

    public void setMaKhachHang(String MaKhachHang) {
        this.MaKhachHang = MaKhachHang;
    }

    public String getTenKhachHang() {
        return TenKhachHang;
    }

    public void setTenKhachHang(String TenKhachHang) {
        this.TenKhachHang = TenKhachHang;
    }

    public String getDiaChi() {
        return DiaChi;
    }

    public void setDiaChi(String DiaChi) {
        this.DiaChi = DiaChi;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getTb_loaikhachhang_MaLoaiKhachHang() {
        return tb_loaikhachhang_MaLoaiKhachHang;
    }

    public void setTb_loaikhachhang_MaLoaiKhachHang(String tb_loaikhachhang_MaLoaiKhachHang) {
        this.tb_loaikhachhang_MaLoaiKhachHang = tb_loaikhachhang_MaLoaiKhachHang;
    }
    
    
}
