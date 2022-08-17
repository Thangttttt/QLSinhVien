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
public class GiangVien {
//    String maGV;
//    String tenGV;
//    boolean gioiTinh;
//    String sdt;
//    String email;
//    String hinh;
//
//    public GiangVien() {
//    }
//
//    public GiangVien(String maGV, String tenGV, boolean gioiTinh, String sdt, String email, String hinh) {
//        this.maGV = maGV;
//        this.tenGV = tenGV;
//        this.gioiTinh = gioiTinh;
//        this.sdt = sdt;
//        this.email = email;
//        this.hinh = hinh;
//    }
//
//    public String getMaGV() {
//        return maGV;
//    }
//
//    public void setMaGV(String maGV) {
//        this.maGV = maGV;
//    }
//
//    public String getTenGV() {
//        return tenGV;
//    }
//
//    public void setTenGV(String tenGV) {
//        this.tenGV = tenGV;
//    }
//
//    public boolean isGioiTinh() {
//        return gioiTinh;
//    }
//
//    public void setGioiTinh(boolean gioiTinh) {
//        this.gioiTinh = gioiTinh;
//    }
//
//    public String getSdt() {
//        return sdt;
//    }
//
//    public void setSdt(String sdt) {
//        this.sdt = sdt;
//    }
//
//    public String getEmail() {
//        return email;
//    }
//
//    public void setEmail(String email) {
//        this.email = email;
//    }
//
//    public String getHinh() {
//        return hinh;
//    }
//
//    public void setHinh(String hinh) {
//        this.hinh = hinh;
//    }
    
    String maGV;
    String tenGV;
    boolean gioiTinh;
    String sDT="";
    String email;
    String hinh;

    public String getMaGV() {
        return maGV;
    }

    public void setMaGV(String maGV) {
        this.maGV = maGV;
    }

    public String getTenGV() {
        return tenGV;
    }

    public void setTenGV(String tenGV) {
        this.tenGV = tenGV;
    }

    public boolean isGioiTinh() {
        return gioiTinh;
    }

    public void setGioiTinh(boolean gioiTinh) {
        this.gioiTinh = gioiTinh;
    }

    public String getsDT() {
        return sDT;
    }

    public void setsDT(String sDT) {
        this.sDT = sDT;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getHinh() {
        return hinh;
    }

    public void setHinh(String hinh) {
        this.hinh = hinh;
    }
    @Override
    public String toString(){
        return this.tenGV;
    }
    
    @Override
    public boolean equals(Object obj){
        GiangVien other = (GiangVien) obj;
        return other.getMaGV().equals(this.getMaGV());
    }
    

}
