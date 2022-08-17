/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.poly.dao;

import com.poly.entity.GiangVien;
import com.poly.utils.JdbcHelper;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class GiangVienDAO extends QLSVDAO<GiangVien, String> {

    String INSERT_SQL = "INSERT INTO GiangVien(MaGV,TenGV,GioiTinh,SDT,Email,Hinh)VALUES(?, ?, ?, ?, ?, ?)";
    String DELETE_SQL = "DELETE FROM GiangVien WHERE MaGV=?";
    String UPDATE_SQL = "UPDATE GiangVien SET TenGV=?,GioiTinh=?,SDT=?,Email=?,Hinh=? WHERE MaGV=?";
    String SELECT_ALL_SQL = "SELECT * FROM Giangvien";
    String SELECT_BY_ID_SQL = "SELECT * FROM Giangvien WHERE MaGV=?";

    @Override
    public void insert(GiangVien entity) {
        JdbcHelper.update(INSERT_SQL,
                entity.getMaGV(), entity.getTenGV(), entity.isGioiTinh(),
                entity.getsDT(), entity.getEmail(), entity.getHinh());
    }

    @Override
    public void update(GiangVien entity) {
        JdbcHelper.update(UPDATE_SQL,
                entity.getTenGV(), entity.isGioiTinh(), entity.getsDT(),
                entity.getEmail(), entity.getHinh(), entity.getMaGV());
    }

    @Override
    public void delete(String id) {
        JdbcHelper.update(DELETE_SQL, id);
    }

    @Override
    protected List<GiangVien> selectBySql(String sql, Object... args) {
        List<GiangVien> list = new ArrayList<GiangVien>();
        try {
            ResultSet rs = JdbcHelper.query(sql, args);
            while (rs.next()) {
                GiangVien entity = new GiangVien();
                entity.setMaGV(rs.getString("magv"));
                entity.setTenGV(rs.getString("tengv"));
                entity.setGioiTinh(rs.getBoolean("gioitinh"));
                entity.setsDT(rs.getString("sdt"));
                entity.setEmail(rs.getString("Email"));
                entity.setHinh(rs.getString("hinh"));
                list.add(entity);
            }
            return list;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public GiangVien selectById(String id) {
        List<GiangVien> list = this.selectBySql(SELECT_BY_ID_SQL, id);
        if (list.isEmpty()) {
            return null;
        }
        return list.get(0);
    }

    @Override
    public List<GiangVien> selectAll() {
        return this.selectBySql(SELECT_ALL_SQL);
    }
    
    public List<GiangVien> selectByKeyword(String keyword) {
        String sql = "SELECT * FROM GiangVien WHERE MaGV LIKE ? or TenGV LIKE ? or SDT LIKE ? or Email LIKE ?";
        return this.selectBySql(sql, "%" + keyword + "%" , "%" + keyword + "%" , "%" + keyword + "%" , "%" + keyword + "%");
    }
}
