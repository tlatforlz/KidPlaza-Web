/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.CHITIETDATHANG;
import DTO.DONDATHANG;
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
public class DONDATHANG_DAO {

    public int SoLuongDaGiao(String MaSanPham) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        int count = 0;
        String sql = "SELECT SUM(tb_chitietdathang.SoLuong) FROM tb_chitietdathang inner join tb_dondathang on tb_dondathang_MaDonDatHang = MaDonDatHang WHERE tb_chitietdathang.tb_sanpham_MaSanPham = '" + MaSanPham + " ' AND tb_dondathang.TinhTrangGiao = 4";
        ResultSet rs = io.getResultSet(sql);
        if(rs.next()){
           count = rs.getInt(1); 
        }
        io.close();
        return count;
    }

    public ArrayList<SANPHAM> listSPTop() throws SQLException{
        ArrayList<SANPHAM> list = new ArrayList<SANPHAM>();
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "SELECT distinct(tb_sanpham_MaSanPham) FROM tb_chitietdathang inner join tb_dondathang on tb_dondathang_MaDonDatHang = MaDonDatHang WHERE tb_dondathang.TinhTrangGiao = 4;";
        ResultSet rs = io.getResultSet(sql);
        while(rs.next()){
            String MaSanPham = rs.getString(1);
            SANPHAM_DAO sp_dp = new SANPHAM_DAO();
            SANPHAM sp = sp_dp.getSanPham(MaSanPham);
            list.add(sp);
        }
        io.close();
        return list;
    }
    
    public int LoiNhuan(String MaDonDatHang) throws SQLException {
        int Tien = 0;
        CHITIETDATHANG_DAO ct_dp = new CHITIETDATHANG_DAO();
        ArrayList<CHITIETDATHANG> list_ct = ct_dp.getListCT(MaDonDatHang);
        SANPHAM_DAO sp_dp = new SANPHAM_DAO();
        for (CHITIETDATHANG ct : list_ct) {
            SANPHAM sp = sp_dp.getSanPham(ct.getTb_sanpham_MaSanPham());
            sp.Show();
            int ln = sp.getDonGia() - sp.getGiaGoc() - sp.getGiamGia();

            Tien += ln * ct.getSoLuong();
        }
        return Tien;
    }

    public ArrayList<SANPHAM> listSanPhamTop() throws SQLException {
        ArrayList<SANPHAM> list_sp = new ArrayList<SANPHAM>();
        DONDATHANG_DAO ddh_dp = new DONDATHANG_DAO();
        ArrayList<DONDATHANG> list_dp = ddh_dp.getListThanhCong();

        return list_sp;
    }

    public int TongLoiNhuan() throws SQLException {
        int Tien = 0;
        DONDATHANG_DAO ddh_dp = new DONDATHANG_DAO();
        ArrayList<DONDATHANG> list_dh = ddh_dp.getListThanhCong();
        for (DONDATHANG dh : list_dh) {
            Tien += LoiNhuan(dh.getMaDonDatHang());
        }
        return Tien;
    }

    public int SoLuongDonDatHangThangCong() throws SQLException {
        int SoLuong = 0;
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "SELECT COUNT(ID) FROM tb_dondathang WHERE TinhTrangGiao = 4";
        ResultSet rs = io.getResultSet(sql);
        if (rs.next()) {
            SoLuong = rs.getInt(1);
        }
        io.close();
        return SoLuong;
    }

    public int TongDDH() throws SQLException {
        int SoLuong = 0;
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "SELECT COUNT(ID) FROM tb_dondathang WHERE DaHuy = 0 AND TinhTrangGiao != 4 AND TinhTrangGiao != 5";
        ResultSet rs = io.getResultSet(sql);
        if (rs.next()) {
            SoLuong = rs.getInt(1);
        }
        io.close();
        return SoLuong;
    }

    public void updateTinhTrang(String MaDonDatHang, int TinhTrang) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "UPDATE tb_dondathang SET TinhTrangGiao = " + TinhTrang + " WHERE MaDonDatHang = '" + MaDonDatHang + "'";
        io.getStatement().executeUpdate(sql);
        io.close();
    }

    public int countDDH() throws SQLException {
        int SoLuong = 0;
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "SELECT MAX(ID) FROM tb_dondathang";
        ResultSet rs = io.getResultSet(sql);
        if (rs.next()) {
            SoLuong = rs.getInt(1);
        }
        io.close();
        return SoLuong;
    }

    public void InsertDDH(DONDATHANG ddh) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "INSERT INTO tb_dondathang(MaDonDatHang, TongTien, tb_khachhang_MaKhachHang, DiaChiGiaoHang, DaThanhToan) VALUES (?,?,?,?,?)";
        PreparedStatement stm = io.io_prepare(sql);
        stm.setString(1, ddh.getMaDonDatHang());
        stm.setInt(2, ddh.getTongTien());
        stm.setString(3, ddh.getTb_khachhang_MaKhachHang());
        stm.setString(4, ddh.getDiaChiGiaoHang());
        stm.setInt(5, ddh.getDaThanhToan());
        stm.executeUpdate();
        io.close();
    }

    public DONDATHANG getDonDatHang(String MaDonDatHang) throws SQLException {
        DONDATHANG dh = new DONDATHANG();
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "SELECT * FROM tb_dondathang WHERE MaDonDatHang = '" + MaDonDatHang + "'";
        ResultSet rs = io.getResultSet(sql);
        if (rs.next()) {
            int ID = rs.getInt("ID");

            Date NgayDat = rs.getTimestamp("NgayDat");
            Date NgayGiao = rs.getDate("NgayGiao");
            int TinhTrangGiao = rs.getInt("TinhTrangGiao");
            int DaThanhToan = rs.getInt("DaThanhToan");
            int PhiVanChuyen = rs.getInt("PhiVanChuyen");
            int DaXoa = rs.getInt("DaXoa");
            int DaHuy = rs.getInt("DaHuy");
            int TongTien = rs.getInt("TongTien");
            String DiaChiGiaoHang = rs.getString("DiaChiGiaoHang");

            dh.setID(ID);
            dh.setMaDonDatHang(MaDonDatHang);
            dh.setTinhTrangGiao(TinhTrangGiao);
            dh.setNgayDat(NgayDat);
            dh.setNgayGiao(NgayGiao);
            dh.setDaHuy(DaHuy);
            dh.setDaThanhToan(DaThanhToan);
            dh.setPhiVanChuyen(PhiVanChuyen);
            dh.setDaXoa(DaXoa);
            dh.setTongTien(TongTien);
            dh.setDiaChiGiaoHang(DiaChiGiaoHang);
        }
        io.close();
        return dh;
    }

    public ArrayList<DONDATHANG> getListDDH(String MaKhachHang) throws SQLException {
        ArrayList<DONDATHANG> list = new ArrayList<DONDATHANG>();
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "SELECT * FROM tb_dondathang WHERE tb_khachhang_MaKhachHang = '" + MaKhachHang + "'";
        ResultSet rs = io.getResultSet(sql);
        while (rs.next()) {
            int ID = rs.getInt("ID");
            String MaDonDatHang = rs.getString("MaDonDatHang");
            Date NgayDat = rs.getTimestamp("NgayDat");
            Date NgayGiao = rs.getDate("NgayGiao");
            int TinhTrangGiao = rs.getInt("TinhTrangGiao");
            int DaThanhToan = rs.getInt("DaThanhToan");
            int PhiVanChuyen = rs.getInt("PhiVanChuyen");
            int DaXoa = rs.getInt("DaXoa");
            int DaHuy = rs.getInt("DaHuy");
            int TongTien = rs.getInt("TongTien");
            String DiaChiGiaoHang = rs.getString("DiaChiGiaoHang");
            DONDATHANG dh = new DONDATHANG();
            dh.setID(ID);
            dh.setMaDonDatHang(MaDonDatHang);
            dh.setTinhTrangGiao(TinhTrangGiao);
            dh.setNgayDat(NgayDat);
            dh.setNgayGiao(NgayGiao);
            dh.setDaHuy(DaHuy);
            dh.setDaThanhToan(DaThanhToan);
            dh.setPhiVanChuyen(PhiVanChuyen);
            dh.setDaXoa(DaXoa);
            dh.setTongTien(TongTien);
            dh.setDiaChiGiaoHang(DiaChiGiaoHang);
            list.add(dh);
        }
        io.close();
        return list;
    }

    public void XoaDonHang(String MaDonHang) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "UPDATE tb_dondathang SET DaHuy = 1 WHERE MaDonDatHang = '" + MaDonHang + "'";
        io.getStatement().executeUpdate(sql);
        io.close();
    }

    public boolean checkDonHang(String MaDonHang) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "SELECT COUNT(ID) FROM tb_dondathang WHERE MaDonDatHang = '" + MaDonHang + "'";
        ResultSet rs = io.getResultSet(sql);
        boolean check = false;
        if (rs.next()) {
            int count = rs.getInt(1);
            if (count != 0) {
                check = true;
            }
        }
        io.close();
        return check;
    }

    public void updateThanhToan(String MaDonHang) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "UPDATE tb_dondathang SET DaThanhToan = 1 WHERE MaDonDatHang = '" + MaDonHang + "'";
        io.getStatement().executeUpdate(sql);
        io.close();
    }

    public ArrayList<DONDATHANG> getListChuaDuyet() throws SQLException {
        ArrayList<DONDATHANG> list = new ArrayList<DONDATHANG>();
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "SELECT * FROM tb_dondathang WHERE DaHuy = 0 AND TinhTrangGiao != 5 AND TinhTrangGiao != 4";
        ResultSet rs = io.getResultSet(sql);
        while (rs.next()) {
            int ID = rs.getInt("ID");
            String MaDonDatHang = rs.getString("MaDonDatHang");
            Date NgayDat = rs.getTimestamp("NgayDat");
            Date NgayGiao = rs.getDate("NgayGiao");
            int TinhTrangGiao = rs.getInt("TinhTrangGiao");
            int DaThanhToan = rs.getInt("DaThanhToan");
            int PhiVanChuyen = rs.getInt("PhiVanChuyen");
            int DaXoa = rs.getInt("DaXoa");
            int DaHuy = rs.getInt("DaHuy");
            int TongTien = rs.getInt("TongTien");
            String DiaChiGiaoHang = rs.getString("DiaChiGiaoHang");
            DONDATHANG dh = new DONDATHANG();
            dh.setID(ID);
            dh.setMaDonDatHang(MaDonDatHang);
            dh.setTinhTrangGiao(TinhTrangGiao);
            dh.setNgayDat(NgayDat);
            dh.setNgayGiao(NgayGiao);
            dh.setDaHuy(DaHuy);
            dh.setDaThanhToan(DaThanhToan);
            dh.setPhiVanChuyen(PhiVanChuyen);
            dh.setDaXoa(DaXoa);
            dh.setTongTien(TongTien);
            dh.setDiaChiGiaoHang(DiaChiGiaoHang);
            list.add(dh);
        }
        io.close();
        return list;
    }

    public ArrayList<DONDATHANG> getListThanhCong() throws SQLException {
        ArrayList<DONDATHANG> list = new ArrayList<DONDATHANG>();
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "SELECT * FROM tb_dondathang WHERE TinhTrangGiao = 4";
        ResultSet rs = io.getResultSet(sql);
        while (rs.next()) {
            int ID = rs.getInt("ID");
            String MaDonDatHang = rs.getString("MaDonDatHang");
            Date NgayDat = rs.getTimestamp("NgayDat");
            Date NgayGiao = rs.getDate("NgayGiao");
            int TinhTrangGiao = rs.getInt("TinhTrangGiao");
            int DaThanhToan = rs.getInt("DaThanhToan");
            int PhiVanChuyen = rs.getInt("PhiVanChuyen");
            int DaXoa = rs.getInt("DaXoa");
            int DaHuy = rs.getInt("DaHuy");
            int TongTien = rs.getInt("TongTien");
            String DiaChiGiaoHang = rs.getString("DiaChiGiaoHang");
            DONDATHANG dh = new DONDATHANG();
            dh.setID(ID);
            dh.setMaDonDatHang(MaDonDatHang);
            dh.setTinhTrangGiao(TinhTrangGiao);
            dh.setNgayDat(NgayDat);
            dh.setNgayGiao(NgayGiao);
            dh.setDaHuy(DaHuy);
            dh.setDaThanhToan(DaThanhToan);
            dh.setPhiVanChuyen(PhiVanChuyen);
            dh.setDaXoa(DaXoa);
            dh.setTongTien(TongTien);
            dh.setDiaChiGiaoHang(DiaChiGiaoHang);
            list.add(dh);
        }
        io.close();
        return list;
    }

    public ArrayList<DONDATHANG> getList() throws SQLException {
        ArrayList<DONDATHANG> list = new ArrayList<DONDATHANG>();
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "SELECT * FROM tb_dondathang";
        ResultSet rs = io.getResultSet(sql);
        while (rs.next()) {
            int ID = rs.getInt("ID");
            String MaDonDatHang = rs.getString("MaDonDatHang");
            Date NgayDat = rs.getTimestamp("NgayDat");
            Date NgayGiao = rs.getDate("NgayGiao");
            int TinhTrangGiao = rs.getInt("TinhTrangGiao");
            int DaThanhToan = rs.getInt("DaThanhToan");
            int PhiVanChuyen = rs.getInt("PhiVanChuyen");
            int DaXoa = rs.getInt("DaXoa");
            int DaHuy = rs.getInt("DaHuy");
            int TongTien = rs.getInt("TongTien");
            String DiaChiGiaoHang = rs.getString("DiaChiGiaoHang");
            DONDATHANG dh = new DONDATHANG();
            dh.setID(ID);
            dh.setMaDonDatHang(MaDonDatHang);
            dh.setTinhTrangGiao(TinhTrangGiao);
            dh.setNgayDat(NgayDat);
            dh.setNgayGiao(NgayGiao);
            dh.setDaHuy(DaHuy);
            dh.setDaThanhToan(DaThanhToan);
            dh.setPhiVanChuyen(PhiVanChuyen);
            dh.setDaXoa(DaXoa);
            dh.setTongTien(TongTien);
            dh.setDiaChiGiaoHang(DiaChiGiaoHang);
            list.add(dh);
        }
        io.close();
        return list;
    }
}
