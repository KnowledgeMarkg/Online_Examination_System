/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.examOnline.UserDao;

import com.examOnline.Entities.user;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author kausar
 */
public class userDao {

      private Connection con;

      public userDao(Connection con) {
            this.con = con;
      }
      // Craete Function to save USer  Data into DataBase

      public boolean saveUser(user User) {
            boolean f = false;
            try {
                  String q = "insert into studentdetails(userId, studentName, qualification, dateBirth, address, gender, contact, city, password, con_pass) values(?,?,?,?,?,?,?,?,?,?)";
                  PreparedStatement pst = this.con.prepareStatement(q);
                  pst.setString(1, User.getUserId());
                  pst.setString(2, User.getStudentName());
                  pst.setString(3, User.getQualification());
                  pst.setString(4, User.getDateBirth());
                  pst.setString(5, User.getAddress());
                  pst.setString(6, User.getGender());
                  pst.setString(7, User.getContact());
                  pst.setString(8, User.getCity());
                  pst.setString(9, User.getPassword());
                  pst.setString(10, User.getCon_pass());
                  pst.executeUpdate();
                  f = true;
            } catch (SQLException e) {
                  e.printStackTrace();
            }

            return f;
      }

      public user getUserByEmailAndPassword(String email, String password) {
            user User = null;
            try {
                  String q = "select * from studentdetails where userId=? and password=?";
                  PreparedStatement pst = con.prepareStatement(q);
                  pst.setString(1, email);
                  pst.setString(2, password);
                  ResultSet rst = pst.executeQuery();
                  if (rst.next()) {
                        User = new user();
                        User.setStudentName(rst.getString("studentName"));
                        User.setUserId(rst.getString("userId"));
                        User.setAddress(rst.getString("address"));
                        User.setCity(rst.getString("city"));
                        User.setPassword(rst.getString("password"));
                        User.setCon_pass(rst.getString("con_pass"));
                        User.setQualification(rst.getString("qualification"));
                        User.setDateBirth(rst.getString("dateBirth"));
                        User.setGender(rst.getString("gender"));
                        User.setContact(rst.getString("contact"));
                        User.setProfile(rst.getString("profile"));
                  }
            } catch (SQLException e) {
                  e.printStackTrace();
            }
            return User;
      }

      public boolean updateUser(user User) {
            boolean f = false;
            try {
                  String q = "update studentdetails set studentName=?, qualification=?, dateBirth=?, address=?, gender=?, contact=?, city=?, password=?, con_pass=?, profile=? where userId=?";
                  PreparedStatement pst = con.prepareStatement(q);
                  pst.setString(1, User.getStudentName());
                  pst.setString(2, User.getQualification());
                  pst.setString(3, User.getDateBirth());
                  pst.setString(4, User.getAddress());
                  pst.setString(5, User.getGender());
                  pst.setString(6, User.getContact());
                  pst.setString(7, User.getCity());
                  pst.setString(8, User.getPassword());
                  pst.setString(9, User.getPassword());
                  pst.setString(10, User.getProfile());
                  pst.setString(11, User.getUserId());
                  pst.executeUpdate();
                  f = true;
            } catch (SQLException e) {
                  e.printStackTrace();
            }
            return f;
      }

      public boolean updateUserbyAdmin(String studentname, String qualification, String datebirth, String address, String gender, String contact, String city, String password, String userId) {
            boolean f = false;
            try {
                  String q = "update studentdetails set studentName=?, qualification=?, dateBirth=?, address=?, gender=?, contact=?, city=?, password=?, con_pass=? where userId=?";
                  PreparedStatement pst = con.prepareStatement(q);
                  pst.setString(1, studentname);
                  pst.setString(2, qualification);
                  pst.setString(3, datebirth);
                  pst.setString(4, address);
                  pst.setString(5, gender);
                  pst.setString(6, contact);
                  pst.setString(7, city);
                  pst.setString(8, password);
                  pst.setString(9, password);
                  pst.setString(10, userId);
                  pst.executeUpdate();
                  f = true;
            } catch (SQLException e) {
                  e.printStackTrace();
            }
            return f;
      }

      public List<user> getAllStudent() {
            List<user> list2 = new ArrayList<>();
            try {
                  String student = "select * from studentdetails order by id ASC";
                  PreparedStatement pst = con.prepareStatement(student);
                  ResultSet rst = pst.executeQuery();
                  while (rst.next()) {
                        int id = rst.getInt("id");
                        String name = rst.getString("studentName");
                        String userId = rst.getString("userId");
                        String address = rst.getString("address");
                        String city = rst.getString("city");
                        String password = rst.getString("password");
                        String con_pass = rst.getString("con_pass");
                        String qualification = rst.getString("qualification");
                        String dateBirth = rst.getString("dateBirth");
                        String gender = rst.getString("gender");
                        String contact = rst.getString("contact");
                        String profile = rst.getString("profile");
                        user User = new user(id, userId, name, qualification, dateBirth, address, gender, contact, city, password, con_pass, profile);
                        list2.add(User);
                  }
            } catch (SQLException e) {
                  e.printStackTrace();
            }
            return list2;
      }

      public user getUserByEmail(String email) {
            user User = null;
            try {
                  String q = "select * from studentdetails where userId=?";
                  PreparedStatement pst = con.prepareStatement(q);
                  pst.setString(1, email);
                  ResultSet rst = pst.executeQuery();
                  if (rst.next()) {
                        User = new user();
                        User.setStudentName(rst.getString("studentName"));
                        User.setUserId(rst.getString("userId"));
                        User.setAddress(rst.getString("address"));
                        User.setCity(rst.getString("city"));
                        User.setPassword(rst.getString("password"));
                        User.setCon_pass(rst.getString("con_pass"));
                        User.setQualification(rst.getString("qualification"));
                        User.setDateBirth(rst.getString("dateBirth"));
                        User.setGender(rst.getString("gender"));
                        User.setContact(rst.getString("contact"));
                        User.setProfile(rst.getString("profile"));
                  }
            } catch (SQLException e) {
                  e.printStackTrace();
            }
            return User;
      }

      public boolean deleteUserByUserId(String userId) {
            boolean f = false;
            try {
                  String del = "delete from studentdetails where userId=?";
                  PreparedStatement pst = con.prepareStatement(del);
                  pst.setString(1, userId);
                  pst.executeUpdate();
                  f = true;
            } catch (Exception e) {
            }
            return f;

      }

}
