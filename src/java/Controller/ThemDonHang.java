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
import DAO.SANPHAM_DAO;
import DTO.CHITIETDATHANG;
import DTO.DONDATHANG;
import DTO.GIOHANG;
import DTO.KHACHHANG;
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
public class ThemDonHang extends HttpServlet {

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

        String shipfirstname = request.getParameter("shipfirstname");
        String shiplastname = request.getParameter("shiplastname");
        String shipstreet = request.getParameter("shipstreet");
        String shipregion = request.getParameter("shipregion");
        String shipphone = request.getParameter("shipphone");
        String address = request.getParameter("address");
        String ordercomment = request.getParameter("ordercomment");
        String method = request.getParameter("method");
        String Email = (String) request.getSession().getAttribute("Email");
        KHACHHANG_DAO kh_dp = new KHACHHANG_DAO();
        KHACHHANG kh = kh_dp.getKhachHang(Email);
        GIOHANG_DAO gh_dp = new GIOHANG_DAO();
        ArrayList<GIOHANG> list_gh = gh_dp.getList(kh.getMaKhachHang());
        // check soluong : 
        SANPHAM_DAO sp_dp = new SANPHAM_DAO();
        boolean checkGioHang = true;
        for (GIOHANG gh : list_gh) {
            int soLuong = sp_dp.SoLuongSanPham(gh.getMaSanPham());
            if (soLuong - gh.getSoLuong() < 0) {
                checkGioHang = false;
                break;
            }
        }
        if (checkGioHang == false) {
            //
            request.setAttribute("DatHang", "false");
            RequestDispatcher rd = request.getRequestDispatcher("GioHang.jsp");
            rd.forward(request, response);
        } else {
            for (GIOHANG gh : list_gh) {
                int soLuong = sp_dp.SoLuongSanPham(gh.getMaSanPham());
                sp_dp.setSoLuong(gh.getMaSanPham(), soLuong - gh.getSoLuong());
            }
        }

        shipregion = new String(shipregion.getBytes("ISO-8859-1"), "UTF-8");
        String DiaChiGiaoHang = "";
        if (address.equals("none")) {
            // d.c hien tai
            DiaChiGiaoHang = kh.getHoKhachHang() + " - " + kh.getTenKhachHang() + " - " + kh.getDiaChi() + " - " + kh.getTinh() + " - " + kh.getQuocGia() + " - " + kh.getSoDienThoai();
            if(kh.getDiaChi() == null || kh.getTinh() == null || kh.getQuocGia() == null){
                request.setAttribute("address", "false");
                RequestDispatcher rd = request.getRequestDispatcher("ThongTinTaiKhoan?KhachHang=" + kh.getEmail());
                rd.forward(request, response);
            }
        } else {
            // d.c moi.
            DiaChiGiaoHang = shipfirstname + " - " + shiplastname + " - " + shipstreet + " - " + shipregion + " - " + shipphone;
        }
        // String sp_MoTa = new String(mota_utf8.getBytes("ISO-8859-1"), "UTF-8");

        int TongTien = 0;
        for (GIOHANG gh : list_gh) {
            SANPHAM sp = sp_dp.getSanPham(gh.getMaSanPham());
            TongTien = TongTien + (gh.getSoLuong() * sp.getDonGia());
        }

        DONDATHANG_DAO ddh_dp = new DONDATHANG_DAO();
        DONDATHANG ddh = new DONDATHANG();
        ddh.setMaDonDatHang(kh.getMaKhachHang() + "-" + (ddh_dp.countDDH() + 1));
        ddh.setTinhTrangGiao(0);
        ddh.setDaThanhToan(0);
        ddh.setPhiVanChuyen(0);
        ddh.setDaHuy(0);
        ddh.setDaXoa(0);
        ddh.setTongTien(TongTien);
        ddh.setTb_khachhang_MaKhachHang(kh.getMaKhachHang());
        ddh.setDiaChiGiaoHang(DiaChiGiaoHang);

        CHITIETDATHANG_DAO ct_dp = new CHITIETDATHANG_DAO();

        if (method.equals("p_method_cashondelivery")) {
            ddh_dp.InsertDDH(ddh);
            for (GIOHANG gh : list_gh) {
                CHITIETDATHANG ct = new CHITIETDATHANG();
                ct.setMaChiTiet(ddh.getMaDonDatHang() + "-" + gh.getMaSanPham());
                SANPHAM sp = sp_dp.getSanPham(gh.getMaSanPham());
                ct.setDonGia(sp.getDonGia());
                ct.setSoLuong(gh.getSoLuong());
                ct.setTb_dondathang_MaDonDatHang(ddh.getMaDonDatHang());
                ct.setTb_sanpham_MaSanPham(sp.getMaSanPham());
                ct_dp.InsertChiTietDDH(ct);
            }
            request.setAttribute("MaDonDatHang", ddh.getMaDonDatHang());
            request.setAttribute("DiaChiGiaoHang", DiaChiGiaoHang);

            // KHACHHANG_DAO kh_dp = new KHACHHANG_DAO();
            for (GIOHANG gh : list_gh) {
                gh_dp.XoaDonHang(kh.getMaKhachHang(), gh.getMaSanPham());
            }
            request.setAttribute("DonDatHang", ddh);
            // request.setAttribute("ThongBao", "success");
            RequestDispatcher rd = request.getRequestDispatcher("ChiTietDonHang.jsp");
            rd.forward(request, response);
        } else {

            ArrayList<CHITIETDATHANG> list_ct = new ArrayList<CHITIETDATHANG>();
            for (GIOHANG gh : list_gh) {
                CHITIETDATHANG ct = new CHITIETDATHANG();
                ct.setMaChiTiet(ddh.getMaDonDatHang() + "-" + gh.getMaSanPham());
                SANPHAM sp = sp_dp.getSanPham(gh.getMaSanPham());
                ct.setDonGia(sp.getDonGia());
                ct.setSoLuong(gh.getSoLuong());
                ct.setTb_dondathang_MaDonDatHang(ddh.getMaDonDatHang());
                ct.setTb_sanpham_MaSanPham(sp.getMaSanPham());
                list_ct.add(ct);
            }
            request.getSession().setAttribute("DonDatHang", ddh);
            request.getSession().setAttribute("DanhSachChiTiet", list_ct);
            RequestDispatcher rd = request.getRequestDispatcher("nganhang.jsp");
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
            Logger.getLogger(ThemDonHang.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ThemDonHang.class.getName()).log(Level.SEVERE, null, ex);
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
