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
    public void InsertChiTietPhieuNhap(CHITIETPHIEUNHAP ct) throws SQLException{
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
    
    public ArrayList<CHITIETPHIEUNHAP> getList(String MaPhieuNhap) throws SQLException{
        IODatabase io = new IODatabase();
        io.conn();
        ArrayList<CHITIETPHIEUNHAP> list = new ArrayList<CHITIETPHIEUNHAP>();
        String sql = "SELECT * FROM tb_chitietphieunhap WHERE tb_phieunhap_MaPhieuNhap = '" + MaPhieuNhap + "'";
        ResultSet rs = io.getResultSet(sql);
        while(rs.next()){
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
}
