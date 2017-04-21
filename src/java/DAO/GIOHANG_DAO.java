/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.GIOHANG;
import DTO.SANPHAM;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author tranl
 */
public class GIOHANG_DAO {

    public boolean checkSanPham(String MaKhachHang, String MaSanPham) throws SQLException {
        boolean check = false;
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "SELECT COUNT(ID) from tb_giohang WHERE MaSanPham = '" + MaSanPham + "' and MaKhachHang = '" + MaKhachHang + "'";
        ResultSet rs = io.getResultSet(sql);
        if (rs.next()) {
            int temp = rs.getInt(1);
            if (temp == 1) {
                check = true;
            }
        }
        io.close();
        return check;
    }

    public int getSoLuongHienTai(String MaKhachHang, String MaSanPham) throws SQLException {
        int SoLuong = 0;
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "SELECT SoLuong from tb_giohang WHERE MaSanPham = '" + MaSanPham + "' and MaKhachHang = '" + MaKhachHang + "'";
        ResultSet rs = io.getResultSet(sql);
        if (rs.next()) {
            SoLuong = rs.getInt(1);
        }
        io.close();
        return SoLuong;
    }

    public int TongCong(String MaKhachHang) throws SQLException {
        int Tong = 0;
        IODatabase io = new IODatabase();
        io.conn();
        ArrayList<GIOHANG> list = this.getList(MaKhachHang);
        for (GIOHANG gh : list) {
            SANPHAM_DAO sp_dao = new SANPHAM_DAO();
            SANPHAM sp = sp_dao.getSanPham(gh.getMaSanPham());
            Tong = Tong + (sp.getDonGia() * gh.getSoLuong());
        }
        io.close();
        return Tong;
    }

    public void XoaDonHang(String MaKhachHang, String MaSanPham) throws SQLException {
        IODatabase io = new IODatabase();
        int ID = this.getID(MaKhachHang, MaSanPham);
        io.conn();

        String sql = "DELETE FROM tb_giohang WHERE ID = " + ID;
        io.getStatement().executeUpdate(sql);
        io.close();
    }

    public void XoaDonHang(String MaSanPham) throws SQLException {
        IODatabase io = new IODatabase();

        while (true) {

            io.conn();
            int ID = this.getID(MaSanPham);
            if (ID == 0) {
                break;
            }
            String sql = "DELETE FROM tb_giohang WHERE ID = " + ID;
            io.getStatement().executeUpdate(sql);
            io.close();
        }

    }

    public int getID(String MaKhachHang, String MaSanPham) throws SQLException {
        int ID = 0;
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "SELECT ID from tb_giohang WHERE MaSanPham = '" + MaSanPham + "' and MaKhachHang = '" + MaKhachHang + "'";
        ResultSet rs = io.getResultSet(sql);
        if (rs.next()) {
            ID = rs.getInt(1);
        }
        io.close();
        return ID;
    }

    public int getID(String MaSanPham) throws SQLException {
        int ID = 0;
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "select ID from tb_giohang where MaSanPham = '" + MaSanPham + "' limit 0,1";
        ResultSet rs = io.getResultSet(sql);
        if (rs.next()) {
            ID = rs.getInt(1);
        }
        io.close();
        return ID;
    }

    public void updateGioHang(String MaSanPham, String MaKhachHang, int SoLuong) throws SQLException{
        GIOHANG gh = new GIOHANG();
        IODatabase io = new IODatabase();
        io.conn();
        int ID = this.getID(MaKhachHang, MaSanPham);
        String sql = "UPDATE tb_giohang SET SoLuong = " + SoLuong + " WHERE ID = " + ID;
        io.getStatement().executeUpdate(sql);
        io.close();     
    }
    
    public void ThemVaoInsertGioHang(GIOHANG gh) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        boolean check = this.checkSanPham(gh.getMaKhachHang(), gh.getMaSanPham());
        if (check == true) {
            // update
            int ID = this.getID(gh.getMaKhachHang(), gh.getMaSanPham());
            int SoLuong = this.getSoLuongHienTai(gh.getMaKhachHang(), gh.getMaSanPham());
            String sql = "UPDATE tb_giohang SET SoLuong = " + (SoLuong + gh.getSoLuong()) + " WHERE ID = " + ID;
            io.getStatement().executeUpdate(sql);
        } else {
            //insert
            String sql = "INSERT INTO tb_giohang(MaKhachHang, MaSanPham, SoLuong) VALUES (?,?,?)";
            PreparedStatement st = io.io_prepare(sql);
            st.setString(1, gh.getMaKhachHang());
            st.setString(2, gh.getMaSanPham());
            st.setInt(3, gh.getSoLuong());
            st.executeUpdate();
        }
        io.close();
    }

    public ArrayList<GIOHANG> getList(String MaKhach) throws SQLException {
        ArrayList<GIOHANG> list = new ArrayList<GIOHANG>();
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "SELECT * FROM tb_giohang WHERE MaKhachHang = '" + MaKhach + "'";
        ResultSet rs = io.getResultSet(sql);
        while (rs.next()) {
            int ID = rs.getInt("ID");
            String MaKhachHang = rs.getString("MaKhachHang");
            String MaSanPham = rs.getString("MaSanPham");
            int SoLuong = rs.getInt("SoLuong");

            GIOHANG x = new GIOHANG();
            x.setID(ID);
            x.setMaKhachHang(MaKhachHang);
            x.setMaSanPham(MaSanPham);
            x.setSoLuong(SoLuong);

            list.add(x);
        }
        io.close();
        return list;
    }
    
    
}
