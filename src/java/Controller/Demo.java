/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.DONDATHANG_DAO;
import DAO.NHANVIEN_DAO;
import DTO.DONDATHANG;
import DTO.NHANVIEN;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;

/**
 *
 * @author tranl
 */
public class Demo {

    public static void main(String[] args) throws SQLException, ParseException {
        String TaiKhoan = "admin";
        NHANVIEN_DAO nv_dp = new NHANVIEN_DAO();
       ArrayList<NHANVIEN> list = nv_dp.getAllNhanVien();
        NHANVIEN temp = null;
        for(NHANVIEN nv : list){
            if(nv.getTaiKhoan().equals(TaiKhoan)){
                temp = nv;
                break;
            }
        }
        System.out.println(temp.getTaiKhoan());
    }
}
