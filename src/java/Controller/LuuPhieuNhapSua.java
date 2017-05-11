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
import DTO.SANPHAM;
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
public class LuuPhieuNhapSua extends HttpServlet {

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
        // check before submit
        String MaPhieuNhap = request.getParameter("MaPhieuNhap");
        SANPHAM_DAO sp_dp = new SANPHAM_DAO();
        PHIEUNHAP_DAO ph_dp = new PHIEUNHAP_DAO();
        CHITIETPHIEUNHAP_DAO ct_dp = new CHITIETPHIEUNHAP_DAO();
        ArrayList<CHITIETPHIEUNHAP> list_ct = ct_dp.getList(MaPhieuNhap);
        ArrayList<SANPHAM> list_sp = sp_dp.getListSP_temp(MaPhieuNhap);
        String MaNhaSanXuat = request.getParameter("sp_nhacungcap");
        int SoLuongNhapSauKhiSua = 0;
        boolean check = true;
        for (CHITIETPHIEUNHAP ct : list_ct) {
            for (SANPHAM sp : list_sp) {
                if (ct.getMaSanPham().equals(sp.getMaSanPham())) {
                    int SoLuongNhap = ct_dp.TongSanPham(sp.getMaSanPham());
                    int SoLuongHienTai = sp_dp.SoLuongSanPham(sp.getMaSanPham());
                    int SoLuongBan = SoLuongNhap - SoLuongHienTai;
                    SoLuongNhapSauKhiSua = SoLuongNhap - ct.getSoLuong() + sp.getSoLuong();
                    if (SoLuongNhapSauKhiSua < SoLuongBan) {
                        check = false;
                        break;
                    }
                }
            }
        }
        if (check == false) {
            request.setAttribute("result", "false");
        } else {
            // check okay
            for (CHITIETPHIEUNHAP ct : list_ct) {
                for (SANPHAM sp : list_sp) {
                    if (ct.getMaSanPham().equals(sp.getMaSanPham())) {
                        SANPHAM sp_c = sp_dp.getSanPham(sp.getMaSanPham());
                        int SoLuongFinal = sp_c.getSoLuong() - ct.getSoLuong() + sp.getSoLuong();
                        ct_dp.updateChiTietPhieuNhap(MaPhieuNhap, sp.getMaSanPham(), sp.getSoLuong());
                        ct_dp.updateGiaTienPhieuNhap(MaPhieuNhap, sp.getMaSanPham(), sp.getGiaGoc());
                        ph_dp.updateMaNhaSanXuat(MaPhieuNhap, MaNhaSanXuat);
                        sp_dp.ChuyenMauToChinh(ct.getMaSanPham(), ct.getTb_phieunhap_MaPhieuNhap());
                        sp_dp.setSoLuong(ct.getMaSanPham(), SoLuongFinal);
                    }
                }

            }

            request.setAttribute("result", "true");
        }
        // check okay
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
            Logger.getLogger(LuuPhieuNhapSua.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(LuuPhieuNhapSua.class.getName()).log(Level.SEVERE, null, ex);
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
