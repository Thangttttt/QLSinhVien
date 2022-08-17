/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.poly.dao;

import com.poly.entity.Lop;
import com.poly.utils.JdbcHelper;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class LopDAO extends QLSVDAO<Lop, String> {
    String INSERT_SQL = "INSERT INTO Lop(MaKhoa, MaLop, TenLop) VALUES(?,?,?)";
    String UPDATE_SQL = "UPDATE Lop SET MaKhoa=?, TenLop=? WHERE MaLop=?";
    String DELETE_SQL = "DELETE FROM Lop WHERE MaLop=?";
    String SELECT_ALL_SQL = "SELECT * FROM Lop";
    String SELECT_BY_ID_SQL = "SELECT * FROM Lop WHERE MaLop=?";

    @Override
    public void insert(Lop entity) {
        JdbcHelper.update(INSERT_SQL,
                entity.getMaKhoa(),
                entity.getMaLop(),
                entity.getTenLop());
    }

    @Override
    public void update(Lop entity) {
        JdbcHelper.update(UPDATE_SQL,
                entity.getMaKhoa(),
                entity.getTenLop(),
                entity.getMaLop());
    }

    @Override
    public void delete(String key) {
        JdbcHelper.update(DELETE_SQL, key);
    }

    @Override
    public List<Lop> selectAll() {
        return this.selectBySql(SELECT_ALL_SQL);
    }

    @Override
    public Lop selectById(String key) {
        List<Lop> list = this.selectBySql(SELECT_BY_ID_SQL, key);
        if (list.isEmpty()) {
            return null;
        }
        return list.get(0);
    }

    @Override
    protected List<Lop> selectBySql(String sql, Object... args) {
        List<Lop> list = new ArrayList<Lop>();
        try {
            ResultSet rs = JdbcHelper.query(sql, args);
            while (rs.next()) {
                Lop entity = new Lop();
                entity.setMaKhoa(rs.getString("MaKhoa"));
                entity.setMaLop(rs.getString("MaLop"));
                entity.setTenLop(rs.getString("TenLop"));
                list.add(entity);
            }
            rs.getStatement().getConnection().close();
            return list;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    
    public List<Lop> selectByKhoaL(String makhoa){
        String sql = "SELECT * FROM Lop WHERE MaKhoa=?";
        return this.selectBySql(sql, makhoa);
    }
    
    public List<Lop> selectByKhoaHoc( String maLop){
        String sql = "select * from Lop where MaKhoa=?";
        return selectBySql(sql, maLop);
    }
    
    public List<Lop> selectByKeyword(String keyword) {
        String sql = "SELECT * FROM Lop WHERE MaKhoa LIKE ? or MaLop LIKE ? or TenLop LIKE ?";
        return this.selectBySql(sql, "%" + keyword + "%", "%" + keyword + "%", "%" + keyword + "%");
    }
}
