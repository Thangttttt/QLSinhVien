/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.poly.dao;

import com.poly.entity.MonHoc;
import com.poly.utils.JdbcHelper;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class MonHocDAO extends QLSVDAO<MonHoc, String> {

    String INSERT_SQL = "INSERT INTO MonHoc(MaMH, TenMH, MaGV, HocKi,MaKhoa) VALUES(?,?,?,?,?)";
    String UPDATE_SQL = "UPDATE MonHoc SET TenMH=?, MaGV=?, HocKi=?, MaKhoa=? WHERE MaMH=?";
    String DELETE_SQL = "DELETE FROM MonHoc WHERE MaMH=?";
    String SELECT_ALL_SQL = "SELECT * FROM MonHoc";
    String SELECT_BY_ID_SQL = "SELECT * FROM MonHoc WHERE MaMH=?";

    @Override
    public void insert(MonHoc entity) {
        JdbcHelper.update(INSERT_SQL,
                entity.getMaMH(),
                entity.getTenMH(),
                entity.getMaGV(),
                entity.getHocKi(),
                entity.getMaKhoa());
    }

    @Override
    public void update(MonHoc entity) {
        JdbcHelper.update(UPDATE_SQL,
                entity.getTenMH(),
                entity.getMaGV(),
                entity.getHocKi(),
                entity.getMaKhoa(),
                entity.getMaMH());
    }

    @Override
    public void delete(String key) {
        JdbcHelper.update(DELETE_SQL, key);
    }

    @Override
    public List<MonHoc> selectAll() {
        return this.selectBySql(SELECT_ALL_SQL);
    }

    @Override
    public MonHoc selectById(String key) {
        List<MonHoc> list = this.selectBySql(SELECT_BY_ID_SQL, key);
        if (list.isEmpty()) {
            return null;
        }
        return list.get(0);
    }

    @Override
    protected List<MonHoc> selectBySql(String sql, Object... args) {
        List<MonHoc> list = new ArrayList<MonHoc>();
        try {
            ResultSet rs = JdbcHelper.query(sql, args);
            while (rs.next()) {
                MonHoc entity = new MonHoc();
                entity.setMaMH(rs.getString("MaMH"));
                entity.setTenMH(rs.getString("TenMH"));
                entity.setMaGV(rs.getString("MaGV"));
                entity.setHocKi(rs.getInt("HocKi"));
                entity.setMaKhoa(rs.getString("MaKhoa"));
                list.add(entity);
            }
            rs.getStatement().getConnection().close();
            return list;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    
    public List<MonHoc> selectByKhoaM(String makhoa){
        String sql = "SELECT * FROM MonHoc WHERE MaKhoa=?";
        return this.selectBySql(sql, makhoa);
    }
    
    public List<MonHoc> selectByKeyword(String keyword) {
        String sql = "SELECT * FROM MonHoc WHERE MaMH LIKE ? or TenMH LIKE ? or MaGV LIKE ? or MaKhoa LIKE ?";
        return this.selectBySql(sql, "%" + keyword + "%" , "%" + keyword + "%" , "%" + keyword + "%" , "%" + keyword + "%");
    }
}
