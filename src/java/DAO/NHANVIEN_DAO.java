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
