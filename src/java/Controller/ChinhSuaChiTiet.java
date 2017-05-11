/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.PHIEUNHAP_DAO;
import DAO.SANPHAM_DAO;
import DTO.SANPHAM;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author tranl
 */
public class ChinhSuaChiTiet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        String MaSanPham = request.getParameter("MaSanPham");
        String MaPhieuNhap = request.getParameter("MaPhieuNhap");
        String name_utf8 = request.getParameter("sp_name");
        String sp_Name = new String(name_utf8.getBytes("ISO-8859-1"), "UTF-8");

        String sp_Loai[] = request.getParameterValues("sp_loai");
        String sp_NhaSanXuat = request.getParameter("sp_nhasanxuat");

        String mota_utf8 = request.getParameter("sp_mota");

        String sp_MoTa = new String(mota_utf8.getBytes("ISO-8859-1"), "UTF-8");
        String sp_GiaTien = request.getParameter("sp_giatiengoc");
        String sp_GiaBan = request.getParameter("sp_giatien");
        String sp_GiamGia = request.getParameter("sp_giamgia");
        String sp_AnhChinh = request.getParameter("link-image");
        String sp_ListAnh = request.getParameter("link-image-full");
        String sp_SoLuong = request.getParameter("sp_soluong");
        int soLuong = Integer.parseInt(sp_SoLuong);
        String[] ListAnh = sp_ListAnh.split(",");
        SANPHAM_DAO sp_dao = new SANPHAM_DAO();

        // xoa san pham
        // xoa danh sach loai
        // xoa kho anh
        sp_dao.XoaKhoAnhMau(MaSanPham, MaPhieuNhap);
        sp_dao.XoaLoaiSanPhamMau(MaSanPham, MaPhieuNhap);
        sp_dao.XoaSanPhamMau(MaSanPham, MaPhieuNhap);
        // insert lai
        SANPHAM sp = new SANPHAM();
        sp.setMaSanPham(MaSanPham);
        sp.setMaPhieuNhap(MaPhieuNhap);
        sp.setMoTa(sp_MoTa);
        sp.setTenSanPham(sp_Name);
        sp.setTb_nhasanxuat_MaNSX(sp_NhaSanXuat);
        sp.setGiaGoc(Integer.parseInt(sp_GiaBan));
        sp.setDonGia(Integer.parseInt(sp_GiaTien));
        sp.setGiamGia(Integer.parseInt(sp_GiamGia));
        sp.setSoLuong(soLuong);
        sp_dao.InsertSanPham(sp);
//        sp_dao.insert_SP_Mau(MaSanPham, sp_Name, Integer.parseInt(sp_GiaTien), Integer.parseInt(sp_GiamGia), sp_MoTa, sp_NhaSanXuat);
//        sp_dao.setGiaGocMau(MaSanPham, Integer.parseInt(sp_GiaBan));
//        sp_dao.setMaPhieuNhap(MaPhieuNhap, MaSanPham);
//        sp_dao.setSoLuong(MaSanPham, soLuong);
        sp_dao.insert_LoaiSanPham_Mau(sp_Loai, MaSanPham, MaPhieuNhap);
        sp_dao.insert_khoAnh_Mau(MaSanPham, MaPhieuNhap, sp_AnhChinh, ListAnh);

        PHIEUNHAP_DAO ph_dp = new PHIEUNHAP_DAO();
        String MaPhieuNhapHT = ph_dp.returnPhieuNhapMax();
        if (MaPhieuNhapHT.equals(MaPhieuNhap)) {
            RequestDispatcher rs = request.getRequestDispatcher("ThemPhieuNhap");
            rs.forward(request, response);
        } else {
            String URL = "XemChiTietSuaPhieuNhap?MaPhieuNhap=" + MaPhieuNhap;
            RequestDispatcher rs = request.getRequestDispatcher(URL);
            rs.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ChinhSuaChiTiet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(ChinhSuaChiTiet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ChinhSuaChiTiet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(ChinhSuaChiTiet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
