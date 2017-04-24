/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.KHACHHANG_DAO;
import DTO.KHACHHANG;
import java.sql.SQLException;
import java.text.ParseException;

/**
 *
 * @author tranl
 */
public class Demo {

    public static void main(String[] args) throws SQLException, ParseException {
        KHACHHANG_DAO kh_dp = new KHACHHANG_DAO();
        int check = kh_dp.checkKhachHang("tranleanhthe@.com", "0917068945");
        System.out.println(check);
    }
}
