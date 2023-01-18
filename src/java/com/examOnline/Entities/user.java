/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.examOnline.Entities;

/**
 *
 * @author kausar
 */
public class user {

      private int id;
      private String userId;
      private String studentName;
      private String qualification;
      private String dateBirth;
      private String address;
      private String gender;
      private String contact;
      private String city;
      private String password;
      private String con_pass;
      private String profile;

      public user(int id, String userId, String studentName, String qualification, String dateBirth, String address, String gender, String contact, String city, String password, String con_pass, String profile) {
            this.id = id;
            this.userId = userId;
            this.studentName = studentName;
            this.qualification = qualification;
            this.dateBirth = dateBirth;
            this.address = address;
            this.gender = gender;
            this.contact = contact;
            this.city = city;
            this.password = password;
            this.con_pass = con_pass;
            this.profile = profile;
      }

      public user() {
      }

      public user(String userId, String studentName, String qualification, String dateBirth, String address, String gender, String contact, String city, String password, String con_pass, String profile) {
            this.userId = userId;
            this.studentName = studentName;
            this.qualification = qualification;
            this.dateBirth = dateBirth;
            this.address = address;
            this.gender = gender;
            this.contact = contact;
            this.city = city;
            this.password = password;
            this.con_pass = con_pass;
            this.profile = profile;
      }

      public user(String userId, String studentName, String qualification, String dateBirth, String address, String gender, String contact, String city, String password, String con_pass) {
            this.userId = userId;
            this.studentName = studentName;
            this.qualification = qualification;
            this.dateBirth = dateBirth;
            this.address = address;
            this.gender = gender;
            this.contact = contact;
            this.city = city;
            this.password = password;
            this.con_pass = con_pass;
      }

      public String getUserId() {
            return userId;
      }

      public int getId() {
            return id;
      }

      public void setId(int id) {
            this.id = id;
      }

      public void setUserId(String userId) {
            this.userId = userId;
      }

      public String getStudentName() {
            return studentName;
      }

      public void setStudentName(String studentName) {
            this.studentName = studentName;
      }

      public String getQualification() {
            return qualification;
      }

      public void setQualification(String qualification) {
            this.qualification = qualification;
      }

      public String getDateBirth() {
            return dateBirth;
      }

      public void setDateBirth(String dateBirth) {
            this.dateBirth = dateBirth;
      }

      public String getAddress() {
            return address;
      }

      public void setAddress(String address) {
            this.address = address;
      }

      public String getGender() {
            return gender;
      }

      public void setGender(String gender) {
            this.gender = gender;
      }

      public String getContact() {
            return contact;
      }

      public void setContact(String contact) {
            this.contact = contact;
      }

      public String getCity() {
            return city;
      }

      public void setCity(String city) {
            this.city = city;
      }

      public String getPassword() {
            return password;
      }

      public void setPassword(String password) {
            this.password = password;
      }

      public String getCon_pass() {
            return con_pass;
      }

      public void setCon_pass(String con_pass) {
            this.con_pass = con_pass;
      }

      public String getProfile() {
            return profile;
      }

      public void setProfile(String profile) {
            this.profile = profile;
      }
}
