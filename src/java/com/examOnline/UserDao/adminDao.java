/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.examOnline.UserDao;

import com.examOnline.Entities.adminLogin;
import java.sql.*;

/**
 *
 * @author kausar
 */
public class adminDao {

      private Connection con;

      public adminDao(Connection con) {
            this.con = con;
      }

      public adminLogin getAdminByEmailAndPassword(String userId, String pass) {
            adminLogin admin = null;
            try {
                  String q = " select * from adminlogin where userId=? and password=?";
                  PreparedStatement pstmt = con.prepareStatement(q);
                  pstmt.setString(1, userId);
                  pstmt.setString(2, pass);
                  ResultSet rst = pstmt.executeQuery();
                  if (rst.next()) {
                        admin = new adminLogin();
                        admin.setUserId(rst.getString("userId"));
                        admin.setPassword(rst.getString("password"));
                  }
            } catch (SQLException e) {
                  e.printStackTrace();
            }
            return admin;
      }

      public boolean updateAdmin(String conPass, String userId) {
            boolean f = false;
            try {
                  String query = "update adminlogin set password=? where userId=?";
                  PreparedStatement pst = con.prepareStatement(query);
                  pst.setString(1, conPass);
                  pst.setString(2, userId);
                  pst.executeUpdate();
                  f = true;
            } catch (SQLException e) {
                  e.printStackTrace();
            }
            return f;
      }

}
