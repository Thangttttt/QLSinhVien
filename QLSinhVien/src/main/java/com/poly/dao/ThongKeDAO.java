/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.poly.dao;

import com.poly.utils.JdbcHelper;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class ThongKeDAO {
    private List<Object[]> getListOfArray(String sql, String[] cols, Object...args){
        try {
            List<Object[]> list = new ArrayList<>();
            ResultSet rs = JdbcHelper.query(sql, args);
            while(rs.next()){
                Object[] vals = new Object[cols.length];
                for(int i=0;i<cols.length;i++){
                    vals[i] = rs.getObject(cols[i]);
                }
                list.add(vals);
            }
            rs.getStatement().getConnection().close();
            return list;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    
    public List<Object[]> getLopTheoKhoa(String maKhoa){
        String sql = "{CALL sp_LopTheoKhoa(?)}";
        String[] cols = {"TenKhoa","NamThanhLap","MaLop", "TenLop"};
        return this.getListOfArray(sql, cols, maKhoa);
    }
    
    public List<Object[]> getSinhVienTheoLop(String maLop){
        String sql = "{CALL sp_SinhVienTheoLop(?)}";
        String[] cols = {"TenLop","MaSV","HoTen", "NgaySinh", "GioiTinh"};
        return this.getListOfArray(sql, cols, maLop);
    }
    
    private List<String>getListK(String sql, String[]cols, Object...args ){
        try{
            List<String> list = new ArrayList<>();
            ResultSet rs = JdbcHelper.query(sql,args);
            while(rs.next()){
                String vals=(String) rs.getObject(cols[0]);
                list.add(vals);
            }
            return list;
        }catch(Exception e){
            throw new RuntimeException(e);
        }
    }
    public List<Object[]> getDiem(String makhoa){
        String sql="{call TKDSV_K(?)}";
        String[] cols={"diemtb"};
        return this.getListOfArray(sql,cols,makhoa);
    }
    public List<Object[]> getDiemL(String malop){
        String sql="select diemtb from ketqua where malop =?";
        String[] cols={"diemtb"};
        return this.getListOfArray(sql,cols,malop);
    }
     public List<String> getKhoahoc(){
        String sql="select makhoa from khoa";
        String[] cols={"makhoa"};
        return this.getListK(sql,cols);
    }
     public List<String> getLop(String makhoa){
        String sql="select DISTINCT malop from lop where makhoa=?";
        String[] cols={"malop"};
        return this.getListK(sql,cols,makhoa);
    }
     public List<Object[]> getBangDiem(){
        String sql="{CALL TKTOP}";
        String[] cols={"stt","msv","hoten","diemtb","makhoa"};
        return this.getListOfArray(sql,cols);
        
    }
    
}
