/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.DONDATHANG_DAO;
import DTO.DONDATHANG;
import java.io.IOException;
import java.sql.SQLException;
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
public class ThietLapGiaoHang extends HttpServlet {

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
        String MaDonDatHang = request.getParameter("MaDonDatHang");
        String TinhTrang = request.getParameter("TinhTrang");
        int TinhTrang_i = Integer.parseInt(TinhTrang);
        DONDATHANG_DAO ddh_dp = new DONDATHANG_DAO();
        if (TinhTrang_i <= 4) {
            ddh_dp.updateTinhTrang(MaDonDatHang, TinhTrang_i + 1);
        }
        if (TinhTrang_i == 3) {
            ddh_dp.updateThanhToan(MaDonDatHang);
        }
        if (TinhTrang_i == 6) {
            ddh_dp.updateTinhTrang(MaDonDatHang, 5);
            DONDATHANG dh = ddh_dp.getDonDatHang(MaDonDatHang);
            if (dh.getDaThanhToan() == 1) {
                String url = "http://localhost:9090/RestFulStudentMarkSer/webresources/generic";
                Client client = ClientBuilder.newClient();
                WebTarget webTarget = client.target(url).path("returnMoney").queryParam("MaThanhToan", MaDonDatHang);
                // WebTarget webTarget = client.target(url).path("checkRest");
                Invocation.Builder invocationBuilder = webTarget.request(MediaType.TEXT_PLAIN);
                Response respon = invocationBuilder.get();
                String result = respon.readEntity(String.class);
            }
        }
        String URL = "ChiTietDuyetDonDatHang?MaDonDatHang=" + MaDonDatHang;
        RequestDispatcher rd = request.getRequestDispatcher(URL);
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
            Logger.getLogger(ThietLapGiaoHang.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ThietLapGiaoHang.class.getName()).log(Level.SEVERE, null, ex);
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
