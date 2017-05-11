/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.CHITIETPHIEUNHAP;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author tranl
 */
public class CHITIETPHIEUNHAP_DAO {

    public void xoaChiTiet(String MaPhieuNhap) throws SQLException{
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "DELETE FROM tb_chitietphieunhap WHERE tb_phieunhap_MaPhieuNhap = '" + MaPhieuNhap + "'";
        io.getStatement().executeUpdate(sql);
        io.close();
    }
    
    public int TongSanPham(String MaSanPham) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        int soLuong = 0;
        String sql = "SELECT SUM(SoLuong) FROM tb_chitietphieunhap WHERE MaSanPham = '" + MaSanPham + "'";
        ResultSet rs = io.getResultSet(sql);
        if (rs.next()) {
            soLuong = rs.getInt(1);
        }
        io.close();
        return soLuong;
    }

    public int SoLuongMaPhieuNhap(String MaSanPham, String MaPhieuNhap) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        int SoLuong = 0;
        String sql = "SELECT SoLuong FROM tb_chitietphieunhap WHERE MaSanPham = '" + MaSanPham + "' AND tb_phieunhap_MaPhieuNhap = '" + MaPhieuNhap + "'";
        ResultSet rs = io.getResultSet(sql);
        if (rs.next()) {
            SoLuong = rs.getInt(1);
        }
        io.close();
        return SoLuong;
    }

    public void InsertChiTietPhieuNhap(CHITIETPHIEUNHAP ct) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "INSERT INTO tb_chitietphieunhap(tb_phieunhap_MaPhieuNhap, MaSanPham, DonGiaNhap, SoLuong) VALUES (?,?,?,?)";
        PreparedStatement stm = io.io_prepare(sql);
        stm.setString(1, ct.getTb_phieunhap_MaPhieuNhap());
        stm.setString(2, ct.getMaSanPham());
        stm.setInt(3, ct.getDonGiaNhap());
        stm.setInt(4, ct.getSoLuong());
        stm.executeUpdate();
        io.close();
    }

    public ArrayList<CHITIETPHIEUNHAP> getList(String MaPhieuNhap) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        ArrayList<CHITIETPHIEUNHAP> list = new ArrayList<CHITIETPHIEUNHAP>();
        String sql = "SELECT * FROM tb_chitietphieunhap WHERE tb_phieunhap_MaPhieuNhap = '" + MaPhieuNhap + "'";
        ResultSet rs = io.getResultSet(sql);
        while (rs.next()) {
            int ID = rs.getInt("ID");
            String MaSanPham = rs.getString("MaSanPham");
            int DonGiaNhap = rs.getInt("DonGiaNhap");
            int SoLuong = rs.getInt("SoLuong");
            CHITIETPHIEUNHAP ct = new CHITIETPHIEUNHAP();
            ct.setID(ID);
            ct.setMaSanPham(MaSanPham);
            ct.setTb_phieunhap_MaPhieuNhap(MaPhieuNhap);
            ct.setDonGiaNhap(DonGiaNhap);
            ct.setSoLuong(SoLuong);
            list.add(ct);
        }
        io.close();
        return list;
    }
    
    
    public void updateGiaTienPhieuNhap(String MaPhieuNhap, String MaSanPham, int GiaGoc) throws SQLException{
        IODatabase io = new IODatabase();
        io.conn();
        io.conn();
        String sql = "UPDATE tb_chitietphieunhap SET DonGiaNhap = " + GiaGoc + " WHERE tb_phieunhap_MaPhieuNhap = '" + MaPhieuNhap + "' AND MaSanPham = '" + MaSanPham + "'";
        io.getStatement().executeUpdate(sql);
        io.close();
    }
    public void updateChiTietPhieuNhap(String MaPhieuNhap, String MaSanPham, int SoLuong) throws SQLException{
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "UPDATE tb_chitietphieunhap SET SoLuong = " + SoLuong + " WHERE tb_phieunhap_MaPhieuNhap = '" + MaPhieuNhap + "' AND MaSanPham = '" + MaSanPham + "'";
        io.getStatement().executeUpdate(sql);
        io.close();
    }
}
