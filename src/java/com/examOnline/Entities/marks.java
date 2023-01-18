/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.examOnline.Entities;

/**
 *
 * @author kausar
 */
public class marks {

      private String sid;
      private String edate;
      private String maximum;
      private String obtained;

      public marks() {
      }

      public marks(String sid, String edate, String maximum, String obtained) {
            this.sid = sid;
            this.edate = edate;
            this.maximum = maximum;
            this.obtained = obtained;
      }

      public String getSid() {
            return sid;
      }

      public void setSid(String sid) {
            this.sid = sid;
      }

      public String getEdate() {
            return edate;
      }

      public void setEdate(String edate) {
            this.edate = edate;
      }

      public String getMaximum() {
            return maximum;
      }

      public void setMaximum(String maximum) {
            this.maximum = maximum;
      }

      public String getObtained() {
            return obtained;
      }

      public void setObtained(String obtained) {
            this.obtained = obtained;
      }
}
