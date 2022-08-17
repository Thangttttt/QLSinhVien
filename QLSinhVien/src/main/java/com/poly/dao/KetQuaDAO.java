/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.poly.dao;

import com.poly.entity.KetQua;
import com.poly.utils.JdbcHelper;
import java.util.List;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author admin
 */
public class KetQuaDAO extends QLSVDAO<KetQua, String> {
    String INSERT_SQL = "INSERT INTO KetQua(MaSV, HoTen, MaLop, MaMH, HocKi, DiemThi, DiemTB, GhiChu) VALUES(?,?,?,?,?,?,?,?)";
    String UPDATE_SQL = "UPDATE KetQua SET HoTen=?, MaLop=?, MaMH=?, HocKi=?, DiemThi=?, DiemTB=?,GhiChu=? WHERE MaSV=?";
    String DELETE_SQL = "DELETE FROM KetQua WHERE MaSV=?";
    String SELECT_ALL_SQL = "SELECT * FROM KetQua";
    String SELECT_BY_ID_SQL = "SELECT * FROM KetQua WHERE MaSV=?";

    @Override
    public void insert(KetQua entity) {
        JdbcHelper.update(INSERT_SQL,
                entity.getMaSV(),
                entity.getHoTen(),
                entity.getMaLop(),
                entity.getMaMH(),
                entity.getHocKi(),
                entity.getDiemThi(),
                entity.getDiemTB(),
//                entity.getXepLoai(),
                entity.getGhiChu());
    }

    @Override
    public void update(KetQua entity) {
        JdbcHelper.update(UPDATE_SQL,
                entity.getHoTen(),
                entity.getMaLop(),
                entity.getMaMH(),
                entity.getHocKi(),
                entity.getDiemThi(),
                entity.getDiemTB(),
//                entity.getXepLoai(),
                entity.getGhiChu(),
                entity.getMaSV());
    }

    @Override
    public void delete(String key) {
        JdbcHelper.update(DELETE_SQL, key);
    }

    @Override
    public List<KetQua> selectAll() {
        return this.selectBySql(SELECT_ALL_SQL);
    }

    @Override
    public KetQua selectById(String key) {
        List<KetQua> list = this.selectBySql(SELECT_BY_ID_SQL, key);
        if (list.isEmpty()) {
            return null;
        }
        return list.get(0);
    }

    @Override
    protected List<KetQua> selectBySql(String sql, Object... args) {
        List<KetQua> list = new ArrayList<KetQua>();
        try {
            ResultSet rs = JdbcHelper.query(sql, args);
            while (rs.next()) {
                KetQua entity = new KetQua();
                entity.setMaSV(rs.getString("MaSV"));
                entity.setHoTen(rs.getString("HoTen"));
                entity.setMaLop(rs.getString("MaLop"));
                entity.setMaMH(rs.getString("MaMH"));
                entity.setHocKi(rs.getInt("HocKi"));
                entity.setDiemThi(rs.getInt("DiemThi"));
                entity.setDiemTB(rs.getInt("DiemTB"));
//                entity.setXepLoai(rs.getString("XepLoai"));
                entity.setGhiChu(rs.getString("GhiChu"));
                list.add(entity);
            }
            rs.getStatement().getConnection().close();
            return list;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    
    public List<KetQua> selectByKeyword(String keyword) {
        String sql = "SELECT * FROM KetQua WHERE MaSV LIKE ? or HoTen LIKE ? or MaLop LIKE ? or MaMH LIKE ? ";
        return this.selectBySql(sql, "%" + keyword + "%" , "%" + keyword + "%" , "%" + keyword + "%" , "%" + keyword + "%");
    }
}
