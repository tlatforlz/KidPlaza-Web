/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.CHITIETDATHANG;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author tranl
 */
public class CHITIETDATHANG_DAO {
    
    public int TongTienDonHang(String MaDonDatHang) throws SQLException{
        ArrayList<CHITIETDATHANG> list = getListCT(MaDonDatHang);
        int GiaTien = 0;
        for(CHITIETDATHANG ct : list){
            GiaTien += (ct.getDonGia() * ct.getSoLuong());
        }
        return GiaTien;
    }
    public void InsertChiTietDDH(CHITIETDATHANG ct) throws SQLException{
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "INSERT INTO tb_chitietdathang(MaChiTiet, SoLuong, DonGia, tb_dondathang_MaDonDatHang, tb_sanpham_MaSanPham) VALUES (?,?,?,?,?)";
        PreparedStatement stm = io.io_prepare(sql);
        stm.setString(1, ct.getMaChiTiet());
        stm.setInt(2, ct.getSoLuong());
        stm.setInt(3, ct.getDonGia());
        stm.setString(4, ct.getTb_dondathang_MaDonDatHang());
        stm.setString(5, ct.getTb_sanpham_MaSanPham());
        stm.executeUpdate();
        io.close();
    }
    
    public ArrayList<CHITIETDATHANG> getListCT(String MaDonHang) throws SQLException{
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "SELECT * FROM tb_chitietdathang WHERE tb_dondathang_MaDonDatHang = '" + MaDonHang + "'";
        ResultSet rs = io.getResultSet(sql);
        ArrayList<CHITIETDATHANG> list_ct = new ArrayList<CHITIETDATHANG>();
        while(rs.next()){
            CHITIETDATHANG ct = new CHITIETDATHANG();
            ct.setID(rs.getInt("ID"));
            ct.setMaChiTiet(rs.getString("MaChiTiet"));
            ct.setSoLuong(rs.getInt("SoLuong"));
            ct.setDonGia(rs.getInt("DonGia"));
            ct.setTb_dondathang_MaDonDatHang(MaDonHang);
            ct.setTb_sanpham_MaSanPham(rs.getString("tb_sanpham_MaSanPham"));
            list_ct.add(ct);
        }
        io.close();
        return list_ct;
    }
}
