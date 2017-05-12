/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.KHACHHANG;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author tranl
 */
public class KHACHHANG_DAO {

    public void insertToken(String username, String token) throws SQLException{
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "UPDATE tb_khachhang SET Token = '" + token + "' WHERE Email = '" + username + "'";
        io.getStatement().executeUpdate(sql);
        io.close();
    }
    public void XacThuc(String username, String token) throws SQLException{
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "UPDATE tb_khachhang SET XacThuc = 1 WHERE Email = '" + username +"' AND Token = '" + token + "'";
        io.getStatement().executeUpdate(sql);
        io.close();
    }
    
    public void updateAddress(KHACHHANG kh) throws SQLException{
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "UPDATE tb_khachhang SET HoKhachHang = '" + kh.getHoKhachHang() + "', TenKhachHang = '" + kh.getTenKhachHang() + "', SoDienThoai = '" + kh.getSoDienThoai() + "', DiaChi = '" + kh.getDiaChi() + "', Tinh = '" + kh.getTinh() + "' WHERE ID = " + kh.getID();
        io.getStatement().executeUpdate(sql);
        io.close();
    }
    public int countKH() throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        int count = 0;
        String sql = "SELECT COUNT(ID) FROM tb_khachhang";
        ResultSet rs = io.getResultSet(sql);
        if (rs.next()) {
            count = rs.getInt(1);
        }
        io.close();
        return count;
    }

    public void InsertKH(KHACHHANG kh) throws SQLException {
        IODatabase io = new IODatabase();

        String MaKH = "KH" + (this.countKH() + 1);
        String sql = "INSERT INTO tb_khachhang(MaKhachHang, HoKhachHang, TenKhachHang, SoDienThoai, Email, MatKhau) VALUES(?,?,?,?,?,?)";
        io.conn();
        PreparedStatement ps = io.io_prepare(sql);
        ps.setString(1, MaKH);
        ps.setString(2, kh.getHoKhachHang());
        ps.setString(3, kh.getTenKhachHang());
        ps.setString(4, kh.getSoDienThoai());
        ps.setString(5, kh.getEmail());
        ps.setString(6, kh.getMatKhau());

        ps.executeUpdate();
        io.close();
    }

    
    public boolean checkXT(String email) throws SQLException{
        boolean check =  false;
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "SELECT XacThuc FROM tb_khachhang WHERE Email = '" + email + "'";
        ResultSet rs = io.getResultSet(sql);
        if(rs.next()){
            int xt = rs.getInt(1);
            if(xt == 1){
                check = true;
            }
        }
        io.close();
        return check;
    }
    public boolean Login(String email, String password) throws SQLException {
        boolean checkLogin = false;
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "SELECT COUNT(ID) FROM db_cuahangdochoi.tb_khachhang WHERE Email = '" + email + "' and MatKhau = '" + password + "' AND XacThuc = 1";
        ResultSet rs = io.getResultSet(sql);
        if (rs.next()) {
            int check = rs.getInt(1);
            if (check == 1) {
                checkLogin = true;
            }
        }
        io.close();
        return checkLogin;
    }

    public int checkKhachHang(String email, String phone) throws SQLException {
        int check = 1;
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "SELECT COUNT(ID) FROM tb_khachhang WHERE Email = '" + email + "'";
        ResultSet rs = io.getResultSet(sql);
        if (rs.next()) {
            int count = rs.getInt(1);
            if (count == 1) {
                check = 2; // email dupp
            }
        }
        io.close();
        io.conn();
        sql = "SELECT COUNT(ID) FROM tb_khachhang WHERE SoDienThoai = '" + phone + "'";
        rs = io.getResultSet(sql);
        if (rs.next()) {
            int count = rs.getInt(1);
            if (count == 1) {
                if (check == 2) {
                    check = 4; // false all
                } else {
                    check = 3; // false phone
                }
            }
        }
        io.close();
        return check; // check = 1 true
    }

    public ArrayList<KHACHHANG> getAll() throws SQLException {
        ArrayList<KHACHHANG> list = new ArrayList<KHACHHANG>();
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "SELECT ID FROM tb_khachhang";
        ResultSet rs = io.getResultSet(sql);
        while (rs.next()) {
            int ID = rs.getInt("ID");
            KHACHHANG kh = this.getKhachHangID(ID);
            list.add(kh);
        }
        io.close();
        return list;
    }

    public KHACHHANG getKhachHangID(int ID) throws SQLException {
        KHACHHANG kh = new KHACHHANG();
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "SELECT * FROM tb_khachhang WHERE ID = '" + ID + "'";
        ResultSet rs = io.getResultSet(sql);

        if (rs.next()) {

            String MaKhachHang = rs.getString("MaKhachHang");
            String HoKhachHang = rs.getString("HoKhachHang");
            String TenKhachHang = rs.getString("TenKhachHang");
            String DiaChi = rs.getString("DiaChi");
            String Tinh = rs.getString("Tinh");
            String QuocGia = rs.getString("QuocGia");
            String Email = rs.getString("Email");
            String SoDienThoai = rs.getString("SoDienThoai");
            String MatKhau = rs.getString("MatKhau");
            String tb_loaikh = rs.getString("tb_loaikhachhang_MaLoaiKhachHang");

            kh.setID(ID);
            kh.setMaKhachHang(MaKhachHang);
            kh.setHoKhachHang(HoKhachHang);
            kh.setTenKhachHang(TenKhachHang);
            kh.setDiaChi(DiaChi);
            kh.setTinh(Tinh);
            kh.setQuocGia(QuocGia);
            kh.setEmail(Email);
            kh.setSoDienThoai(SoDienThoai);
            kh.setMatKhau(MatKhau);
            kh.setTb_loaikhachhang_MaLoaiKhachHang(tb_loaikh);
        }
        io.close();
        return kh;
    }

    public KHACHHANG getKhachHang(String email) throws SQLException {
        IODatabase io = new IODatabase();
        KHACHHANG kh = new KHACHHANG();
        io.conn();
        String sql = "SELECT * FROM tb_khachhang WHERE Email = '" + email + "'";
        ResultSet rs = io.getResultSet(sql);
        if (rs.next()) {
            int ID = rs.getInt("ID");
            String MaKhachHang = rs.getString("MaKhachHang");
            String HoKhachHang = rs.getString("HoKhachHang");
            String TenKhachHang = rs.getString("TenKhachHang");
            String DiaChi = rs.getString("DiaChi");
            String Tinh = rs.getString("Tinh");
            String QuocGia = rs.getString("QuocGia");
            String Email = rs.getString("Email");
            String SoDienThoai = rs.getString("SoDienThoai");
            String MatKhau = rs.getString("MatKhau");
            String tb_loaikh = rs.getString("tb_loaikhachhang_MaLoaiKhachHang");

            kh.setID(ID);
            kh.setMaKhachHang(MaKhachHang);
            kh.setHoKhachHang(HoKhachHang);
            kh.setTenKhachHang(TenKhachHang);
            kh.setDiaChi(DiaChi);
            kh.setTinh(Tinh);
            kh.setQuocGia(QuocGia);
            kh.setEmail(Email);
            kh.setSoDienThoai(SoDienThoai);
            kh.setMatKhau(MatKhau);
            kh.setTb_loaikhachhang_MaLoaiKhachHang(tb_loaikh);
        }
        io.close();
        return kh;
    }

    public void XoaKhachHang(int ID) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "DELETE FROM tb_khachhang WHERE ID = " + ID;
        io.getStatement().executeUpdate(sql);
        io.close();
    }

    public boolean CheckEmail(String email) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        boolean check = false;
        String sql = "SELECT COUNT(ID) FROM tb_khachhang WHERE Email = '" + email + "'";
        ResultSet rs = io.getResultSet(sql);
        if (rs.next()) {
            int count = rs.getInt(1);
            if (count == 1) {
                check = true;
            }
        }
        io.close();
        return check;
    }

    public boolean CheckPhone(String phone) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        boolean check = false;
        String sql = "SELECT COUNT(ID) FROM tb_khachhang WHERE SoDienThoai = '" + phone + "'";
        ResultSet rs = io.getResultSet(sql);
        if (rs.next()) {
            int count = rs.getInt(1);
            if (count == 1) {
                check = true;
            }
        }
        io.close();

        return check;
    }

    public void UpdateKhachHang(KHACHHANG kh) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "UPDATE tb_khachhang SET HoKhachHang =  '" + kh.getHoKhachHang() + "', TenKhachHang = '" + kh.getTenKhachHang() + "', DiaChi = '" + kh.getDiaChi() + "', Tinh = '" + kh.getTinh() + "', QuocGia = '" + kh.getQuocGia() + "', Email = '" + kh.getEmail() + "', SoDienThoai = '" + kh.getSoDienThoai() + "', MatKhau = '" + kh.getMatKhau() + "' WHERE ID = " + kh.getID();
        io.getStatement().executeUpdate(sql);
        io.close();
    }
}
