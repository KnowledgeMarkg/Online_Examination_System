/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.examOnline.Entities;

/**
 *
 * @author kausar
 */
public class adminLogin {

      private String userId;
      private String password;

      public adminLogin(String userId, String password) {
            this.userId = userId;
            this.password = password;
      }

      public adminLogin() {
      }

      public String getUserId() {
            return userId;
      }

      public void setUserId(String userId) {
            this.userId = userId;
      }

      public String getPassword() {
            return password;
      }

      public void setPassword(String password) {
            this.password = password;
      }
}
