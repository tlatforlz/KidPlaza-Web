/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.NHANVIEN;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author tranl
 */
public class NHANVIEN_DAO {
    public boolean Login(String username, String password) throws SQLException{
        boolean check = false;
        IODatabase io = new IODatabase();
        io.conn();
        
        String sql = "SELECT COUNT(ID) FROM tb_nhanvien WHERE TaiKhoan = '" + username + "' and MatKhau = '" + password + "'";
        ResultSet rs = io.getResultSet(sql);
        if(rs.next()){
            int count = rs.getInt(1);
            if(count == 1){
                check = true;
            }
        }
        io.close();
        return check;
    }
   
    public boolean checkTaiKhoan(String username) throws SQLException{
        boolean check = false;
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "SELECT COUNT(ID) FROM tb_nhanvien WHERE TaiKhoan = '" + username + "'";
        ResultSet rs = io.getResultSet(sql);
        if(rs.next()){
            int count =  rs.getInt(1);
            if(count != 0){
                check = true;
            }
        }
        io.close();
        return check;
    }
    
    public int getMax() throws SQLException{
        int max = 0;
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "SELECT MAX(ID) FROM tb_nhanvien";
        ResultSet rs = io.getResultSet(sql);
        if(rs.next()){
            max = rs.getInt(1);
        }
        io.close();
        return max;
    }
    
    public void insertTaiKhoan(String MaNhanVien,String username, String password, String Loai) throws SQLException{
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "INSERT INTO tb_nhanvien (MaNhanVien,TaiKhoan, MatKhau, tb_loainhanvien_MaLoaiNhanVien) VALUES (?,?,?,?)";
        PreparedStatement stm = io.io_prepare(sql);
        stm.setString(1, MaNhanVien);
        stm.setString(2, username);
        stm.setString(3, password);
        stm.setString(4, Loai);
        stm.executeUpdate();
        io.close();
    }
    
    public String getQuyen(String MaNhanVien) throws SQLException{
        IODatabase io = new IODatabase();
        io.conn();
        String Quyen = "";
        String sql = "SELECT tb_loainhanvien_MaLoaiNhanVien FROM tb_nhanvien WHERE TaiKhoan = '" + MaNhanVien + "'";
        ResultSet rs = io.getResultSet(sql);
        if(rs.next()){
            Quyen = rs.getString(1);
        }
        io.close();
        return Quyen;
    }
    
    public void update(String TaiKhoan, String Loai) throws SQLException{
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "UPDATE tb_nhanvien SET tb_loainhanvien_MaLoaiNhanVien = '" + Loai + "' WHERE TaiKhoan = '" + TaiKhoan + "'";
        io.getStatement().executeUpdate(sql);
        io.close();
    }
    
    
    public void XoaNhanVien(String TaiKhoan) throws SQLException{
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "UPDATE tb_nhanvien SET DaXoa = 1 WHERE TaiKhoan = '" + TaiKhoan + "'";
        io.getStatement().executeUpdate(sql);
        io.close();
    }
    public ArrayList<NHANVIEN> getAllNhanVien() throws SQLException{
        ArrayList<NHANVIEN> list = new ArrayList<NHANVIEN>();
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "SELECT * FROM tb_nhanvien WHERE DaXoa = 0";
        ResultSet rs = io.getResultSet(sql);
        while(rs.next()){
            int ID = rs.getInt("ID");
            String MaNhanVien = rs.getString("MaNhanVien");
            String TaiKhoan = rs.getString("TaiKhoan");
            String MatKhau = rs.getString("MatKhau");
            String MatKhauCapHai = rs.getString("MatKhauCapHai");
            String Email = rs.getString("Email");
            String DiaChi = rs.getString("DiaChi");
            String SoDienThoai = rs.getString("SoDienThoai");
            Date NgaySinh = rs.getDate("NgaySinh");
            String tb_loainhanvien_MaLoaiNhanVien = rs.getString("tb_loainhanvien_MaLoaiNhanVien");
            NHANVIEN nv = new NHANVIEN();
            nv.setID(ID);
            nv.setMaNhanVien(MaNhanVien);
            nv.setTaiKhoan(TaiKhoan);
            nv.setMatKhau(MatKhau);
            nv.setMatKhauCapHai(MatKhauCapHai);
            nv.setEmail(Email);
            nv.setDiaChi(DiaChi);
            nv.setSoDienThoai(SoDienThoai);
            nv.setNgaySinh(NgaySinh);
            nv.setTb_loainhanvien_MaLoaiNhanVien(tb_loainhanvien_MaLoaiNhanVien);
            list.add(nv);
        }
        io.close();
        return list;
    }
    public ArrayList<NHANVIEN> getList() throws SQLException{
        ArrayList<NHANVIEN> list = new ArrayList<NHANVIEN>();
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "SELECT * FROM tb_nhanvien";
        ResultSet rs = io.getResultSet(sql);
        while(rs.next()){
            int ID = rs.getInt("ID");
            String MaNhanVien = rs.getString("MaNhanVien");
        }
        io.close();
        return list;
    }
}
