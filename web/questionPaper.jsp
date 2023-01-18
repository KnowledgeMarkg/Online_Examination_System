<%-- 
    Document   : questionPaper
    Created on : Oct 31, 2022, 3:39:18 PM
    Author     : kausar
--%>

<%@page import="com.examOnline.Entities.Message"%>
<%@page import="java.util.List"%>
<%@page import="com.examOnline.Entities.addQuestion"%>
<%@page import="com.examOnline.UserDao.questionDao"%>
<%@page import="com.examOnline.helper.ConnectionProvider"%>
<%@page import="com.examOnline.Entities.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
      user User = (user) session.getAttribute("currentUser");
      if (User == null) {
            response.sendRedirect("login.jsp");
            System.out.println(User);
      }
%>
<!DOCTYPE html>
<html>
      <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link href="https://unpkg.com/@material-tailwind/html@latest/styles/material-tailwind.css" rel="stylesheet"/>
            <link href="timer.css" rel="stylesheet" type="text/css"/>
            <title>JSP Page</title>
      </head>
      <body>
            <script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.js" defer></script>
            <!-- navbar goes here -->
            <nav class="bg-gradient-to-r from-red-500 to-green-500 border-double">
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
            <div class="flex justify-center space-x-4 sticky top-0">
                  <div class="flex justify-start p-4 mb-4 w-4/3 h-16 mt-4 text-xl text-blue-700 bg-blue-100 rounded-lg dark:bg-blue-200 dark:text-blue-800" role="alert">
                        <span class="font-medium ">Your Exam! </span> &nbsp; Will be submitted after the end of time.
                  </div>
                  <div class="diva flex justify-end ">
                        <div class="diva" id="minutes"></div>
                        <div class="diva" id="seconds"></div>
                  </div>
            </div>
            <!--Question Paper Modol-->       
            <%questionDao dao = new questionDao(ConnectionProvider.getConnection());
                  List<addQuestion> list = dao.getQuestionByQuesId();
                  addQuestion elem;
                  //                        for (addQuestion elem : list)
                  for (int i = 0; i < list.size(); i++) {
                        elem = (addQuestion) list.get(i);
            %>
            <form id="myform" action="controller.jsp" method="post" >
                  <input type="hidden" name="size" value="<%=list.size()%>">
                  <div class="mt-6 mb-4 flex items-center flex-col">     
                        <h3 class="w-2/4 mb-4 font-semibold text-lg text-gray-900 dark:text-white"><%=i + 1%>.
                              <%= elem.getQuestion()%>
                        </h3>
                        <ul class="w-2/4 mb-4 text-sm font-medium text-gray-900 bg-white rounded-lg border border-gray-200 dark:bg-gray-700 dark:border-gray-600 dark:text-white">
                              <li class="w-full rounded-t-lg border-b border-gray-200 dark:border-gray-600">
                                    <div class="flex items-center pl-3">
                                          <input id="list-radio-license" type="radio" value="<%= elem.getOption1()%>" name="ans<%=i%>" class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-700 focus:ring-2 dark:bg-gray-600 dark:border-gray-500">
                                          <label for="c1<%=i%>" class="py-2 ml-2 w-full text-base font-medium text-gray-900 dark:text-gray-300"> <%= elem.getOption1()%></label>
                                    </div>
                              </li>
                              <li class="w-full rounded-t-lg border-b border-gray-200 dark:border-gray-600">
                                    <div class="flex items-center pl-3">
                                          <input id="list-radio-id" type="radio" value="<%= elem.getOption2()%>" name="ans<%=i%>" class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-700 focus:ring-2 dark:bg-gray-600 dark:border-gray-500">
                                          <label for="c2<%=i%>" class="py-2 ml-2 w-full text-base font-medium text-gray-900 dark:text-gray-300"> <%= elem.getOption2()%></label>
                                    </div>
                              </li>
                              <li class="w-full rounded-t-lg border-b border-gray-200 dark:border-gray-600">
                                    <div class="flex items-center pl-3">
                                          <input id="list-radio-millitary" type="radio" value="<%= elem.getOption3()%>" name="ans<%=i%>" class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-700 focus:ring-2 dark:bg-gray-600 dark:border-gray-500">
                                          <label for="c3<%=i%>" class="py-2 ml-2 w-full text-base font-medium text-gray-900 dark:text-gray-300"> <%= elem.getOption3()%></label>
                                    </div>
                              </li>
                              <li class="w-full rounded-t-lg border-b border-gray-200 dark:border-gray-600">
                                    <div class="flex items-center pl-3">
                                          <input id="list-radio-passport" type="radio" value="<%= elem.getOption4()%>" name="ans<%=i%>" class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-700 focus:ring-2 dark:bg-gray-600 dark:border-gray-500">
                                          <label for="c4<%=i%>" class="py-2 ml-2 w-full text-base font-medium text-gray-900 dark:text-gray-300"> <%= elem.getOption4()%></label>
                                    </div>
                              </li>
                        </ul>   
                  </div>
                  <input type="hidden" name="question<%=i%>" value="<%=elem.getQuestion()%>">
                  <input type="hidden" name="qid<%=i%>" value="<%=elem.getQid()%>">  
                  <%}%>      
                  <input type="hidden" name="operation" value="submitted"> 
                  <div class="flex flex-col justify-center items-center mb-4">
                        <input type="submit" class=" text-white w-2/4 bg-gradient-to-br from-purple-600 to-blue-500 hover:bg-gradient-to-bl focus:ring-4 focus:outline-none focus:ring-blue-300 dark:focus:ring-blue-800 font-medium rounded-lg text-sm px-5 py-2.5  mr-2 mb-2" value="Done">          
                  </div>
            </form>
            <!--End Of Question Paper Modal-->
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
            <script src="timer.js" type="text/javascript"></script>
      </body>
</html>
