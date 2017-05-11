/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.NHACUNGCAP_DAO;
import DTO.NHACUNGCAP;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
public class SuaChiTietNhaCungCap extends HttpServlet {

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
        String MaNhaCungCap = request.getParameter("MaNhaCungCap");
        String sp_name_temp = request.getParameter("sp_name");
        String sp_name = new String(sp_name_temp.getBytes("ISO-8859-1"), "UTF-8");
        String sp_address_temp = request.getParameter("sp_address");
        String sp_address = new String(sp_address_temp.getBytes("ISO-8859-1"), "UTF-8");
        String sp_phone = request.getParameter("sp_phone");
        String sp_email = request.getParameter("sp_email");
        String sp_fax = request.getParameter("sp_fax");
        NHACUNGCAP_DAO ncc_dp = new NHACUNGCAP_DAO();
        boolean check = ncc_dp.checkTenNCC(sp_name);
        if (check == true) {
            request.setAttribute("check", "true");
            RequestDispatcher rd = request.getRequestDispatcher("ThemNhaCungCap?yc=Them");
            rd.forward(request, response);
        } else {
            NHACUNGCAP ncc = new NHACUNGCAP();
            ncc.setMaNhaCungCap(MaNhaCungCap);
            ncc.setTenNhaCungCap(sp_name);
            ncc.setDiaChi(sp_address);
            ncc.setSoDienThoai(sp_phone);
            ncc.setEmail(sp_email);
            ncc.setFax(sp_fax);
            ncc_dp.updateNhaCungCap(ncc);
            RequestDispatcher rd = request.getRequestDispatcher("DanhSachNhaCungCap");
            rd.forward(request, response);
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
            Logger.getLogger(SuaChiTietNhaCungCap.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(SuaChiTietNhaCungCap.class.getName()).log(Level.SEVERE, null, ex);
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
