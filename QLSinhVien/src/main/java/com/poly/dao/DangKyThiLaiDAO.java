/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.poly.dao;

import com.poly.entity.DangKyThiLai;
import com.poly.utils.JdbcHelper;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class DangKyThiLaiDAO extends QLSVDAO<DangKyThiLai, String> {
    String INSERT_SQL = "INSERT INTO DangKyThiLai(MaSV,MaKhoa,MaLop,MaMH,HoTen,TrangThai) VALUES(?,?,?,?,?,?)";
    String UPDATE_SQL = "UPDATE DangKyThiLai SET MaKhoa=?, MaLop=?,MaMH=?,HoTen=?, TrangThai=? WHERE MaSV=?";
    String DELETE_SQL = "DELETE FROM DangKyThiLai WHERE MaSV=?";
    String SELECT_ALL_SQL = "SELECT * FROM DangKyThiLai";
    String SELECT_BY_ID_SQL = "SELECT * FROM DangKyThiLai WHERE MaSV=?";

    @Override
    public void insert(DangKyThiLai entity) {
        JdbcHelper.update(INSERT_SQL,
                entity.getMaSV(),
                entity.getMaKhoa(),
                entity.getMaLop(),
                entity.getMaMH(),               
                entity.getHoTen(),
                entity.getTrangThai()
        );
    }

    @Override
    public void update(DangKyThiLai entity) {
        JdbcHelper.update(UPDATE_SQL,
                entity.getMaKhoa(),
                entity.getMaLop(),
                entity.getMaMH(),               
                entity.getHoTen(),
                entity.getTrangThai(),
                entity.getMaSV()
        );
    }


    @Override
    public List<DangKyThiLai> selectAll() {
        return this.selectBySql(SELECT_ALL_SQL);
    }

    @Override
    protected List<DangKyThiLai> selectBySql(String sql, Object... args) {
        List<DangKyThiLai> list = new ArrayList<DangKyThiLai>();
        try {
            ResultSet rs = JdbcHelper.query(sql, args);
            while (rs.next()) {
                DangKyThiLai entity = new DangKyThiLai();
                entity.setMaSV(rs.getString("MaSV"));
                entity.setMaKhoa(rs.getString("MaKhoa"));
                entity.setMaLop(rs.getString("MaLop"));
                entity.setMaMH(rs.getString("MaMH"));
                entity.setHoTen(rs.getString("HoTen"));
                entity.setTrangThai(rs.getString("TrangThai"));
                list.add(entity);
            }
            rs.getStatement().getConnection().close();
            return list;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }


    @Override
    public void delete(String key) {
        JdbcHelper.update(DELETE_SQL, key);
    }

    @Override
    public DangKyThiLai selectById(String key) {
        List<DangKyThiLai> list = this.selectBySql(SELECT_BY_ID_SQL, key);
        if (list.isEmpty()) {
            return null;
        }
        return list.get(0);
    }
    
    public List<DangKyThiLai> selectByKeyword(String keyword) {
        String sql = "SELECT * FROM DangKyThiLai WHERE MaSV LIKE ? or MaLop LIKE ? or MaKhoa LIKE ? or HoTen LIKE ?";
        return this.selectBySql(sql, "%" + keyword + "%" , "%" + keyword + "%" , "%" + keyword + "%" , "%" + keyword + "%");
    }
}
