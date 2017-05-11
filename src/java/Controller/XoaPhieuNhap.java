/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.CHITIETPHIEUNHAP_DAO;
import DAO.PHIEUNHAP_DAO;
import DAO.SANPHAM_DAO;
import DTO.CHITIETPHIEUNHAP;
import DTO.PHIEUNHAP;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
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
public class XoaPhieuNhap extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String MaPhieuNhap = request.getParameter("MaPhieuNhap");
        PHIEUNHAP_DAO ph_dp = new PHIEUNHAP_DAO();
        // Must be check before delete.
        SANPHAM_DAO sp_dp = new SANPHAM_DAO();
        CHITIETPHIEUNHAP_DAO ct_dp = new CHITIETPHIEUNHAP_DAO();
        ArrayList<CHITIETPHIEUNHAP> list_ct = ct_dp.getList(MaPhieuNhap);
        boolean check = false;
        for (CHITIETPHIEUNHAP ct : list_ct) {
            int soLuongHienTai = sp_dp.SoLuongSanPham(ct.getMaSanPham());
            int soLuongNhap = ct.getSoLuong();
            if (soLuongHienTai - soLuongNhap < 0) {
                check = true;
                break;
            }
        }
        if (check == true) {
            // can't delete
            request.setAttribute("XoaPhieuNhap", "false");
        } else {
            for (CHITIETPHIEUNHAP ct : list_ct) {
                int soLuongHienTai = sp_dp.SoLuongSanPham(ct.getMaSanPham());
                int soLuongNhap = ct.getSoLuong();
                sp_dp.setSoLuong(ct.getMaSanPham(), soLuongHienTai - soLuongNhap);
            }
            ph_dp.xoaPhieuNhap(MaPhieuNhap);
            request.setAttribute("XoaPhieuNhap", "true");
        }
        ArrayList<PHIEUNHAP> list = ph_dp.getList();
        request.setAttribute("ListPhieu", list);
        RequestDispatcher rd = request.getRequestDispatcher("web-admin/DanhSachPhieuNhap.jsp");
        rd.forward(request, response);
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
            Logger.getLogger(XoaPhieuNhap.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(XoaPhieuNhap.class.getName()).log(Level.SEVERE, null, ex);
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
