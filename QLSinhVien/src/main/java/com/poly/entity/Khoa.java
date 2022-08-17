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
public class Khoa {
    String maKhoa;
    String tenKhoa;
    int namThanhLap;

    public Khoa() {
    }

    public Khoa(String maKhoa, String tenKhoa, int namThanhLap) {
        this.maKhoa = maKhoa;
        this.tenKhoa = tenKhoa;
        this.namThanhLap = namThanhLap;
    }

    public String getMaKhoa() {
        return maKhoa;
    }

    public void setMaKhoa(String maKhoa) {
        this.maKhoa = maKhoa;
    }

    public String getTenKhoa() {
        return tenKhoa;
    }

    public void setTenKhoa(String tenKhoa) {
        this.tenKhoa = tenKhoa;
    }

    public int getNamThanhLap() {
        return namThanhLap;
    }

    public void setNamThanhLap(int namThanhLap) {
        this.namThanhLap = namThanhLap;
    }
    
    @Override
    public String toString(){
        return this.maKhoa;
    }
    
//    @Override
//    public boolean equals(Object obj){
//        Khoa other = (Khoa) obj;
//        return other.getMaKhoa().equals(this.getMaKhoa());
//    }
}
