/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.CHITIETPHIEUNHAP;
import DTO.PHIEUNHAP;
import DTO.SANPHAM;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author tranl
 */
public class PHIEUNHAP_DAO {

    public void xoaPhieuNhap(String MaPhieuNhap) throws SQLException{
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "DELETE FROM tb_phieunhap WHERE MaPhieuNhap = '" + MaPhieuNhap + "'";
        io.getStatement().executeUpdate(sql);
        CHITIETPHIEUNHAP_DAO ct_dp = new CHITIETPHIEUNHAP_DAO();
        ArrayList<CHITIETPHIEUNHAP> list_ct = ct_dp.getList(MaPhieuNhap);
        for(CHITIETPHIEUNHAP ct : list_ct){
            ct_dp.xoaChiTiet(MaPhieuNhap);
        }
        io.close();
    }
    
    public void updateMaNhaSanXuat(String MaPhieuNhap, String MaNhaSanXuat) throws SQLException{
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "UPDATE tb_phieunhap SET tb_nhacungcap_MaNhaCungCap = '" + MaNhaSanXuat + "' WHERE MaPhieuNhap = '" + MaPhieuNhap + "'";
        io.getStatement().executeUpdate(sql);
        io.close();
    }
    
    public String returnPhieuNhapMax() throws SQLException{
        IODatabase io = new IODatabase();
        io.conn();
        String MaPhieuNhap = "";
        String sql = "SELECT MAX(ID) FROM tb_phieunhap";
        ResultSet rs = io.getResultSet(sql);
        if(rs.next()){
            int ID = rs.getInt(1);
            MaPhieuNhap = "MPN" + (ID + 1);
        }
        io.close();
        return MaPhieuNhap;
    }
    
    public ArrayList<PHIEUNHAP> getList() throws SQLException{
        ArrayList<PHIEUNHAP> list = new ArrayList<PHIEUNHAP>();
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "SELECT * FROM tb_phieunhap";
        ResultSet rs = io.getResultSet(sql);
        while(rs.next()){
            int ID = rs.getInt("ID");
            String MaPhieuNhap = rs.getString("MaPhieuNhap");
            String MaNhaCungCap = rs.getString("tb_nhacungcap_MaNhaCungCap");
            Date Ngay = rs.getTimestamp("NgayNhap");
            PHIEUNHAP ph = new PHIEUNHAP();
            ph.setID(ID);
            ph.setMaPhieuNhap(MaPhieuNhap);
            ph.setTb_nhacungcap_MaNhaCungCap(MaNhaCungCap);
            ph.setNgayNhap(Ngay);
            list.add(ph);
        }
        io.close();
        return list;
    }
    
    public ArrayList<PHIEUNHAP> TimPhieu(String type) throws SQLException{
        ArrayList<PHIEUNHAP> list = new ArrayList<PHIEUNHAP>();
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "SELECT * FROM tb_phieunhap WHERE MaPhieuNhap like '%" + type + "%' OR tb_nhacungcap_MaNhaCungCap like '%" + type + "%'";
        ResultSet rs = io.getResultSet(sql);
        while(rs.next()){
            int ID = rs.getInt("ID");
            String MaPhieuNhap = rs.getString("MaPhieuNhap");
            String MaNhaCungCap = rs.getString("tb_nhacungcap_MaNhaCungCap");
            Date Ngay = rs.getTimestamp("NgayNhap");
            PHIEUNHAP ph = new PHIEUNHAP();
            ph.setID(ID);
            ph.setMaPhieuNhap(MaPhieuNhap);
            ph.setTb_nhacungcap_MaNhaCungCap(MaNhaCungCap);
            ph.setNgayNhap(Ngay);
            list.add(ph);
        }
        io.close();
        return list;
    }
    public String getMaPhieuNhap() throws SQLException {
        String MaPhieuNhap = "none";
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "SELECT MAX(ID) FROM tb_phieunhap";
        ResultSet rs = io.getResultSet(sql);
        int count = 0;
        if (rs.next()) {
            try {
                count = rs.getInt(1);
            } catch (Exception e) {
                count = 1;
            }
            count = count + 1;
        }
        MaPhieuNhap = "MPN" + count;
        io.close();
        return MaPhieuNhap;
    }

    public void ThemPhieuNhap(String MaPhieu, String MaNhaCungCap) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        SANPHAM_DAO sp_dp = new SANPHAM_DAO();
        ArrayList<SANPHAM> list = sp_dp.getListSP_temp(MaPhieu);
        String sql = "INSERT INTO tb_phieunhap(MaPhieuNhap, tb_nhacungcap_MaNhaCungCap) VALUES (?,?)";
        PreparedStatement stm = io.io_prepare(sql);
        stm.setString(1, MaPhieu);
        stm.setString(2, MaNhaCungCap);
        stm.executeUpdate();
        CHITIETPHIEUNHAP_DAO cct_dp = new CHITIETPHIEUNHAP_DAO();
        for (SANPHAM sp : list) {
            CHITIETPHIEUNHAP ct = new CHITIETPHIEUNHAP();
            ct.setTb_phieunhap_MaPhieuNhap(MaPhieu);
            ct.setMaSanPham(sp.getMaSanPham());
            ct.setDonGiaNhap(sp.getGiaGoc());
            ct.setSoLuong(sp.getSoLuong());
            cct_dp.InsertChiTietPhieuNhap(ct);
        }

        io.close();
    }
}
