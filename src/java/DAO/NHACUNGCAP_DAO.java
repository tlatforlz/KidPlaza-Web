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

    public NHACUNGCAP getNhaCungCap(String MaNhaCungCap) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "SELECT * FROM tb_nhacungcap WHERE MaNhaCungCap = '" + MaNhaCungCap + "'";
        ResultSet rs = io.getResultSet(sql);
        NHACUNGCAP ncc = new NHACUNGCAP();
        if (rs.next()) {
            ncc.setID(rs.getInt("ID"));
            ncc.setMaNhaCungCap(rs.getString("MaNhaCungCap"));
            ncc.setTenNhaCungCap(rs.getString("TenNhaCungCap"));
            String diachi = rs.getString("DiaChi");

            ncc.setDiaChi(diachi);
            String email = rs.getString("Email");

            ncc.setEmail(email);
            String sdt = rs.getString("SoDienThoai");

            ncc.setSoDienThoai(sdt);
            String fax = rs.getString("Fax");

            ncc.setSoDienThoai(sdt);
            ncc.setFax(fax);
        }
        io.close();
        return ncc;
    }

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
            String diachi = rs.getString("DiaChi");
            if (diachi == null) {
                diachi = "Chưa có thông tin";
            }
            ncc.setDiaChi(diachi);
            String email = rs.getString("Email");
            if (email == null) {
                email = "Chưa có thông tin";
            }
            ncc.setEmail(email);
            String sdt = rs.getString("SoDienThoai");
            if (sdt == null) {
                sdt = "Chưa có thông tin";
            }
            ncc.setSoDienThoai(sdt);
            String fax = rs.getString("Fax");
            if (fax == null) {
                fax = "Chưa có thông tin";
            }
            ncc.setSoDienThoai(sdt);
            ncc.setFax(fax);
            list.add(ncc);
        }
        io.close();
        return list;
    }

    public boolean checkTenNCC(String TenNhaCungCap) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        boolean check = false;
        String sql = "SELECT COUNT(ID) FROM tb_nhacungcap WHERE TenNhaCungCap like '" + TenNhaCungCap + "'";
        ResultSet rs = io.getResultSet(sql);
        if (rs.next()) {
            int ID = rs.getInt(1);
            if (ID >= 1) {
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

    public void updateNhaCungCap(NHACUNGCAP ncc) throws SQLException{
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "UPDATE tb_nhacungcap SET TenNhaCungCap = '" + ncc.getTenNhaCungCap() + "', DiaChi = '" + ncc.getDiaChi() + "', Email = '" + ncc.getEmail() + "', SoDienThoai = '" + ncc.getSoDienThoai() + "', Fax = '" + ncc.getFax() + "' WHERE MaNhaCungCap = '" + ncc.getMaNhaCungCap() + "'";
        io.getStatement().executeUpdate(sql);
        io.close();
    }
    public void InsertNhaCungCap(NHACUNGCAP ncc) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "INSERT INTO tb_nhacungcap(MaNhaCungCap, TenNhaCungCap, DiaChi, Email, SoDienThoai, Fax) VALUES (?,?,?,?,?,?)";
        PreparedStatement stm = io.io_prepare(sql);
        stm.setString(1, ncc.getMaNhaCungCap());
        stm.setString(2, ncc.getTenNhaCungCap());
        stm.setString(3, ncc.getDiaChi());
        stm.setString(4, ncc.getEmail());
        stm.setString(5, ncc.getSoDienThoai());
        stm.setString(6, ncc.getFax());
        stm.executeUpdate();
        io.close();
    }
    
    public void XoaNhaCungCap(String MaNhaCungCap) throws SQLException{
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "DELETE FROM tb_nhacungcap WHERE MaNhaCungCap = '" + MaNhaCungCap + "'";
        io.getStatement().executeUpdate(sql);
        io.close();
    }
    
    public boolean checkNhaCungCapSuDung(String MaNhaCungCap) throws SQLException{
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "SELECT COUNT(ID) FROM tb_phieunhap WHERE tb_nhacungcap_MaNhaCungCap = '" + MaNhaCungCap + "'";
        ResultSet rs = io.getResultSet(sql);
        boolean check = false;
        if(rs.next()){
            int count = rs.getInt(1);
            if(count != 0){
                check = true;
            }
        }
        io.close();
        return check;
    }
}
