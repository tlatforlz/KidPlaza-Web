/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.CHITIETDATHANG_DAO;
import DAO.DONDATHANG_DAO;
import DAO.GIOHANG_DAO;
import DAO.KHACHHANG_DAO;
import DAO.SendMail;
import DTO.CHITIETDATHANG;
import DTO.DONDATHANG;
import DTO.KHACHHANG;
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
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Invocation;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

/**
 *
 * @author tranl
 */
public class NganHang extends HttpServlet {

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
        String maskCardNumber = request.getParameter("maskCardNumber");
        String cardHolderName = request.getParameter("cardHolderName");
        String cardDate = request.getParameter("cardDate");
        String password = request.getParameter("password");

        DONDATHANG ddh = (DONDATHANG) request.getSession().getAttribute("DonDatHang");
        ArrayList<CHITIETDATHANG> list_ct = (ArrayList<CHITIETDATHANG>) request.getSession().getAttribute("DanhSachChiTiet");

        String url = "http://localhost:9090/RestFulStudentMarkSer/webresources/generic";
        Client client = ClientBuilder.newClient();
        WebTarget webTarget = client.target(url).path("checkUser").queryParam("SoThe", maskCardNumber).queryParam("MatKhau", password).queryParam("TenTaiKhoan", cardHolderName).queryParam("NgayTaoThe", cardDate).queryParam("SoTien", ddh.getTongTien()).queryParam("MaThanhToan", ddh.getMaDonDatHang());
        // WebTarget webTarget = client.target(url).path("checkRest");
        Invocation.Builder invocationBuilder = webTarget.request(MediaType.TEXT_PLAIN);
        Response respon = invocationBuilder.get();
        String result = respon.readEntity(String.class);

        request.setAttribute("ketqua", result);
        if (result.equals("true")) {
            // true.
            // xoa gio hang.
            // them don hang trong csdl.

            DONDATHANG_DAO ddh_dp = new DONDATHANG_DAO();
            // kt da ton tai don hang hay chua.
            boolean check = ddh_dp.checkDonHang(ddh.getMaDonDatHang());
            if (check == true) {
                ddh_dp.updateThanhToan(ddh.getMaDonDatHang());
                ddh.setDaThanhToan(1);
            } else {
                //
                ddh.setDaThanhToan(1);
                ddh_dp.InsertDDH(ddh);
                CHITIETDATHANG_DAO ct_dp = new CHITIETDATHANG_DAO();
                for (CHITIETDATHANG ct : list_ct) {
                    ct_dp.InsertChiTietDDH(ct);
                }

                GIOHANG_DAO gh_dp = new GIOHANG_DAO();
                KHACHHANG_DAO kh_dp = new KHACHHANG_DAO();
                KHACHHANG kh = kh_dp.getKhachHang((String) request.getSession().getAttribute("Email"));
                for (CHITIETDATHANG ct : list_ct) {
                    gh_dp.XoaDonHang(kh.getMaKhachHang(), ct.getTb_sanpham_MaSanPham());
                }
                String URL = "XemChiTietDonHang?MaDonHang=" + ddh.getMaDonDatHang();
                String URL2 = "http://localhost:9090/DemoThuongMaiDienTu/" + URL;
                String MSG = "Cam on ban đa dat hang. \n De xem chi tiet don hang. Nhan vao day : " + URL2;
               
                SendMail.sendMail(kh.getEmail(), "Thong bao dat hang thanh cong", MSG);
            }
            request.setAttribute("DonDatHang", ddh);
            RequestDispatcher rd = request.getRequestDispatcher("ChiTietDonHang.jsp");
            rd.forward(request, response);
        } else {
            // false.
            // ve trang thanh toan

            request.setAttribute("ketqua", "fail");
            RequestDispatcher rd = request.getRequestDispatcher("TrangThanhToan.jsp");
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
            Logger.getLogger(NganHang.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(NganHang.class.getName()).log(Level.SEVERE, null, ex);
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
