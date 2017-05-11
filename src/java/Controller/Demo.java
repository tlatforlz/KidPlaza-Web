/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.DONDATHANG_DAO;
import DTO.DONDATHANG;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;

/**
 *
 * @author tranl
 */
public class Demo {

    public static void main(String[] args) throws SQLException, ParseException {
        DONDATHANG_DAO ddh_dp = new DONDATHANG_DAO();
        ArrayList<DONDATHANG> list = ddh_dp.getListThanhCong();
        for(DONDATHANG dh : list){
            System.out.println(dh.getMaDonDatHang());
            System.out.println(ddh_dp.LoiNhuan(dh.getMaDonDatHang()));
        }
        System.out.println(list.size());
    }
}
