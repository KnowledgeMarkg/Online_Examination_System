<%-- 
    Document   : studentResult
    Created on : Nov 2, 2022, 7:21:53 PM
    Author     : kausar
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.mysql.cj.xdevapi.PreparableStatement"%>
<%@page import="com.examOnline.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.examOnline.Entities.user"%>
<%
      user User = (user) session.getAttribute("currentUser");
      if (User == null) {
            response.sendRedirect("login.jsp");
      }
      Connection con = ConnectionProvider.getConnection();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
      <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link href="https://unpkg.com/@material-tailwind/html@latest/styles/material-tailwind.css" rel="stylesheet"/>
            <title>JSP Page</title>
            <style>
                  .outer-border{
                        width:800px;
                        height:850px;
                        padding:20px;
                        text-align:center;
                        border: 10px solid #673AB7;
                        margin-left: 21%;
                  }

                  .inner-dotted-border{
                        width:750px;
                        height:800px;
                        padding:20px;
                        text-align:center;
                        border: 5px solid #673AB7;
                        border-style: dotted;
                  }

                  .certification{
                        font-size:50px;
                        font-weight:bold;
                        color: #663ab7;
                  }

                  .certify{
                        font-size:25px;
                  }

                  .name{
                        font-size:30px;
                        color: green;
                  }

                  .fs-30{
                        font-size:30px;
                  }

                  .fs-20{
                        font-size:20px;
                  }
            </style>
      </head>
      <body>
            <script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.js" defer></script>
            <!-- navbar goes here -->
            <nav class="bg-gradient-to-r from-red-500 to-green-500 border-double mb-8">
                  <div class="max-w-6xl mx-auto px-4">
                        <div class="flex justify-between">
                              <div class="flex space-x-4">
                                    <!-- logo -->
                                    <div>
                                          <a href="#" class="flex items-center py-5 px-2 text-white hover:text-gray-900">
                                                <svg class="h-8 w-8 mr-4 text-blue-400" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 19l9 2-9-18-9 18 9-2zm0 0v-8" />
                                                </svg>
                                                <span class="font-bold text-2xl outline-dotted outline-4 outline-offset-4 rounded outline-cyan-500 hover:outline-blue-900">Online Exam</span>
                                          </a>
                                    </div>
                                    <!-- primary nav -->
                                    <div class="hidden md:flex items-center space-x-1 text-2xl">
                                          <a href="#" class="py-5 px-3 text-white hover:text-gray-900">Home</a>
                                          <a href="#" class="py-5 px-3 text-white hover:text-gray-900">Result</a>
                                          <a href="#" class="py-5 px-3 text-white hover:text-gray-900">FeedBack</a>
                                          <a href="questionPaper.jsp" class="py-5 px-3 text-white hover:text-gray-900">Exam</a>
                                    </div>
                              </div>
                              <!-- secondary nav -->
                              <div class="hidden md:flex items-center space-x-4">
                                    <a href="LogoutServlet" class="py-5 px-3 text-2xl">Logout</a>
                                    <a  onclick="document.getElementById('myModal').showModal()" id="btn" class=" cursor-pointer py-2 px-3 text-2xl bg-yellow-400 hover:bg-yellow-300 text-yellow-900 hover:text-yellow-800 rounded transition duration-300"><%=User.getStudentName()%></a>
                                    <a onclick="document.getElementById('myModal2').showModal()" id="btn" class="cursor-pointer py-2 px-3 text-2xl bg-yellow-400 hover:bg-yellow-300 text-yellow-900 hover:text-yellow-800 rounded transition duration-300">Update Profile</a>
                              </div>
                              <!-- mobile button goes here -->
                              <div class="md:hidden flex items-center">
                                    <button class="mobile-menu-button">
                                          <svg class="w-6 h-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
                                          </svg>
                                    </button>
                              </div>
                        </div>
                  </div>
                  <!-- mobile menu -->
                  <div class="mobile-menu hidden md:hidden py-8">
                        <a href="#" class="block py-2 px-3 text-2xl text-white hover:text-gray-900">Home</a>
                        <a href="#" class="block py-2 px-3 text-2xl text-white hover:text-gray-900">Result</a>
                        <a href="#" class="block py-2 px-3 text-2xl text-white hover:text-gray-900">FeedBack</a>
                        <a href="#" class="block py-2 px-3 mb-4 text-2xl text-white hover:text-gray-900">Exam</a>
                        <a  onclick="document.getElementById('myModal').showModal()" id="btn" class="cursor-pointer py-2 px-3 mr-4 mx-2 text-2xl bg-yellow-400 hover:bg-yellow-300 text-yellow-900 hover:text-yellow-800 rounded transition duration-300"><%=User.getStudentName()%></a>
                        <a onclick="document.getElementById('myModal2').showModal()" id="btn" class="cursor-pointer py-2 px-3 text-2xl bg-yellow-400 hover:bg-yellow-300 text-yellow-900 hover:text-yellow-800 rounded transition duration-300">Update Profile</a>
                  </div>
            </nav> 
            <%
                  String q = "select studentdetails.studentName, studentdetails.qualification, studentdetails.dateBirth, studentdetails.gender, marks.edate, marks.maximum, marks.obtained from studentdetails, marks where studentdetails.userId=marks.sid and studentdetails.userId=? ";
                  PreparedStatement pst = con.prepareStatement(q);
                  pst.setString(1, User.getUserId());
                  ResultSet rs = pst.executeQuery();
                  if (rs.next()) {
                       out.println("<div class='outer-border mb-8'>");
                       out.println("<div class='inner-dotted-border'>");
                       out.println(" <span class='certification'>Certificate of Completion</span>");
                       out.println("<br><br>");
                       out.println("<span class='certify'><i>This is to certify that</i></span> ");
                       out.println(" <br><br>");
                       out.println("<span class='name'><b>"+rs.getString(1)+"</b></span><br/><br/>");
                       out.println("<span class='certify'><b> Qualification: "+rs.getString(2)+"</b></span><br/><br/>");
                       out.println("<span class='fs'><b> Birth Day: "+rs.getString(3)+"</b></span><br/><br/>");
                       out.println("<span class='fs'><b> Gender: "+rs.getString(4)+"</b></span><br/><br/>");
                       out.println("<span class='certify'><i>has successfully completed the certification</i></span> <br/><br/>");
                       out.println("<span class='fs-30'>Java Developer</span> <br/><br/>");
                       out.println("<span class='fs-20'>Maximum Mark: <b>"+rs.getString(6)+"</b></span><br/><br/>");
                       out.println("<span class='fs-20'>with score of: <b>"+rs.getString(7)+"</b></span><br/><br/>");
                       out.println("<span class='certify'><i>dated</i></span><br>");
                       out.println("<span class='fs-30'>"+rs.getString(5)+"</span>");
                       out.println("</div>");
                       out.println("</div>");
                  }
            %>       
            <%@include file="modals.jsp" %>
            <!--Footer Section-->
            <script src="https://cdn.tailwindcss.com"></script>
            <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
            <script>
                              // grab everything we need
                              const btn = document.querySelector("button.mobile-menu-button");
                              const menu = document.querySelector(".mobile-menu");
                              btn.addEventListener("click", () => {
                                    menu.classList.toggle("hidden");
                              });
            </script>
      </body>
</html>
