/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.SANPHAM;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author tranl
 */
public class SANPHAM_DAO {

    
    public void setGiaGocMau(int giaGoc, String MaSanPham) throws SQLException{
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "UPDATE tb_sanpham_temp SET GiaGoc = " + giaGoc + " WHERE MaSanPham = '" + MaSanPham + "'";
        io.getStatement().executeUpdate(sql);       
        io.close();
    }
    
    public void setGiaGoc(int giaGoc, String MaSanPham) throws SQLException{
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "UPDATE tb_sanpham SET GiaGoc = " + giaGoc + " WHERE MaSanPham = '" + MaSanPham + "'";
        io.getStatement().executeUpdate(sql);       
        io.close();
    }
    
    public void insertKhoAnh_MauID(int ID) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "SELECT * FROM tb_khoanh_temp WHERE MaSanPham = " + ID;
        ResultSet rs = io.getResultSet(sql);
        while (rs.next()) {
            String url = rs.getString("URL");
            int AnhDaiDien = rs.getInt("AnhDaiDien");
            String sql1 = "INSERT INTO tb_khoanh(URL, MaSanPham, AnhDaiDien) VALUES (?,?,?)";
            PreparedStatement stm = io.io_prepare(sql1);
            stm.setString(1, url);
            stm.setInt(2, ID);
            stm.setInt(3, AnhDaiDien);
            stm.executeUpdate();
        }
        io.close();
    }

    public void insertLoaiSanPham_MauID(int ID) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "SELECT * FROM tb_sanpham_has_tb_loaisanpham_temp WHERE tb_sanpham_ID = " + ID;
        ResultSet rs = io.getResultSet(sql);
        while (rs.next()) {
            int ID_loai = rs.getInt("tb_loaisanpham_ID");
            String sql1 = "INSERT INTO tb_sanpham_has_tb_loaisanpham(tb_sanpham_ID, tb_loaisanpham_ID) VALUES (?, ?)";
            PreparedStatement stm = io.io_prepare(sql1);
            stm.setInt(1, ID);
            stm.setInt(2, ID_loai);
            stm.executeUpdate();
        }
        io.close();
    }

    public void insertSanPham_Mau(String MaSanPham) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        SANPHAM sp = getSanPham_Mau(MaSanPham);
        String sql = "INSERT INTO tb_sanpham(ID,MaSanPham,TenSanPham,GiaGoc,DonGia,GiamGia,MoTa,SoLuong,LuotXem,LuotBinhLuan,SoLanMua,tb_nhasanxuat_MaNSX) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement stm = io.io_prepare(sql);
        stm.setInt(1, sp.getID());
        stm.setString(2, MaSanPham);
        stm.setString(3, sp.getTenSanPham());
        stm.setInt(4, sp.getGiaGoc());
        stm.setInt(5, sp.getDonGia());
        stm.setInt(6, sp.getGiamGia());
        stm.setString(7, sp.getMoTa());
        stm.setInt(8, sp.getSoLuong());
        stm.setInt(9, sp.getLuotXem());
        stm.setInt(10, sp.getLuotBinhLuan());
        stm.setInt(11, sp.getSoLanMua());
        stm.setString(12, sp.getTb_nhasanxuat_MaNSX());

        stm.executeUpdate();
        io.close();
    }

    public void ChuyenMauToChinh(String MaSanPham) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        // chuyen kho anh truoc.
        int ID = return_IDSanPham_Mau(MaSanPham);
        if (checkDup(MaSanPham)) {
            XoaKhoAnh(MaSanPham);
            XoaLoaiSanPham(MaSanPham);
            XoaSanPham(MaSanPham);
            insertKhoAnh_MauID(ID);
            insertLoaiSanPham_MauID(ID);
            insertSanPham_Mau(MaSanPham);
            XoaKhoAnhMau(MaSanPham);
            XoaLoaiSanPhamMau(MaSanPham);
            XoaSanPhamMau(MaSanPham);
        } else {
            insertKhoAnh_MauID(ID);
            insertLoaiSanPham_MauID(ID);
            insertSanPham_Mau(MaSanPham);
            XoaKhoAnhMau(MaSanPham);
            XoaLoaiSanPhamMau(MaSanPham);
            XoaSanPhamMau(MaSanPham);
        }
        io.close();
    }

    public void XoaSanPhamMau(String MaSanPham) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "DELETE FROM tb_sanpham_temp WHERE MaSanPham = '" + MaSanPham + "'";
        io.getStatement().executeUpdate(sql);
        io.close();
    }

    public void XoaLoaiSanPhamMau(String MaSanPham) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        int ID = this.return_IDSanPham_Mau(MaSanPham);
        String sql = "DELETE FROM tb_sanpham_has_tb_loaisanpham_temp WHERE tb_sanpham_ID = " + ID;
        io.getStatement().executeUpdate(sql);
        io.close();
    }

    public void XoaKhoAnhMau(String MaSanPham) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        int ID = this.return_IDSanPham_Mau(MaSanPham);
        String sql = "DELETE FROM tb_khoanh_temp WHERE MaSanPham = " + ID;
        io.getStatement().executeUpdate(sql);
        io.close();
    }

    
    public ArrayList<SANPHAM> getListSP_temp() throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        ArrayList<SANPHAM> list = new ArrayList<SANPHAM>();
        String sql = "SELECT * FROM tb_sanpham_temp";
        ResultSet rs = io.getResultSet(sql);
        while (rs.next()) {
            int ID = rs.getInt("ID");
            String MaSanPham = rs.getString("MaSanPham");
            String TenSanPham = rs.getString("TenSanPham");
            int DonGia = rs.getInt("DonGia");
            int GiaGoc = rs.getInt("GiaGoc");
            int SoLuong = rs.getInt("SoLuong");
            SANPHAM sp = new SANPHAM();
            sp.setID(ID);
            sp.setMaSanPham(MaSanPham);
            sp.setTenSanPham(TenSanPham);
            sp.setDonGia(DonGia);
            sp.setSoLuong(SoLuong);
            sp.setGiaGoc(GiaGoc);
            list.add(sp);
        }
        io.close();
        return list;
    }

    public void setGiaGoc(String MaSanPham, int GiaGoc) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "UPDATE tb_sanpham SET GiaGoc = " + GiaGoc + " WHERE MaSanPham = '" + MaSanPham + "'";
        io.getStatement().executeUpdate(sql);
        io.close();
    }

    public void setGiaGocMau(String MaSanPham, int GiaGoc) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "UPDATE tb_sanpham_temp SET GiaGoc = " + GiaGoc + " WHERE MaSanPham = '" + MaSanPham + "'";
        io.getStatement().executeUpdate(sql);
        io.close();
    }

    public void setMau(String MaSanPham) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "UPDATE tb_sanpham_temp SET Mau = 1 WHERE MaSanPham = '" + MaSanPham + "'";
        io.getStatement().executeUpdate(sql);
        io.close();
    }

    public void setSoLuong(String MaSanPham, int SoLuong) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "UPDATE tb_sanpham_temp set SoLuong = " + SoLuong + " WHERE MaSanPham = '" + MaSanPham + "'";
        io.getStatement().executeUpdate(sql);
        io.close();
    }

    public void XoaSanPham(String MaSanPham) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "DELETE FROM tb_sanpham WHERE MaSanPham = '" + MaSanPham + "'";
        io.getStatement().executeUpdate(sql);
        io.close();
    }

    public void XoaBinhLuan(String MaSanPham){
        IODatabase io = new IODatabase();
        io.conn();
        
        io.close();
    }
    public void XoaLoaiSanPham(String MaSanPham) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        int ID = this.return_IDSanPham(MaSanPham);
        String sql = "DELETE FROM tb_sanpham_has_tb_loaisanpham WHERE tb_sanpham_ID = " + ID;
        io.getStatement().executeUpdate(sql);
        io.close();
    }

    public void XoaKhoAnh(String MaSanPham) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        int ID = this.return_IDSanPham(MaSanPham);
        String sql = "DELETE FROM tb_khoanh WHERE MaSanPham = " + ID;
        io.getStatement().executeUpdate(sql);
        io.close();
    }

    public int GetSoLuongGiaTien(int GiaKD, int GiaKT) throws SQLException {
        int SoLuong = 0;

        IODatabase io = new IODatabase();
        io.conn();
        String sql = "";
        if (GiaKT == 0) {
            sql = "SELECT COUNT(ID) FROM tb_sanpham where DonGia >= " + GiaKD;
        } else {
            sql = "SELECT COUNT(ID) FROM tb_sanpham where DonGia >= " + GiaKD + " and DonGia <= " + GiaKT;
        }
        ResultSet rs = io.getResultSet(sql);
        if (rs.next()) {
            System.out.println("I here");
            SoLuong = rs.getInt(1);
        }
        io.close();
        return SoLuong;
    }

    public ArrayList<SANPHAM> PhanTrangGiaTien(int GiaKD, int GiaKT, int start, int end) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        ArrayList<SANPHAM> list = new ArrayList<SANPHAM>();
        if (GiaKT == 0) {
            String sql = "select * from tb_sanpham where DonGia >= " + GiaKD + " limit " + start + " , " + end;
            ResultSet rs = io.getResultSet(sql);
            while (rs.next()) {
                String MaSP = rs.getString("MaSanPham");
                SANPHAM sp = this.getSanPham(MaSP);
                list.add(sp);
            }
        } else {
            String sql = "select * from tb_sanpham where DonGia >= " + GiaKD + " and DonGia <= " + GiaKT + " limit " + start + " , " + end;
            ResultSet rs = io.getResultSet(sql);
            while (rs.next()) {
                String MaSP = rs.getString("MaSanPham");
                SANPHAM sp = this.getSanPham(MaSP);
                list.add(sp);
            }
        }

        io.close();
        return list;
    }

    public ArrayList<SANPHAM> PhanTrangNhaSanXuat(String MaNSX, int start, int end) throws SQLException {
        ArrayList<SANPHAM> list = new ArrayList<SANPHAM>();
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "select * from tb_sanpham where tb_nhasanxuat_MaNSX = '" + MaNSX + "' limit " + start + " , " + end;
        ResultSet rs = io.getResultSet(sql);
        while (rs.next()) {
            String MaSP = rs.getString("MaSanPham");
            SANPHAM sp = this.getSanPham(MaSP);
            list.add(sp);
        }
        io.close();
        return list;
    }

    public int SoLuongSanPhamNhaSanXuat(String MaNSX) throws SQLException {
        int SoLuong = 0;
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "SELECT COUNT(ID) FROM db_cuahangdochoi.tb_sanpham WHERE tb_nhasanxuat_MaNSX = '" + MaNSX + "'";
        ResultSet rs = io.getResultSet(sql);
        if (rs.next()) {
            SoLuong = rs.getInt(1);
        }
        io.close();
        return SoLuong;
    }

    public int SoLuongSanPham() throws SQLException {
        int SoLuong = 0;
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "SELECT count(ID) FROM tb_sanpham";
        ResultSet rs = io.getResultSet(sql);
        if (rs.next()) {
            SoLuong = rs.getInt(1);
        }
        io.close();
        return SoLuong;
    }

    public ArrayList<SANPHAM> PhanTrangSanPham(int start, int end) throws SQLException {
        ArrayList<SANPHAM> list = new ArrayList<SANPHAM>();
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "SELECT * FROM tb_sanpham limit ?, ?";
        PreparedStatement st = io.io_prepare(sql);
        st.setInt(1, start);
        st.setInt(2, end);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            SANPHAM sp = getSanPham(rs.getString("MaSanPham"));
            list.add(sp);
        }
        io.close();
        return list;
    }

    public ArrayList<SANPHAM> PhanTrangSanPhamDanhMuc(String MaLoaiSanPham, int start, int end) throws SQLException {
        ArrayList<SANPHAM> list = new ArrayList<SANPHAM>();
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "SELECT id FROM db_cuahangdochoi.tb_loaisanpham where MaLoaiSanPham = '" + MaLoaiSanPham + "'";
        ResultSet rs = io.getResultSet(sql);
        int ID = 0;
        if (rs.next()) {
            ID = rs.getInt(1);
        }
        rs.close();
        io.close();

        io.conn();
        String sql2 = "SELECT tb_sanpham_ID FROM db_cuahangdochoi.tb_sanpham_has_tb_loaisanpham where tb_loaisanpham_ID = " + ID + " limit " + start + "," + end;

        rs = io.getResultSet(sql2);
        while (rs.next()) {
            IODatabase io2 = new IODatabase();
            io2.conn();
            String sql3 = "SELECT * FROM tb_sanpham where ID = " + rs.getInt(1);
            ResultSet rs2 = io2.getResultSet(sql3);

            if (rs2.next()) {
                int ID2 = rs2.getInt("ID");
                String MaSanPham = rs2.getString("MaSanPham");
                String TenSanPham = rs2.getString("TenSanPham");
                int DonGia = rs2.getInt("DonGia");
                int GiamGia = rs2.getInt("GiamGia");
                Date NgayCapNhap = rs2.getDate("NgayCapNhap");
                String MoTa = rs2.getString("MoTa");

                int LuotXem = rs2.getInt("LuotXem");
                int LuotBinhLuan = rs2.getInt("LuotBinhLuan");
                int SoLanMua = rs2.getInt("SoLanMua");

                String tb_nhasanxuat_MaNSX = rs2.getString("tb_nhasanxuat_MaNSX");
                SANPHAM sp = new SANPHAM(ID2, MaSanPham, TenSanPham, DonGia, GiamGia, NgayCapNhap, MoTa, LuotXem, LuotBinhLuan, SoLanMua, tb_nhasanxuat_MaNSX);

                IODatabase io22 = new IODatabase();
                io22.conn();
                String sql1 = "select count(id) from tb_khoanh where MaSanPham = '" + ID2 + "'";
                ResultSet kq1 = io22.getResultSet(sql1);
                int SoLuong = 0;
                if (kq1.next()) {
                    SoLuong = kq1.getInt(1);
                }
                io22.close();

                io22.conn();
                sp.setHinhAnh(new String[SoLuong]);
                String sql22 = "select * from tb_khoanh where MaSanPham ='" + ID2 + "' and AnhDaiDien = 1";
                ResultSet kq2 = io22.getResultSet(sql22);
                if (kq2.next()) {
                    sp.getHinhAnh()[0] = kq2.getString("URL");
                }
                io22.close();

                io22.conn();
                String sql33 = "select * from tb_khoanh where MaSanPham='" + ID2 + "' and AnhDaiDien = 0";
                ResultSet kq3 = io22.getResultSet(sql33);
                int index = 1;
                while (kq3.next()) {
                    sp.getHinhAnh()[index] = kq3.getString("URL");
                    index++;
                }
                io22.close();
                list.add(sp);
            }
            io2.close();
        }

        return list;
    }

    public int SoLuong(int begin, int end) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "select count(id) from tb_sanpham where DonGia >= " + begin + " and DonGia < " + end;
        ResultSet rs = io.getResultSet(sql);
        int soLuong = 0;
        if (rs.next()) {
            soLuong = rs.getInt(1);
        }
        io.close();
        return soLuong;
    }

    public int SoLuongMore(int begin) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "select count(id) from tb_sanpham where DonGia >= " + begin;
        ResultSet rs = io.getResultSet(sql);
        int soLuong = 0;
        if (rs.next()) {
            soLuong = rs.getInt(1);
        }
        io.close();
        return soLuong;
    }

    public ArrayList<SANPHAM> get_ND() throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "select * from tb_sanpham ORDER BY NgayCapNhap DESC";
        ResultSet rs = io.getResultSet(sql);
        ArrayList<SANPHAM> list = new ArrayList<SANPHAM>();
        while (rs.next()) {
            int ID = rs.getInt("ID");
            String MaSanPham = rs.getString("MaSanPham");
            String TenSanPham = rs.getString("TenSanPham");
            int DonGia = rs.getInt("DonGia");
            int GiamGia = rs.getInt("GiamGia");
            Date NgayCapNhap = rs.getDate("NgayCapNhap");
            String MoTa = rs.getString("MoTa");

            int LuotXem = rs.getInt("LuotXem");
            int LuotBinhLuan = rs.getInt("LuotBinhLuan");
            int SoLanMua = rs.getInt("SoLanMua");

            String tb_nhasanxuat_MaNSX = rs.getString("tb_nhasanxuat_MaNSX");
            SANPHAM sp = new SANPHAM(ID, MaSanPham, TenSanPham, DonGia, GiamGia, NgayCapNhap, MoTa, LuotXem, LuotBinhLuan, SoLanMua, tb_nhasanxuat_MaNSX);

            IODatabase io2 = new IODatabase();
            io2.conn();
            String sql1 = "select count(id) from tb_khoanh where MaSanPham = '" + ID + "'";
            ResultSet kq1 = io2.getResultSet(sql1);
            int SoLuong = 0;
            if (kq1.next()) {
                SoLuong = kq1.getInt(1);
            }
            io2.close();

            io2.conn();
            sp.setHinhAnh(new String[SoLuong]);
            String sql2 = "select * from tb_khoanh where MaSanPham ='" + ID + "' and AnhDaiDien = 1";
            ResultSet kq2 = io2.getResultSet(sql2);
            if (kq2.next()) {
                sp.getHinhAnh()[0] = kq2.getString("URL");
            }
            io2.close();

            io2.conn();
            String sql3 = "select * from tb_khoanh where MaSanPham='" + ID + "' and AnhDaiDien = 0";
            ResultSet kq3 = io2.getResultSet(sql3);
            int index = 1;
            while (kq3.next()) {
                sp.getHinhAnh()[index] = kq3.getString("URL");
                index++;
            }
            io2.close();
            list.add(sp);
        }
        io.close();
        return list;
    }

    public void insert_khoAnh(String MaSanPham, String AnhDaiDien, String[] ListAnh) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        int ID = return_IDSanPham(MaSanPham);
        for (String anh : ListAnh) {
            String query = "INSERT INTO tb_khoanh (URL, MaSanPham) VALUES (?,?)";
            PreparedStatement pstatement = io.io_prepare(query);
            pstatement.setString(1, anh);
            pstatement.setInt(2, ID);
            pstatement.executeUpdate();
        }
        String query = "UPDATE tb_khoanh SET AnhDaiDien = 1 WHERE URL = '" + AnhDaiDien + "'";
        io.executeQuery(query);
        io.close();
    }

    public void insert_khoAnh_Mau(String MaSanPham, String AnhDaiDien, String[] ListAnh) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        int ID = return_IDSanPham_Mau(MaSanPham);
        for (String anh : ListAnh) {
            String query = "INSERT INTO tb_khoanh_temp (URL, MaSanPham) VALUES (?,?)";
            PreparedStatement pstatement = io.io_prepare(query);
            pstatement.setString(1, anh);
            pstatement.setInt(2, ID);
            pstatement.executeUpdate();
        }
        String query = "UPDATE tb_khoanh_temp SET AnhDaiDien = 1 WHERE URL = '" + AnhDaiDien + "'";
        io.executeQuery(query);
        io.close();
    }

    public void insert_SP(String MaSP, String TenSanPham, int DonGia, int GiamGia, String MoTa, String tb_nhasanxuat_MaNSV) throws SQLException, ParseException {
        IODatabase io = new IODatabase();
        io.conn();
        String query = "INSERT INTO db_cuahangdochoi.tb_sanpham (MaSanPham,TenSanPham,DonGia,GiamGia,NgayCapNhap,MoTa,tb_nhasanxuat_MaNSX) VALUES (?,?,?,?,?,?,?)";

        LocalDate localDate = LocalDate.now();
        String date = DateTimeFormatter.ofPattern("yyyy/MM/dd").format(localDate);
        java.util.Date date2 = Calendar.getInstance().getTime();
        java.sql.Date sqlDate = new java.sql.Date(date2.getTime());

        PreparedStatement pstatement = io.io_prepare(query);

        pstatement.setString(1, MaSP);
        pstatement.setString(2, TenSanPham);
        pstatement.setInt(3, DonGia);
        pstatement.setInt(4, GiamGia);
        pstatement.setDate(5, sqlDate);
        pstatement.setString(6, MoTa);
        // pstatement.setInt(7, DoTuoiYeuCau);
        pstatement.setString(7, tb_nhasanxuat_MaNSV);

        String setUtf8 = "SET NAMES 'UTF8'";
        io.executeQuery(setUtf8);

        pstatement.executeUpdate();
        io.close();
    }

    public void insert_SP_Mau(String MaSP, String TenSanPham, int DonGia, int GiamGia, String MoTa, String tb_nhasanxuat_MaNSV) throws SQLException, ParseException {
        IODatabase io = new IODatabase();
        io.conn();
        String query = "INSERT INTO db_cuahangdochoi.tb_sanpham_temp (MaSanPham,TenSanPham,DonGia,GiamGia,NgayCapNhap,MoTa,tb_nhasanxuat_MaNSX) VALUES (?,?,?,?,?,?,?)";

        LocalDate localDate = LocalDate.now();
        String date = DateTimeFormatter.ofPattern("yyyy/MM/dd").format(localDate);
        java.util.Date date2 = Calendar.getInstance().getTime();
        java.sql.Date sqlDate = new java.sql.Date(date2.getTime());

        PreparedStatement pstatement = io.io_prepare(query);

        pstatement.setString(1, MaSP);
        pstatement.setString(2, TenSanPham);
        pstatement.setInt(3, DonGia);
        pstatement.setInt(4, GiamGia);
        pstatement.setDate(5, sqlDate);
        pstatement.setString(6, MoTa);
        // pstatement.setInt(7, DoTuoiYeuCau);
        pstatement.setString(7, tb_nhasanxuat_MaNSV);

        String setUtf8 = "SET NAMES 'UTF8'";
        io.executeQuery(setUtf8);

        pstatement.executeUpdate();
        io.close();
    }

    public boolean checkDup(String MaSanPham) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "SELECT COUNT(ID) FROM tb_sanpham WHERE MaSanPham = '" + MaSanPham + "'";
        boolean check = false;
        ResultSet rs = io.getResultSet(sql);
        if (rs.next()) {
            int count = rs.getInt(1);
            if (count == 1) {
                check = true;
            }
        }
        io.close();
        return check;
    }

    public boolean checkDupMau(String MaSanPham) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "SELECT COUNT(ID) FROM tb_sanpham_temp WHERE MaSanPham = '" + MaSanPham + "'";
        boolean check = false;
        ResultSet rs = io.getResultSet(sql);
        if (rs.next()) {
            int count = rs.getInt(1);
            if (count == 1) {
                check = true;
            }
        }
        io.close();
        return check;
    }

    public void addSoLuongMauDup(String MaSanPham, int SoLuong) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "SELECT SoLuong FROM tb_sanpham_temp WHERE MaSanPham = '" + MaSanPham + "'";
        int sl = 0;
        ResultSet rs = io.getResultSet(sql);
        if (rs.next()) {
            sl = rs.getInt(1);
        }
        sl = sl + SoLuong;
        setSoLuong(MaSanPham, sl);
        io.close();
    }

    public int return_IDLoaiSanPham(String LoaiSanPham) throws SQLException {
        int ID = 0;
        IODatabase io = new IODatabase();
        io.conn();
        String query = "SELECT * FROM db_cuahangdochoi.tb_loaisanpham where MaLoaiSanPham = '" + LoaiSanPham + "'";
        Statement st = io.getConnection().createStatement();
        ResultSet rs = st.executeQuery(query);
        if (rs.next()) {
            ID = rs.getInt("ID");
        }
        io.close();
        return ID;
    }

    public int return_IDSanPham(String SanPham) throws SQLException {
        int ID = 0;
        IODatabase io = new IODatabase();
        io.conn();
        String query = "SELECT * FROM db_cuahangdochoi.tb_sanpham where MaSanPham = '" + SanPham + "'";
        Statement st = io.getConnection().createStatement();
        ResultSet rs = st.executeQuery(query);
        if (rs.next()) {
            ID = rs.getInt("ID");
        }
        io.close();
        return ID;
    }

    public int return_IDSanPham_Mau(String SanPham) throws SQLException {
        int ID = 0;
        IODatabase io = new IODatabase();
        io.conn();
        String query = "SELECT * FROM db_cuahangdochoi.tb_sanpham_temp where MaSanPham = '" + SanPham + "'";
        Statement st = io.getConnection().createStatement();
        ResultSet rs = st.executeQuery(query);
        if (rs.next()) {
            ID = rs.getInt("ID");
        }
        io.close();
        return ID;
    }

    public void insert_LoaiSanPham(String[] LoaiSanPham, String MaSanPham) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();

        int ID_SP = return_IDSanPham(MaSanPham);
        for (String loai : LoaiSanPham) {
            String query = "INSERT INTO db_cuahangdochoi.tb_sanpham_has_tb_loaisanpham (tb_sanpham_ID, tb_loaisanpham_ID) VALUE (?, ?)";
            int ID_LSP = return_IDLoaiSanPham(loai);
            PreparedStatement pstatement = io.io_prepare(query);
            pstatement.setInt(1, ID_SP);
            pstatement.setInt(2, ID_LSP);
            pstatement.executeUpdate();
        }
        io.close();
    }

    public void insert_LoaiSanPham_Mau(String[] LoaiSanPham, String MaSanPham) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();

        int ID_SP = return_IDSanPham_Mau(MaSanPham);
        for (String loai : LoaiSanPham) {
            String query = "INSERT INTO tb_sanpham_has_tb_loaisanpham_temp (tb_sanpham_ID, tb_loaisanpham_ID) VALUE (?, ?)";
            int ID_LSP = return_IDLoaiSanPham(loai);
            PreparedStatement pstatement = io.io_prepare(query);
            pstatement.setInt(1, ID_SP);
            pstatement.setInt(2, ID_LSP);
            pstatement.executeUpdate();
        }
        io.close();
    }

    public SANPHAM getSanPham(String MaSanPhamNeed) throws SQLException {

        IODatabase io = new IODatabase();
        io.conn();
        SANPHAM sp_return = new SANPHAM();
        String query = "SELECT * FROM tb_sanpham WHERE MaSanPham = '" + MaSanPhamNeed + "'";
        ResultSet rs = io.getResultSet(query);
        if (rs.next()) {
            int ID = rs.getInt("ID");
            String MaSanPham = rs.getString("MaSanPham");
            String TenSanPham = rs.getString("TenSanPham");
            int DonGia = rs.getInt("DonGia");
            int GiaGoc = rs.getInt("GiaGoc");
            int GiamGia = rs.getInt("GiamGia");
            Date NgayCapNhap = rs.getDate("NgayCapNhap");
            String MoTa = rs.getString("MoTa");

            int SoLuongSP = rs.getInt("SoLuong");
            int LuotXem = rs.getInt("LuotXem");
            int LuotBinhLuan = rs.getInt("LuotBinhLuan");
            int SoLanMua = rs.getInt("SoLanMua");

            String tb_nhasanxuat_MaNSX = rs.getString("tb_nhasanxuat_MaNSX");
            SANPHAM sp = new SANPHAM(ID, MaSanPham, TenSanPham, DonGia, GiamGia, NgayCapNhap, MoTa, LuotXem, LuotBinhLuan, SoLanMua, tb_nhasanxuat_MaNSX);
            
            String sql1 = "select count(id) from tb_khoanh where MaSanPham = '" + ID + "'";
            ResultSet kq1 = io.getResultSet(sql1);
            int SoLuong = 0;
            if (kq1.next()) {
                SoLuong = kq1.getInt(1);
            }
            sp.setHinhAnh(new String[SoLuong]);
            String sql2 = "select * from tb_khoanh where MaSanPham ='" + ID + "' and AnhDaiDien = 1";
            ResultSet kq2 = io.getResultSet(sql2);
            if (kq2.next()) {
                sp.getHinhAnh()[0] = kq2.getString("URL");
            }

            String sql3 = "select * from tb_khoanh where MaSanPham='" + ID + "' and AnhDaiDien = 0";
            ResultSet kq3 = io.getResultSet(sql3);
            int index = 1;
            while (kq3.next()) {
                sp.getHinhAnh()[index] = kq3.getString("URL");
                index++;
            }
            
            sp_return = sp;
            sp_return.setSoLuong(SoLuongSP);
            sp_return.setGiaGoc(GiaGoc);
            sp_return.setSoLuong(SoLuongSP);
        }

        return sp_return;
    }

    public SANPHAM getSanPham_Mau(String MaSanPhamNeed) throws SQLException {

        IODatabase io = new IODatabase();
        io.conn();
        SANPHAM sp_return = new SANPHAM();
        String query = "SELECT * FROM tb_sanpham_temp WHERE MaSanPham = '" + MaSanPhamNeed + "'";
        ResultSet rs = io.getResultSet(query);
        if (rs.next()) {
            int ID = rs.getInt("ID");
            String MaSanPham = rs.getString("MaSanPham");
            String TenSanPham = rs.getString("TenSanPham");
            int DonGia = rs.getInt("DonGia");
            int GiaGoc = rs.getInt("GiaGoc");
            int GiamGia = rs.getInt("GiamGia");
            Date NgayCapNhap = rs.getDate("NgayCapNhap");
            String MoTa = rs.getString("MoTa");

            int SoLuongSP = rs.getInt("SoLuong");
            int LuotXem = rs.getInt("LuotXem");
            int LuotBinhLuan = rs.getInt("LuotBinhLuan");
            int SoLanMua = rs.getInt("SoLanMua");

            String tb_nhasanxuat_MaNSX = rs.getString("tb_nhasanxuat_MaNSX");
            SANPHAM sp = new SANPHAM(ID, MaSanPham, TenSanPham, DonGia, GiamGia, NgayCapNhap, MoTa, LuotXem, LuotBinhLuan, SoLanMua, tb_nhasanxuat_MaNSX);
            sp.setSoLuong(SoLuongSP);
            sp.setGiaGoc(GiaGoc);
            String sql1 = "select count(id) from tb_khoanh_temp where MaSanPham = '" + ID + "'";
            ResultSet kq1 = io.getResultSet(sql1);
            int SoLuong = 0;
            if (kq1.next()) {
                SoLuong = kq1.getInt(1);
            }
            sp.setHinhAnh(new String[SoLuong]);
            String sql2 = "select * from tb_khoanh_temp where MaSanPham ='" + ID + "' and AnhDaiDien = 1";
            ResultSet kq2 = io.getResultSet(sql2);
            if (kq2.next()) {
                sp.getHinhAnh()[0] = kq2.getString("URL");
            }

            String sql3 = "select * from tb_khoanh_temp where MaSanPham='" + ID + "' and AnhDaiDien = 0";
            ResultSet kq3 = io.getResultSet(sql3);
            int index = 1;
            while (kq3.next()) {
                sp.getHinhAnh()[index] = kq3.getString("URL");
                index++;
            }
            sp_return = sp;
            sp_return.setSoLuong(SoLuongSP);
        }

        return sp_return;
    }

    public ArrayList<SANPHAM> TimKiem(String TenSanPham) throws SQLException {
        ArrayList<SANPHAM> list = new ArrayList<SANPHAM>();
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "select * from tb_sanpham where TenSanPham like '%" + TenSanPham + "%'";
        ResultSet rs = io.getResultSet(sql);
        while (rs.next()) {
            String MaSanPham = rs.getString("MaSanPham");
            SANPHAM sp = this.getSanPham(MaSanPham);
            list.add(sp);
        }

        io.close();
        return list;
    }

    public ArrayList<SANPHAM> getNhaSanXuat(String MaNSX) throws SQLException {
        ArrayList<SANPHAM> list = new ArrayList<SANPHAM>();
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "select * from tb_sanpham where tb_nhasanxuat_MaNSX = '" + MaNSX + "'";
        ResultSet rs = io.getResultSet(sql);
        while (rs.next()) {
            String MaSP = rs.getString("MaSanPham");
            SANPHAM sp = this.getSanPham(MaSP);
            list.add(sp);
        }
        io.close();
        return list;
    }

    public ArrayList<SANPHAM> getKhoangTien(int begin, int end) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        ArrayList<SANPHAM> list = new ArrayList<SANPHAM>();
        if (end == 0) {
            String sql = "select * from tb_sanpham where DonGia >= " + begin;
            ResultSet rs = io.getResultSet(sql);
            while (rs.next()) {
                String MaSP = rs.getString("MaSanPham");
                SANPHAM sp = this.getSanPham(MaSP);
                list.add(sp);
            }
        } else {
            String sql = "select * from tb_sanpham where DonGia >= " + begin + " and DonGia <= " + end;
            ResultSet rs = io.getResultSet(sql);
            while (rs.next()) {
                String MaSP = rs.getString("MaSanPham");
                SANPHAM sp = this.getSanPham(MaSP);
                list.add(sp);
            }
        }

        io.close();
        return list;
    }

    public ArrayList<SANPHAM> getDanhMuc(String MaDanhMuc) throws SQLException {
        ArrayList<SANPHAM> list = new ArrayList<SANPHAM>();
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "SELECT id FROM db_cuahangdochoi.tb_loaisanpham where MaLoaiSanPham = '" + MaDanhMuc + "'";
        ResultSet rs = io.getResultSet(sql);
        int ID = 0;
        if (rs.next()) {
            ID = rs.getInt(1);
        }
        rs.close();
        io.close();

        io.conn();
        String sql2 = "SELECT tb_sanpham_ID FROM db_cuahangdochoi.tb_sanpham_has_tb_loaisanpham where tb_loaisanpham_ID = " + ID;
        rs = io.getResultSet(sql2);
        while (rs.next()) {
            IODatabase io2 = new IODatabase();
            io2.conn();
            String sql3 = "SELECT * FROM tb_sanpham where ID = " + rs.getInt(1);
            ResultSet rs2 = io2.getResultSet(sql3);

            if (rs2.next()) {
                int ID2 = rs2.getInt("ID");
                String MaSanPham = rs2.getString("MaSanPham");
                String TenSanPham = rs2.getString("TenSanPham");
                int DonGia = rs2.getInt("DonGia");
                int GiamGia = rs2.getInt("GiamGia");
                Date NgayCapNhap = rs2.getDate("NgayCapNhap");
                String MoTa = rs2.getString("MoTa");

                int LuotXem = rs2.getInt("LuotXem");
                int LuotBinhLuan = rs2.getInt("LuotBinhLuan");
                int SoLanMua = rs2.getInt("SoLanMua");

                String tb_nhasanxuat_MaNSX = rs2.getString("tb_nhasanxuat_MaNSX");
                SANPHAM sp = new SANPHAM(ID2, MaSanPham, TenSanPham, DonGia, GiamGia, NgayCapNhap, MoTa, LuotXem, LuotBinhLuan, SoLanMua, tb_nhasanxuat_MaNSX);

                IODatabase io22 = new IODatabase();
                io22.conn();
                String sql1 = "select count(id) from tb_khoanh where MaSanPham = '" + ID2 + "'";
                ResultSet kq1 = io22.getResultSet(sql1);
                int SoLuong = 0;
                if (kq1.next()) {
                    SoLuong = kq1.getInt(1);
                }
                io22.close();

                io22.conn();
                sp.setHinhAnh(new String[SoLuong]);
                String sql22 = "select * from tb_khoanh where MaSanPham ='" + ID2 + "' and AnhDaiDien = 1";
                ResultSet kq2 = io22.getResultSet(sql22);
                if (kq2.next()) {
                    sp.getHinhAnh()[0] = kq2.getString("URL");
                }
                io22.close();

                io22.conn();
                String sql33 = "select * from tb_khoanh where MaSanPham='" + ID2 + "' and AnhDaiDien = 0";
                ResultSet kq3 = io22.getResultSet(sql33);
                int index = 1;
                while (kq3.next()) {
                    sp.getHinhAnh()[index] = kq3.getString("URL");
                    index++;
                }
                io22.close();
                list.add(sp);
            }
            io2.close();
        }

        return list;
    }

    public SANPHAM getSanPhambyID(int ID) throws SQLException {
        SANPHAM sp = new SANPHAM();
        ArrayList<SANPHAM> list = this.get_ND();
        for (SANPHAM temp : list) {
            if (temp.getID() == ID) {
                sp = temp;
                break;
            }
        }
        return sp;
    }

    public ArrayList<SANPHAM> getSanPhamTuongTu(SANPHAM sp) throws SQLException {
        ArrayList<SANPHAM> list = new ArrayList<SANPHAM>();
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "SELECT * FROM db_cuahangdochoi.tb_sanpham WHERE  DonGia >= " + sp.getDonGia() + " and tb_nhasanxuat_MaNSX like '" + sp.getTb_nhasanxuat_MaNSX() + "' limit 0, 6";
        ResultSet rs = io.getResultSet(sql);
        while (rs.next()) {
            String maSanPham = rs.getString("MaSanPham");
            SANPHAM temp = this.getSanPham(maSanPham);
            list.add(temp);
        }
        io.close();
        return list;
    }

    public void insert_test(String test) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        String query = "INSERT INTO db_cuahangdochoi.tb_test (name) VALUE ('" + test + "')";

        io.executeQuery(query);
        io.close();
    }

}
