/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.SANPHAM_DAO;
import DTO.SANPHAM;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Random;
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
public class ThemMoiPhieuNhap extends HttpServlet {

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
        String yc = request.getParameter("yc");
        if (yc.equals("ThemMoi")) {
            String name_utf8 = request.getParameter("sp_name");
            String sp_Name = new String(name_utf8.getBytes("ISO-8859-1"), "UTF-8");

            String sp_Loai[] = request.getParameterValues("sp_loai");
            String sp_NhaSanXuat = request.getParameter("sp_nhasanxuat");
            //  String sp_DoTuoiYeuCau = request.getParameter("sp_dotuoiyeucau");

            String mota_utf8 = request.getParameter("sp_mota");

            String sp_MoTa = new String(mota_utf8.getBytes("ISO-8859-1"), "UTF-8");
            String sp_GiaGoc = request.getParameter("sp_giatiengoc");
            String sp_GiaTien = request.getParameter("sp_giatien");
            String sp_GiamGia = request.getParameter("sp_giamgia");
            String sp_SoLuong = request.getParameter("sp_soluong");
            String sp_AnhChinh = request.getParameter("link-image");
            String sp_ListAnh = request.getParameter("link-image-full");
            Random rand = new Random();
            int n = rand.nextInt(9999) + 1;
            String MaSP = sp_NhaSanXuat + n;

            String[] ListAnh = sp_ListAnh.split(",");
            SANPHAM_DAO sp_dao = new SANPHAM_DAO();

            sp_dao.insert_SP_Mau(MaSP, sp_Name, Integer.parseInt(sp_GiaTien), Integer.parseInt(sp_GiamGia), sp_MoTa, sp_NhaSanXuat);
            int soluong = Integer.parseInt(sp_SoLuong);
            sp_dao.setSoLuong(MaSP, soluong);
            sp_dao.insert_khoAnh_Mau(MaSP, sp_AnhChinh, ListAnh);
            sp_dao.insert_LoaiSanPham_Mau(sp_Loai, MaSP);
            sp_dao.setGiaGocMau(MaSP, Integer.parseInt(sp_GiaGoc));
//            
            ArrayList<SANPHAM> list = sp_dao.getListSP_temp();
            request.setAttribute("ListMau", list);
            RequestDispatcher rs = request.getRequestDispatcher("ThemPhieuNhap");
            rs.forward(request, response);
        } else if (yc.equals("CoSang")) {
            String MaSanPham = request.getParameter("MaSanPham");
            SANPHAM_DAO sp_dp = new SANPHAM_DAO();
            SANPHAM sp = sp_dp.getSanPham(MaSanPham);
            request.setAttribute("SanPham", sp);
            RequestDispatcher rs = request.getRequestDispatcher("web-admin/ThemCoSan.jsp");
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
            Logger.getLogger(ThemMoiPhieuNhap.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(ThemMoiPhieuNhap.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ThemMoiPhieuNhap.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(ThemMoiPhieuNhap.class.getName()).log(Level.SEVERE, null, ex);
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
