/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.SANPHAM_DAO;
import DTO.SANPHAM;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;

/**
 *
 * @author tranl
 */
public class Demo {

    public static void main(String[] args) throws SQLException, ParseException {
        SANPHAM_DAO sp_dp = new SANPHAM_DAO();
        ArrayList<SANPHAM> list = sp_dp.TimKiem("");
        for(SANPHAM sp : list){
             System.out.println(sp.getGiaGoc());
        }
    }
}
