/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.poly.dao;

import com.poly.entity.Khoa;
import com.poly.utils.JdbcHelper;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class KhoaDAO extends QLSVDAO<Khoa, String> {
    String INSERT_SQL = "INSERT INTO Khoa(MaKhoa, TenKhoa, NamThanhLap) VALUES(?,?,?)";
    String UPDATE_SQL = "UPDATE Khoa SET TenKhoa=?, NamThanhLap=? WHERE MaKhoa=?";
    String DELETE_SQL = "DELETE FROM Khoa WHERE MaKhoa=?";
    String SELECT_ALL_SQL = "SELECT * FROM Khoa";
    String SELECT_BY_ID_SQL = "SELECT * FROM Khoa WHERE MaKhoa=?";

    @Override
    public void insert(Khoa entity) {
        JdbcHelper.update(INSERT_SQL,
                entity.getMaKhoa(),
                entity.getTenKhoa(),
                entity.getNamThanhLap());
    }

    @Override
    public void update(Khoa entity) {
        JdbcHelper.update(UPDATE_SQL,
                entity.getTenKhoa(),
                entity.getNamThanhLap(),
                entity.getMaKhoa());
    }

    @Override
    public void delete(String key) {
        JdbcHelper.update(DELETE_SQL, key);
    }

    @Override
    public List<Khoa> selectAll() {
        return this.selectBySql(SELECT_ALL_SQL);
    }

    @Override
    public Khoa selectById(String key) {
        List<Khoa> list = this.selectBySql(SELECT_BY_ID_SQL, key);
        if (list.isEmpty()) {
            return null;
        }
        return list.get(0);
    }

    @Override
    protected List<Khoa> selectBySql(String sql, Object... args) {
        List<Khoa> list = new ArrayList<Khoa>();
        try {
            ResultSet rs = JdbcHelper.query(sql, args);
            while (rs.next()) {
                Khoa entity = new Khoa();
                entity.setMaKhoa(rs.getString("MaKhoa"));
                entity.setTenKhoa(rs.getString("TenKhoa"));
                entity.setNamThanhLap(rs.getInt("NamThanhLap"));
                list.add(entity);
            }
            rs.getStatement().getConnection().close();
            return list;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    
    public List<Khoa> selectByKeyword(String keyword) {
        String sql = "SELECT * FROM Khoa WHERE MaKhoa LIKE ? or TenKhoa LIKE ?";
        return selectBySql(sql, "%" + keyword + "%", "%" + keyword + "%");
    }
}
