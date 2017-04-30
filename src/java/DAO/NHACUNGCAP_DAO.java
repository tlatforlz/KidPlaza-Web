/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.NHACUNGCAP;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author tranl
 */
public class NHACUNGCAP_DAO {

    public ArrayList<NHACUNGCAP> getListNhaCungCap() throws SQLException {
        ArrayList<NHACUNGCAP> list = new ArrayList<NHACUNGCAP>();
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "SELECT * FROM tb_nhacungcap order by ID desc";
        ResultSet rs = io.getResultSet(sql);
        while (rs.next()) {
            NHACUNGCAP ncc = new NHACUNGCAP();
            ncc.setID(rs.getInt("ID"));
            ncc.setMaNhaCungCap(rs.getString("MaNhaCungCap"));
            ncc.setTenNhaCungCap(rs.getString("TenNhaCungCap"));
            ncc.setDiaChi(rs.getString("DiaChi"));
            ncc.setEmail(rs.getString("Email"));
            ncc.setSoDienThoai(rs.getString("SoDienThoai"));
            ncc.setFax(rs.getString("Fax"));
            list.add(ncc);
        }
        io.close();
        return list;
    }

    public boolean checkTenNCC(String TenNhaCungCap) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        boolean check = false;
        String sql = "SELECT COUNT(ID) FROM tb_nhacungcap WHERE TenNhaCungCap = '" + TenNhaCungCap + "'";
        ResultSet rs = io.getResultSet(sql);
        if(rs.next()){
            int ID = rs.getInt(1);
            if(ID >= 1){
                check = true;
            }
        }
        io.close();
        return check;
    }

    public int MaxNCC() throws SQLException {
        int Max = 0;
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "SELECT MAX(ID) FROM tb_nhacungcap";
        ResultSet rs = io.getResultSet(sql);
        if (rs.next()) {
            Max = rs.getInt(1);
        }
        io.close();
        return Max;
    }

    public void InsertNhaCungCap(String MaNCC, String TenNCC) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "INSERT INTO tb_nhacungcap (MaNhaCungCap, TenNhaCungCap) VALUES (?,?)";
        PreparedStatement stm = io.io_prepare(sql);
        stm.setString(1, MaNCC);
        stm.setString(2, TenNCC);
        stm.executeUpdate();
        io.close();
    }
}
