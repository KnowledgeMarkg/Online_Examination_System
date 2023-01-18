/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.examOnline.Entities;

/**
 *
 * @author kausar
 */
public class result {

      private String sid;
      private int qid;
      private String answer;
      private String examDate;
      private int obt;

      public result(String sid, int qid, String answer, String examDate, int obt) {
            this.sid = sid;
            this.qid = qid;
            this.answer = answer;
            this.examDate = examDate;
            this.obt = obt;
      }

      public int getObt() {
            return obt;
      }

      public void setObt(int obt) {
            this.obt = obt;
      }

      public result() {
      }

      public String getSid() {
            return sid;
      }

      public void setSid(String sid) {
            this.sid = sid;
      }

      public int getQid() {
            return qid;
      }

      public void setQid(int qid) {
            this.qid = qid;
      }

      public String getAnswer() {
            return answer;
      }

      public void setAnswer(String answer) {
            this.answer = answer;
      }

      public String getExamDate() {
            return examDate;
      }

      public void setExamDate(String examDate) {
            this.examDate = examDate;
      }
}
