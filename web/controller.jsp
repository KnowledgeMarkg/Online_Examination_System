<%-- 
    Document   : controller
    Created on : Nov 1, 2022, 12:05:05 PM
    Author     : kausar
--%>

<%@page import="com.examOnline.Entities.Message"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.examOnline.helper.ConnectionProvider"%>
<%@page import="java.time.LocalTime"%>
<%@page import="com.examOnline.Entities.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
      user User = (user) session.getAttribute("currentUser");
      if (User == null) {
            response.sendRedirect("login.jsp");
      }
%>
<!DOCTYPE html>
<html>
      <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>JSP Page</title>
      </head>
      <body>

            <%
                  String myObj = LocalDate.now().toString();
                  int size = Integer.parseInt(request.getParameter("size"));
                  String ans[] = new String[size];
                  String qid[] = new String[size];
                  int i, count = 0, obt = 0;
                  Connection con = ConnectionProvider.getConnection();
                  try {
                        for (i = 0; i < size; i++) {
                              String question = request.getParameter("question" + count);

                              if (request.getParameter("ans" + count) != null) {
                                    ans[i] = request.getParameter("ans" + count);
                              } else {
                                    ans[i] = "Not Submit";
                              }
                              qid[i] = request.getParameter("qid" + count);
                              String answer = "insert into result(sid,qid,answer, examdate) values(?,?,?,?)";
                              PreparedStatement pst = con.prepareStatement(answer);
                              pst.setString(1, User.getUserId());
                              pst.setString(2, qid[i]);
                              pst.setString(3, ans[i]);
                              pst.setString(4, myObj);
                              pst.executeUpdate();
                              String qu = "select * from addquestion where qid=? and ans=?";
                              PreparedStatement pst1 = con.prepareStatement(qu);
                              pst1.setString(1, qid[i]);
                              pst1.setString(2, ans[i]);
                              ResultSet rs = pst1.executeQuery();
                              if (rs.next()) {
                                    obt += 10;
                              }
                              count++;
                        }
                        HttpSession s = request.getSession();
                        String check = "select * from marks where sid=?";
                        PreparedStatement pst3 = con.prepareStatement(check);
                        pst3.setString(1, User.getUserId());
                        ResultSet rs = pst3.executeQuery();
                        if (rs.next()) {
                              if (rs.getString("sid").equals(User.getUserId())) {
                                    Message msg = new Message("You Are Already Done This Exam...", "success ", " bg-green-100 rounded-lg py-5 px-6 mb-4 text-base text-green-700 mb-3");
                                    s.setAttribute("msg2", msg);
                                    response.sendRedirect("StudentLogin.jsp");
                              }
                        } else {
                              String marks = "insert into marks values(?,curdate(),'100',?) ";
                              PreparedStatement pst2 = con.prepareStatement(marks);
                              pst2.setString(1, User.getUserId());
                              pst2.setInt(2, obt);
                              i = pst2.executeUpdate();
                              if (i > 0) {
                                    response.sendRedirect("studentResult.jsp");
                              }
                        }

                  } catch (Exception e) {
                        e.printStackTrace();
                  }
            %>  
      </body>
</html>
