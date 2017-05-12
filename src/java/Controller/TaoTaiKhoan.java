/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.KHACHHANG_DAO;
import DAO.SendMail;
import DTO.KHACHHANG;
import java.io.IOException;
import java.security.SecureRandom;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author tranl
 */
public class TaoTaiKhoan extends HttpServlet {

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
        String SoDienThoai = request.getParameter("phone_number");
        String Ten = request.getParameter("firstname");
        String Ho = request.getParameter("lastname");
        String Email = request.getParameter("email_address");
        String MatKhau = request.getParameter("password");
        String MatKhau2 = request.getParameter("confirmation");
        KHACHHANG_DAO kh_dao = new KHACHHANG_DAO();
        int check = kh_dao.checkKhachHang(Email, SoDienThoai);

        if (check == 1) {
            //insert - jump to index.jsp
            KHACHHANG kh = new KHACHHANG();
            kh.setSoDienThoai(SoDienThoai);
            kh.setTenKhachHang(new String(Ten.getBytes("ISO-8859-1"), "UTF-8"));
            kh.setHoKhachHang(new String(Ho.getBytes("ISO-8859-1"), "UTF-8"));
            kh.setEmail(Email);
            kh.setMatKhau(MatKhau);

            kh_dao.InsertKH(kh);
            SecureRandom random = new SecureRandom();
            byte bytes[] = new byte[20];
            random.nextBytes(bytes);
            String token = bytes.toString();
            kh_dao.insertToken(Email, token);
            String msg = "http://localhost:9090/DemoThuongMaiDienTu/XacThuc?username=" + Email + "&token=" + token;
            SendMail.sendMail(Email, "Xác thực đăng ký tài khoản", msg);
        }
        request.setAttribute("status", "none");
        request.setAttribute("check", check);
        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
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
            Logger.getLogger(TaoTaiKhoan.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(TaoTaiKhoan.class.getName()).log(Level.SEVERE, null, ex);
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
