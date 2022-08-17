/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.poly.dao;

import com.poly.entity.TaiKhoan;
import com.poly.utils.JdbcHelper;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class TaiKhoanDAO extends QLSVDAO<TaiKhoan, String> {

    String INSERT_SQL = "INSERT INTO TaiKhoan(TenDangNhap, MatKhau, VaiTro, Email) VALUES(?,?,?,?)";
    String UPDATE_SQL = "UPDATE TaiKhoan SET MatKhau=?, VaiTro=?, Email=? WHERE TenDangNhap=?";
    String DELETE_SQL = "DELETE FROM TaiKhoan WHERE TenDangNhap=?";
    String SELECT_ALL_SQL = "SELECT * FROM TaiKhoan";
    String SELECT_BY_ID_SQL = "SELECT * FROM TaiKhoan WHERE TenDangNhap=?";

    @Override
    public void insert(TaiKhoan entity) {
        JdbcHelper.update(INSERT_SQL,
                entity.getTenDangNhap(),
                entity.getMatKhau(),
                entity.getVaiTro(),
                entity.getEmail());
    }

    @Override
    public void update(TaiKhoan entity) {
        JdbcHelper.update(UPDATE_SQL,
                entity.getMatKhau(),
                entity.getVaiTro(),
                entity.getEmail(),
                entity.getTenDangNhap());
    }

    @Override
    public void delete(String key) {
        JdbcHelper.update(DELETE_SQL, key);
    }

    @Override
    public List<TaiKhoan> selectAll() {
        return this.selectBySql(SELECT_ALL_SQL);
    }

    @Override
    public TaiKhoan selectById(String key) {
        List<TaiKhoan> list = this.selectBySql(SELECT_BY_ID_SQL, key);
        if (list.isEmpty()) {
            return null;
        }
        return list.get(0);
    }

    @Override
    protected List<TaiKhoan> selectBySql(String sql, Object... args) {
        List<TaiKhoan> list = new ArrayList<TaiKhoan>();
        try {
            ResultSet rs = JdbcHelper.query(sql, args);
            while (rs.next()) {
                TaiKhoan entity = new TaiKhoan();
                entity.setTenDangNhap(rs.getString("TenDangNhap"));
                entity.setMatKhau(rs.getString("MatKhau"));
                entity.setVaiTro(rs.getString("VaiTro"));
                entity.setEmail(rs.getString("Email"));
                list.add(entity);
            }
            rs.getStatement().getConnection().close();
            return list;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    
    public List<TaiKhoan> selectByKeyword(String keyword) {
        String sql = "SELECT * FROM TaiKhoan WHERE TenDangNhap LIKE ?";
        return this.selectBySql(sql, "%" + keyword + "%");
    }
    
    public String selectByIdT(String id) {
        List<TaiKhoan> list = this.selectBySql(SELECT_BY_ID_SQL, id);
        if(list.isEmpty()){
            return null;
        }
        String tendn=(String)list.get(0).getTenDangNhap();
        return tendn;
    }
    public String selectByIdMK(String id) {
        List<TaiKhoan> list = this.selectBySql(SELECT_BY_ID_SQL, id);
        if(list.isEmpty()){
            return null;
        }
        String mk=(String)list.get(0).getMatKhau();
        return mk;
    }
    
}
