/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.poly.utils;

import com.poly.entity.TaiKhoan;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author admin
 */
public class Auth {

    public static TaiKhoan user = null;
    public static void clear(){
        Auth.user = null;
    }
    public static boolean isLogin(){
       return Auth.user !=null;
    }
    public static Boolean isManager(){
       return Auth.isLogin() && (user.getVaiTro().equals("Can Bo Dao Tao"));
    }
    public static Boolean isStudent(){
       return Auth.isLogin() && (user.getVaiTro().equals("Sinh Vien"));
    }
    
}
