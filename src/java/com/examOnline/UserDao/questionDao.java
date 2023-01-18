/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.examOnline.UserDao;

import com.examOnline.Entities.addQuestion;
import com.examOnline.Entities.result;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author kausar
 */
public class questionDao {

      private Connection con;

      public questionDao(Connection con) {
            this.con = con;
      }

      public boolean saveQuestion(addQuestion q) {
            boolean f = false;
            try {
                  String question = "insert into addquestion(qid,question, option1, option2, option3, option4,ans) values(?,?,?,?,?,?,?)";
                  PreparedStatement pstmt = con.prepareStatement(question);
                  pstmt.setInt(1, q.getQid());
                  pstmt.setString(2, q.getQuestion());
                  pstmt.setString(3, q.getOption1());
                  pstmt.setString(4, q.getOption2());
                  pstmt.setString(5, q.getOption3());
                  pstmt.setString(6, q.getOption4());
                  pstmt.setString(7, q.getAns());
                  pstmt.executeUpdate();
                  f = true;
            } catch (SQLException e) {
                  e.printStackTrace();
            }
            return f;

      }
//      Get All Question By Id

      public List<addQuestion> getQuestionByQuesId() {
            List<addQuestion> list = new ArrayList<>();
            try {
                  String que = "select * from addquestion order by qid ASC";
                  PreparedStatement pst = con.prepareStatement(que);
                  ResultSet rst = pst.executeQuery();
                  while (rst.next()) {
                        int qid = rst.getInt("qId");
                        String quest = rst.getString("question");
                        String opt1 = rst.getString("option1");
                        String opt2 = rst.getString("option2");
                        String opt3 = rst.getString("option3");
                        String opt4 = rst.getString("option4");
                        String ans = rst.getString("ans");
                        addQuestion q = new addQuestion(qid, quest, opt1, opt2, opt3, opt4, ans);
                        list.add(q);
                  }
            } catch (Exception e) {
                  e.printStackTrace();
            }
            return list;
      }

      public boolean updateQuestion(int qid, String question, String Opt1, String opt2, String opt3, String opt4, String ans) {
            boolean f = false;
            try {
                  String query = "update addquestion set question=?, option1=?,option2=?, option3=?, option4=? ,ans=? where qid=?";
                  PreparedStatement pst = con.prepareStatement(query);
                  pst.setString(1, question);
                  pst.setString(2, Opt1);
                  pst.setString(3, opt2);
                  pst.setString(4, opt3);
                  pst.setString(5, opt4);
                  pst.setString(6, ans);
                  pst.setInt(7, qid);
                  pst.executeUpdate();
                  f = true;
            } catch (SQLException e) {
                  e.printStackTrace();
            }
            return f;

      }
////      Get One  Question BY Question Id
//

      public addQuestion getSingleQuestionByQuesId(int qId) {
            addQuestion q = null;
            try {
                  String qu = "select * from addquestion where qid=?";
                  PreparedStatement pst = con.prepareStatement(qu);
                  pst.setInt(1, qId);
                  ResultSet rs = pst.executeQuery();
                  if (rs.next()) {
                        q = new addQuestion();
                        q.setQid(rs.getInt("qid"));
                        q.setQuestion(rs.getString("question"));
                        q.setOption1(rs.getString("option1"));
                        q.setOption2(rs.getString("option2"));
                        q.setOption3(rs.getString("option3"));
                        q.setOption4(rs.getString("option4"));
                        q.setAns(rs.getString("ans"));

                  }
            } catch (Exception e) {
                  e.printStackTrace();
            }
            return q;

      }

//      public List<addQuestion> getSingleQuestionByQuesId(int qId) {
//            List<addQuestion> list = new ArrayList<>();
//            addQuestion q = null;
//            try {
//                  String que = "select * from addquestion where qid=?";
//                  PreparedStatement pst = con.prepareStatement(que);
//                  pst.setInt(1, qId);
//                  ResultSet rst = pst.executeQuery();
//                  while (rst.next()) {
//                        q.setQid(rst.getInt(1));
//                        q.setQuestion(rst.getString(2));
//                        q.setOption1(rst.getString(3));
//                        q.setOption2(rst.getString(4));
//                        q.setOption3(rst.getString(5));
//                        q.setOption4(rst.getString(6));
//                        q.setAns(rst.getString(7));
//                        list.add(q);
//                  }
//            } catch (Exception e) {
//                  e.printStackTrace();
//            }
//            return list;
//      }
      public boolean deleteQuestion(int dQid) throws SQLException {
            boolean f = false;
            try {
                  String del = "delete from addquestion where qid=?";
                  PreparedStatement pst = con.prepareStatement(del);
                  pst.setInt(1, dQid);
                  pst.executeUpdate();
                  f = true;
            } catch (SQLException e) {
                  e.printStackTrace();
            }

            return f;
      }

      public result saveAns(result rest) {
            result r = null;
            int obt = rest.getObt();
            try {
                  String ans = "insert into result(sid,qid,answer, examdate) values(?,?,?,?)";
                  PreparedStatement pst = con.prepareStatement(ans);
                  pst.setString(1, rest.getSid());
                  pst.setInt(2, rest.getQid());
                  pst.setString(3, rest.getAnswer());
                  pst.setString(4, rest.getExamDate());
                  pst.executeUpdate();
                  String q = "select * from addquestion where qid=? and ans= ?";
                  PreparedStatement pst1 = con.prepareStatement(q);
                  pst1.setInt(1, rest.getQid());
                  pst1.setString(2, rest.getAnswer());
                  ResultSet rst = pst1.executeQuery();
                  if (rst.next()) {
                        obt += 10;
                        r = new result();
                        r.setObt(obt);
                  }
            } catch (Exception e) {
                  e.printStackTrace();
            }
            return r;
      }
}
