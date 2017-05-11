/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author tranl
 */
public class LUOTXEM_DAO {

    public boolean checkInsertDate(String Date) throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        String sql = "SELECT COUNT(ID) FROM tb_luotxem WHERE DATE = '" + Date + "'";
        ResultSet rs = io.getResultSet(sql);
        boolean check = false;
        if (rs.next()) {
            int count = rs.getInt(1);
            if (count != 0) {
                check = true;
            }
        }
        io.close();
        return check;
    }

    public int getLuotXem(String Date) throws SQLException {
        IODatabase io = new IODatabase();
        int soLuong = 0;
        io.conn();
        String sql = "SELECT SoLuong FROM tb_luotxem WHERE DATE = '" + Date + "'";
        ResultSet rs = io.getResultSet(sql);
        if (rs.next()) {
            soLuong = rs.getInt(1);
        }
        io.close();
        return soLuong;
    }

    public void insertCount() throws SQLException {
        IODatabase io = new IODatabase();
        io.conn();
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
        LocalDate localDate = LocalDate.now();
        String date = dtf.format(localDate);
        boolean check = checkInsertDate(date);
        if (check == false) {
            String sql = "INSERT INTO tb_luotxem(DATE, SoLuong) VALUES (NOW(), 1)";
            io.getStatement().executeUpdate(sql);
        } else {
            int soLuong = getLuotXem(date);
            String sql = "UPDATE tb_luotxem SET SoLuong = " + (soLuong + 1) + " WHERE DATE = '" + date + "'";
            io.getStatement().executeUpdate(sql);
        }
        io.close();
    }

    public static void main(String[] args) throws SQLException {
        LUOTXEM_DAO dp = new LUOTXEM_DAO();
        dp.insertCount();
    }
}
