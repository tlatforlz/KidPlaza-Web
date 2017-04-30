/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.LOAISANPHAM;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author tranl
 */
public class LOAISANPHAM_DAO {

    public boolean checkMaLoai(String MaLoai) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        boolean check = false;
        String sql = "SELECT COUNT(ID) FROM tb_loaisanpham WHERE MaLoaiSanPham = '" + MaLoai + "'";
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

    public void InsertDanhMuc(String TenDanhMuc) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        String[] list = TenDanhMuc.split(" ");
        String MaLoai = "";
        for (String temp : list) {
            temp = temp.toUpperCase();
            MaLoai += temp.charAt(0);
        }
        String sql = "INSERT INTO tb_loaisanpham(MaLoaiSanPham, TenLoaiSanPham) VALUES (?,?)";
        PreparedStatement st = io.io_prepare(sql);
        boolean check = this.checkMaLoai(MaLoai);
        if(check == true){
            MaLoai = MaLoai + "1";
        }
        st.setString(1, MaLoai);
        st.setString(2, TenDanhMuc);
        st.executeUpdate();

        io.close();

    }

    public int getIDSanPham(String MaLoaiSanPham) throws SQLException {
        int ID = 0;
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "SELECT ID FROM tb_loaisanpham WHERE MaLoaiSanPham = '" + MaLoaiSanPham + "'";
        ResultSet rs = io.getResultSet(sql);
        if (rs.next()) {
            ID = rs.getInt(1);
        }
        io.close();
        return ID;
    }

    public int getSoLuongMaSanPham(String MaLoaiSanPham) throws SQLException {
        int SoLuong = 0;
        int ID = getIDSanPham(MaLoaiSanPham);
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "SELECT COUNT(tb_sanpham_ID) FROM db_cuahangdochoi.tb_sanpham_has_tb_loaisanpham WHERE tb_loaisanpham_ID = " + ID;
        ResultSet rs = io.getResultSet(sql);
        if (rs.next()) {
            SoLuong = rs.getInt(1);
        }
        io.close();
        return SoLuong;
    }

    public LOAISANPHAM getLoaiSanPhamTheoID(int ID) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        LOAISANPHAM lp = new LOAISANPHAM();

        String sql = "SELECT * FROM tb_loaisanpham WHERE ID = " + ID;
        ResultSet rs = io.getResultSet(sql);
        if (rs.next()) {
            int ID_l = rs.getInt("ID");
            String MaLoaiSanPham = rs.getString("MaLoaiSanPham");
            String TenLoaiSanPham = rs.getString("TenLoaiSanPham");

            lp.setID(ID_l);
            lp.setMaLoaiSanPham(MaLoaiSanPham);
            lp.setTenLoaiSanPham(TenLoaiSanPham);
        }
        io.close();
        return lp;
    }

    public ArrayList<LOAISANPHAM> getLoaiSanPhamTheMa(String MaSanPham) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        SANPHAM_DAO sp_dao = new SANPHAM_DAO();
        int ID_sp = sp_dao.return_IDSanPham(MaSanPham);
        String sql = "select * from tb_sanpham_has_tb_loaisanpham where tb_sanpham_ID = " + ID_sp;
        ResultSet rs = io.getResultSet(sql);
        ArrayList<LOAISANPHAM> list = new ArrayList<LOAISANPHAM>();
        while (rs.next()) {
            int ID = rs.getInt("tb_loaisanpham_ID");
            LOAISANPHAM lp = this.getLoaiSanPhamTheoID(ID);
            list.add(lp);
        }
        io.close();
        return list;
    }
    

    public ArrayList<LOAISANPHAM> getLoaiSanPham() throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "select * from tb_loaisanpham";
        ResultSet rs = io.getResultSet(sql);
        ArrayList<LOAISANPHAM> list = new ArrayList<LOAISANPHAM>();
        try {
            while (rs.next()) {
                int ID = rs.getInt("ID");
                String MaLoaiSanPham = rs.getString("MaLoaiSanPham");
                String TenLoaiSanPham = rs.getString("TenLoaiSanPham");
                String DanhMucCha = rs.getString("DanhMucCha");
                LOAISANPHAM sp = new LOAISANPHAM(ID, MaLoaiSanPham, TenLoaiSanPham, DanhMucCha);
                list.add(sp);
            }
        } catch (SQLException e) {
        }
        io.close();
        return list;
    }

    public ArrayList<LOAISANPHAM> getLoaiSanPhamCon(String maLoaiCha, ArrayList<LOAISANPHAM> list) throws Exception{
        ArrayList<LOAISANPHAM> listCon = new ArrayList<LOAISANPHAM>();
        for (LOAISANPHAM sp : list) {
            if (sp.getDanhMucCha().contains(maLoaiCha) == true) {
                listCon.add(sp);
            }
        }
        return listCon;
    }

    public void XoaLoaiSanPham(int ID) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "DELETE FROM tb_loaisanpham WHERE ID = " + ID;
        String sql2 = "DELETE FROM tb_sanpham_has_tb_loaisanpham WHERE tb_loaisanpham_ID = " + ID;
        io.getStatement().executeUpdate(sql);
        io.getStatement().executeUpdate(sql2);
        io.close();
    }

    
    public void UpdateLoaiSanPham(int ID, String TenLoai) throws SQLException{
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "UPDATE tb_loaisanpham SET TenLoaiSanPham = '" + TenLoai + "' WHERE ID = " + ID;
        io.getStatement().executeUpdate(sql);
        io.close();
    }
}
