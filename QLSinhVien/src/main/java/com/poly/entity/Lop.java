/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.poly.entity;

/**
 *
 * @author admin
 */
public class Lop {
    String maKhoa;
    String maLop;
    String tenLop;

    public Lop() {
    }

    public Lop(String maKhoa, String maLop, String tenLop) {
        this.maKhoa = maKhoa;
        this.maLop = maLop;
        this.tenLop = tenLop;
    }

    public String getMaKhoa() {
        return maKhoa;
    }

    public void setMaKhoa(String maKhoa) {
        this.maKhoa = maKhoa;
    }

    public String getMaLop() {
        return maLop;
    }

    public void setMaLop(String maLop) {
        this.maLop = maLop;
    }

    public String getTenLop() {
        return tenLop;
    }

    public void setTenLop(String tenLop) {
        this.tenLop = tenLop;
    }
    
    @Override
    public String toString() {
        return this.maLop ;
    }
}
