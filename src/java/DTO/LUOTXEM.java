/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

import java.util.Date;

/**
 *
 * @author tranl
 */
public class LUOTXEM {

    private int ID;
    private Date date;
    private int SoLuong;

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getSoLuong() {
        return SoLuong;
    }

    public void setSoLuong(int SoLuong) {
        this.SoLuong = SoLuong;
    }

    public LUOTXEM() {
    }

    public LUOTXEM(int ID, Date date, int SoLuong) {
        this.ID = ID;
        this.date = date;
        this.SoLuong = SoLuong;
    }
}
