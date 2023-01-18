<%-- 
    Document   : adminpage
    Created on : Oct 16, 2022, 3:49:00 AM
    Author     : kausar
--%>
<%@page import="com.examOnline.Entities.user"%>
<%@page import="com.examOnline.UserDao.userDao"%>
<%@page import="java.util.List"%>
<%@page import="com.examOnline.helper.ConnectionProvider"%>
<%@page import="com.examOnline.UserDao.questionDao"%>
<%@page import="com.examOnline.Entities.addQuestion"%>
<%@page import="com.examOnline.Entities.Message"%>
<%@page import="com.examOnline.Entities.adminLogin"%>
<%
      addQuestion q = (addQuestion) session.getAttribute("currentquestion");
      adminLogin admin = (adminLogin) session.getAttribute("currenadmin");
      if (admin == null) {
            response.sendRedirect("adminlogin.jsp");
      }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
      <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <%@include file="allincludeheader.jsp" %>
            <title>Admin Home Page</title>
      </head>
      <body>
            <%@include file="nabvaradmin.jsp" %>
            <%
                  Message m = (Message) session.getAttribute("msg2");
                  if (m != null) {
            %>
            <div class="<%= m.getCssClass()%>" role="alert">
                  <%=  m.getContent()%>
            </div>
            <%
                        session.removeAttribute("msg2");
                  }

            %>

            <div class="sliderAx h-auto">
                  <div id="slider-1" class="mx-auto">
                        <div class="bg-cover bg-center   text-white py-24 px-10 object-fill" style="background-image: url(img/first.jpg)">
                              <div class="md:w-1/2">
                                    <p class="font-bold text-sm uppercase">Services</p>
                                    <p class="text-3xl font-bold">Hello world</p>
                                    <p class="text-2xl mb-10 leading-none">Carousel with TailwindCSS and jQuery</p>
                                    <a href="#" class="bg-purple-800 py-4 px-8 text-white font-bold uppercase text-xs rounded hover:bg-gray-200 hover:text-gray-800">Contact us</a>
                              </div>  
                        </div> <!-- container -->
                        <br>
                  </div>
                  <div id="slider-2" class="mx-auto">
                        <div class="bg-cover bg-top  h-auto text-white py-24 px-10 object-fill" style="background-image: url(img/third.jpg)">
                              <p class="font-bold text-sm uppercase">Services</p>
                              <p class="text-3xl font-bold">Hello world</p>
                              <p class="text-2xl mb-10 leading-none">Carousel with TailwindCSS and jQuery</p>
                              <a href="#" class="bg-purple-800 py-4 px-8 text-white font-bold uppercase text-xs rounded hover:bg-gray-200 hover:text-gray-800">Contact us</a>
                        </div> <!-- container -->
                        <br>
                  </div>
            </div>
            <div  class="flex justify-between w-12 mx-auto pb-2">
                  <button id="sButton1" onclick="sliderButton1()" class="bg-purple-400 rounded-full w-4 pb-2 " ></button>
                  <button id="sButton2" onclick="sliderButton2()" class="bg-purple-400 rounded-full w-4 p-2"></button>
            </div>
            <section class="pt-10 bg-[conic-gradient(at_bottom_left,_var(--tw-gradient-stops))] from-fuchsia-300 via-green-400 to-rose-700 h-3/4 lg:h-96">
                  <div class="px-12 mx-auto max-w-7xl">
                        <div class="w-full mx-auto text-left md:w-11/12 xl:w-9/12 md:text-center">
                              <h1 class="mb-8 text-4xl font-extrabold leading-none tracking-normal text-gray-900 md:text-6xl md:tracking-tight">
                                    <span>Start</span> <span class="block w-full py-2 text-transparent bg-clip-text leading-12 bg-gradient-to-r from-green-400 to-purple-500 lg:inline">building a buzz</span> <span>around your product ?</span>
                              </h1>
                              <p class="px-0 mb-8 text-lg text-gray-600 md:text-xl lg:px-24">
                                    Start gaining the traction you've always wanted with our next-level templates and designs. Crafted to help you tell your story.
                              </p>
                              <div class="mb-4 space-x-0 md:space-x-2 md:mb-8">
                                    <a href="#_" class="inline-flex items-center justify-center w-full px-6 py-3 mb-2 text-lg text-white bg-green-400 rounded-2xl sm:w-auto sm:mb-0">
                                          Get Started
                                          <svg class="w-4 h-4 ml-1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor"><path fill-rule="evenodd" d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
                                    </a>
                                    <a href="#_" class="inline-flex items-center justify-center w-full px-6 py-3 mb-2 text-lg bg-gray-100 rounded-2xl sm:w-auto sm:mb-0">
                                          Contact Us
                                          <svg class="w-4 h-4 ml-1" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9.663 17h4.673M12 3v1m6.364 1.636l-.707.707M21 12h-1M4 12H3m3.343-5.657l-.707-.707m2.828 9.9a5 5 0 117.072 0l-.548.547A3.374 3.374 0 0014 18.469V19a2 2 0 11-4 0v-.531c0-.895-.356-1.754-.988-2.386l-.548-.547z"></path></svg>
                                    </a>
                              </div>
                        </div>
            </section>
            <!--Add Question Modal Here-->
            <!-- Main modal -->
            <div id="authentication-modal" aria-hidden="true" class="hidden overflow-x-hidden overflow-y-auto fixed  md:h-full top-4 left-0 right-0 md:inset-0 z-50 justify-center items-center">
                  <div class="mx-4 ">
                        <!-- Modal content -->
                        <div class="bg-gradient-to-r from-yellow-400 via-gray-50 to-teal-300 rounded-md ">
                              <div class="flex justify-center items-center">
                                    <div class="text-2xl font-bold ">
                                          Add Question Online Exam
                                    </div>
                                    <button type="button" class="flex w-1/12 h-auto justify-center cursor-pointer" data-modal-toggle="authentication-modal">
                                          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>  
                                    </button>
                              </div>
                              <form method="POST" action="addPostServlet" id="add_post_form" enctype="multipart/form-data">     
                                    <div class="w-96 mx-auto mx-4 mr-4 ml-3">
                                          <div class="mb-1">
                                                <label for="default-input" class="block mb-1 text-2xl font-bold text-gray-900 dark:text-gray-300">Question ID</label>
                                                <input type="number" id="default-input" required name="quId" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                                          </div>
                                          <div class="mb-1">
                                                <label for="default-input" class="block mb-1 text-2xl font-bold text-gray-900 dark:text-gray-300">Question</label>
                                                <input type="text" id="default-input" required name="question" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                                          </div>
                                          <div class="mb-1">
                                                <label for="default-input" class="block mb-1 text-xl font-medium text-gray-900 dark:text-gray-300">Option 1</label>
                                                <input type="text" id="default-input" name="opt1" required class=" bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                                          </div>
                                          <div class="mb-1">
                                                <label for="default-input" class="block mb-1 text-xl font-medium text-gray-900 dark:text-gray-300">Option 2</label>
                                                <input type="text" id="default-input" name="opt2" required class=" bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                                          </div>
                                          <div class="mb-1">
                                                <label for="default-input" class="block mb-1 text-xl font-medium text-gray-900 dark:text-gray-300">Option 3</label>
                                                <input type="text" id="default-input" name="opt3" required class=" bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                                          </div>
                                          <div class="mb-1">
                                                <label for="default-input" class="block mb-1 text-xl font-medium text-gray-900 dark:text-gray-300">Option 4</label>
                                                <input type="text" id="default-input" name="opt4" required class=" bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                                          </div>
                                          <div class="mb-4">
                                                <label for="default-input" class="block mb-1 text-xl font-medium text-gray-900 dark:text-gray-300">Answer</label>
                                                <input type="text" id="default-input" name="ans" required class="  bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                                          </div> 
                                          <button type="submit" role="submit" class=" w-full text-white bg-gradient-to-r from-purple-500 via-purple-600 to-purple-700 hover:bg-gradient-to-br focus:ring-4 focus:outline-none focus:ring-purple-300 dark:focus:ring-purple-800 font-medium rounded-lg text-sm px-5 py-2.5 text-center mr-2 mb-2">Submit Question</button>
                                    </div>
                              </form>
                        </div>
                  </div>
            </div> 
            <script src="https://unpkg.com/@themesberg/flowbite@1.2.0/dist/flowbite.bundle.js"></script>
            <!--End Of Add Question Model-->
            <!--Edit Question on Admin Page-->
            <div class="w-full rounded-lg">
                  <!-- Main modal -->
                  <div id="authentication-modal2" aria-hidden="true" class="hidden overflow-x-hidden overflow-y-auto fixed  md:h-full top-4 left-0 right-0 md:inset-0 z-50 justify-center items-center">
                        <div class="relative h-auto w-11/12 md:w-2/5 lg:w-2/5 p-3 bg-gradient-to-r from-yellow-400 via-gray-50 to-teal-300 rounded-md ">
                              <!-- Modal content -->
                              <div class="flex w-full h-auto justify-center items-center ">
                                    <div class="flex w-11/12 lg:w-8/12 h-auto py-2 justify-center items-center text-2xl font-bold ">
                                          Add Question Online Exam
                                    </div>
                                    <button type="button" class="flex w-1/12 h-auto justify-center cursor-pointer" data-modal-toggle="authentication-modal2">
                                          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>  
                                    </button>
                              </div>
                              <div class="w-96 mx-auto">
                                    <div class="mb-1">
                                          <label for="default-input" class="block mb-1 text-2xl font-bold text-gray-900 dark:text-gray-300"></label>
                                          <input type="number" id="default-input" required name="qId" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                                    </div>
                                    <div class="mb-1">
                                          <label for="default-input" class="block mb-1 text-2xl font-bold text-gray-900 dark:text-gray-300">Question</label>
                                          <input type="text" id="default-input" required name="question" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                                    </div>
                                    <div class="mb-1">
                                          <label for="default-input" class="block mb-1 text-xl font-medium text-gray-900 dark:text-gray-300">Option 1</label>
                                          <input type="text" id="default-input" name="opt1" required class=" bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                                    </div>
                                    <div class="mb-1">
                                          <label for="default-input" class="block mb-1 text-xl font-medium text-gray-900 dark:text-gray-300">Option 2</label>
                                          <input type="text" id="default-input" name="opt2" required class=" bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                                    </div>
                                    <div class="mb-1">
                                          <label for="default-input" class="block mb-1 text-xl font-medium text-gray-900 dark:text-gray-300">Option 3</label>
                                          <input type="text" id="default-input" name="opt3" required class=" bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                                    </div>
                                    <div class="mb-1">
                                          <label for="default-input" class="block mb-1 text-xl font-medium text-gray-900 dark:text-gray-300">Option 4</label>
                                          <input type="text" id="default-input" name="opt4" required class=" bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                                    </div>
                                    <div class="mb-4">
                                          <label for="default-input" class="block mb-1 text-xl font-medium text-gray-900 dark:text-gray-300">Answer</label>
                                          <input type="text" id="default-input" name="ans" required class="  bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                                    </div> 
                                    <button type="submit" role="submit" class=" w-full text-white bg-gradient-to-r from-purple-500 via-purple-600 to-purple-700 hover:bg-gradient-to-br focus:ring-4 focus:outline-none focus:ring-purple-300 dark:focus:ring-purple-800 font-medium rounded-lg text-sm px-5 py-2.5 text-center mr-2 mb-2">Submit Question</button>
                              </div>
                        </div>
                  </div> 
            </div>
            <script src="https://unpkg.com/@themesberg/flowbite@1.2.0/dist/flowbite.bundle.js"></script>
            <!--End Of Edit Question Admin PAge--> 
            <div class="w-full rounded-lg ">
                  <!-- Main modal -->
                  <div id="authentication-modal3" aria-hidden="true" class="hidden overflow-x-hidden overflow-y-auto fixed  md:h-full top-4 left-0 right-0 md:inset-0 z-50 justify-center items-center">
                        <div class="relative w-full px-4 h-screen">
                              <!-- Modal content -->
                              <div class="bg-white rounded-md rounded-lg shadow relative dark:bg-gray-700 ">
                                    <div class="flex justify-end p-4">
                                          <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-800 dark:hover:text-white" data-modal-toggle="authentication-modal3">
                                                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>  
                                          </button>
                                    </div>
                                    <div class="overflow-x-auto relative shadow-md sm:rounded-lg">
                                          <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
                                                <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                                                      <tr>
                                                            <th scope="col" class="py-3 px-6">
                                                                  Question Id
                                                            </th>
                                                            <th scope="col" class="py-3 px-6">
                                                                  Question
                                                            </th>
                                                            <th scope="col" class="py-3 px-6">
                                                                  Option 1
                                                            </th>
                                                            <th scope="col" class="py-3 px-6">
                                                                  Option 2
                                                            </th>
                                                            <th scope="col" class="py-3 px-6">
                                                                  Option 3
                                                            </th>
                                                            <th scope="col" class="py-3 px-6">
                                                                  Option 4
                                                            </th>
                                                            <th scope="col" class="py-3 px-6">
                                                                  Ansawer
                                                            </th>
                                                            <th scope="col" class="py-3 px-6">
                                                                  <span class="sr-only">Edit</span>
                                                            </th>
                                                            <th scope="col" class="py-3 px-6">
                                                                  <span class="sr-only">Delete</span>
                                                            </th>
                                                      </tr>
                                                </thead>
                                                <% questionDao dao = new questionDao(ConnectionProvider.getConnection());
                                                      List<addQuestion> list = dao.getQuestionByQuesId();
                                                      for (addQuestion elem : list) {
                                                %>
                                                <tbody>      
                                                      <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
                                                            <th scope="row" class="py-4 px-6 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                                                                  <%= elem.getQid()%>
                                                            </th>
                                                            <td class="py-4 px-6">
                                                                  <%= elem.getQuestion()%>
                                                            </td>
                                                            <td class="py-4 px-6">
                                                                  <%= elem.getOption1()%>
                                                            </td>
                                                            <td class="py-4 px-6">
                                                                  <%= elem.getOption2()%>
                                                            </td>
                                                            <td class="py-4 px-6">
                                                                  <%= elem.getOption3()%>
                                                            </td>
                                                            <td class="py-4 px-6">
                                                                  <%= elem.getOption4()%>
                                                            </td>
                                                            <td class="py-4 px-6">
                                                                  <%= elem.getAns()%>
                                                            </td>
                                                            <td class="py-4 px-6 text-right">
                                                                  <a href="editQuestion.jsp?qid=<%= elem.getQid()%>" class="font-medium text-blue-600 dark:text-blue-500 hover:underline">Edit</a>
                                                            </td>
                                                            <td class="py-4 px-6 text-right">
                                                                  <a href="deleteQuestion?dQid=<%= elem.getQid()%>" class="font-medium text-blue-600 dark:text-blue-500 hover:underline">Delete</a>
                                                            </td>
                                                            <%}%>
                                                      </tr>
                                                </tbody>
                                          </table>
                                    </div>
                              </div>
                        </div>
                  </div> 
            </div>
            <div class="w-full rounded-lg ">
                  <!-- Main modal -->
                  <div id="authentication-modal4" aria-hidden="true" class="hidden overflow-x-hidden overflow-y-auto fixed  md:h-full top-4 left-0 right-0 md:inset-0 z-50 justify-center items-center">
                        <div class="relative w-full px-4 h-screen">
                              <!-- Modal content -->
                              <div class="bg-white rounded-md rounded-lg shadow relative dark:bg-gray-700 ">
                                    <div class="flex justify-end p-4">
                                          <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-800 dark:hover:text-white" data-modal-toggle="authentication-modal4">
                                                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>  
                                          </button>
                                    </div>

                                    <div class="overflow-x-auto relative shadow-md sm:rounded-lg">
                                          <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
                                                <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                                                      <tr>
                                                            <th scope="col" class="py-3 px-6">
                                                                  Id
                                                            </th>
                                                            <th scope="col" class="py-3 px-6">
                                                                  UserId
                                                            </th>
                                                            <th scope="col" class="py-3 px-6">
                                                                  Student Name
                                                            </th>
                                                            <th scope="col" class="py-3 px-6">
                                                                  Qualification
                                                            </th>
                                                            <th scope="col" class="py-3 px-6">
                                                                  Address
                                                            </th>
                                                            <th scope="col" class="py-3 px-6">
                                                                  Gender
                                                            </th>
                                                            <th scope="col" class="py-3 px-6">
                                                                  Contact
                                                            </th>
                                                            <th scope="col" class="py-3 px-6">
                                                                  City
                                                            </th>
                                                            <th scope="col" class="py-3 px-6">
                                                                  PassWord
                                                            </th>
                                                            <th scope="col" class="py-3 px-6">
                                                                  Action
                                                            </th>
                                                            <th scope="col" class="py-3 px-6">
                                                                  Action
                                                            </th>
                                                      </tr>
                                                </thead>
                                                <% userDao da = new userDao(ConnectionProvider.getConnection());
                                                      List<user> list2 = da.getAllStudent();
                                                      for (user elem2 : list2) {
                                                %>
                                                <tbody>
                                                      <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
                                                            <th scope="row" class="py-4 px-6 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                                                                  <%=elem2.getId()%>
                                                            </th>
                                                            <td class="py-4 px-6">
                                                                  <%=elem2.getUserId()%>
                                                            </td>
                                                            <td class="py-4 px-6">
                                                                  <%=elem2.getStudentName()%>
                                                            </td>
                                                            <td class="py-4 px-6">
                                                                  <%=elem2.getQualification()%>
                                                            </td>
                                                            <td class="py-4 px-6">
                                                                  <%=elem2.getAddress()%>
                                                            </td>
                                                            <td class="py-4 px-6">
                                                                  <%=elem2.getGender()%>
                                                            </td>
                                                            <td class="py-4 px-6">
                                                                  <%=elem2.getContact()%>
                                                            </td>
                                                            <td class="py-4 px-6">
                                                                  <%=elem2.getCity()%>
                                                            </td>
                                                            <td class="py-4 px-6">
                                                                  <%=elem2.getPassword()%>
                                                            </td>
                                                            <td class="py-4 px-6">
                                                                  <a href="editStudentbyAdmin.jsp?userId=<%=elem2.getUserId()%>" class="font-medium text-blue-600 dark:text-blue-500 hover:underline">Edit</a>
                                                            </td>
                                                            <td class="py-4 px-6">
                                                                  <a href="deleteStudent?userId=<%=elem2.getUserId()%>" class="font-medium text-blue-600 dark:text-blue-500 hover:underline">Delete</a>
                                                            </td>
                                                      </tr>                                                    
                                                </tbody>    
                                                <%}%>
                                          </table>
                                    </div>
                              </div>
                        </div>
                  </div> 
            </div>
            <script src="https://unpkg.com/@themesberg/flowbite@1.2.0/dist/flowbite.bundle.js"></script>
            <!--Forgot PassWord--> 
            <!-- component -->
            <link rel="stylesheet" href="https://unpkg.com/@themesberg/flowbite@1.2.0/dist/flowbite.min.css" />
            <!-- This is an example component -->
            <div class="max-w-2xl mx-auto">
                  <!-- Main modal -->
                  <div id="authentication-modal5" aria-hidden="true" class="hidden overflow-x-hidden overflow-y-auto fixed h-modal md:h-full top-4 left-0 right-0 md:inset-0 z-50 justify-center items-center">
                        <div class="relative w-full max-w-md px-4 h-full md:h-auto">
                              <!-- Modal content -->
                              <div class="bg-white rounded-lg shadow relative dark:bg-gray-700">
                                    <div class="flex justify-end p-2">
                                          <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-800 dark:hover:text-white" data-modal-toggle="authentication-modal5">
                                                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>  
                                          </button>
                                    </div>
                                    <form class="space-y-6 px-6 lg:px-8 pb-4 sm:pb-6 xl:pb-8" action="changePass" method="post">
                                           <form action="adminloginServlet" method="post" class="mt-4">
                                                          <%      
                                                         Message m2 =  (Message) session.getAttribute("msg2");
                                                         if(m2!=null){
                                                          %>
                                                          <div class="<%= m2.getCssClass() %>" role="alert">
                                                                  <%=  m2.getContent()  %>
                                                      </div>
                                                          <%
                                                                session.removeAttribute("msg2");
                                                            }
                                                            
                                                      %>
                                          <h3 class="text-xl font-medium text-gray-900 dark:text-white">Forgot Password Online Exam</h3>
                                          <div>
                                                <label for="email"  class="text-sm font-medium text-gray-900 block mb-2 dark:text-gray-300">Your email</label>
                                                <input type="email" name="email" id="email" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white" placeholder="name@company.com" required="">
                                          </div>
                                                  <div>
                                                <label for="password" class="text-sm font-medium text-gray-900 block mb-2 dark:text-gray-300">Old Password</label>
                                                <input type="password" name="oldPass" id="password" placeholder="••••••••" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white" required="">
                                          </div>
                                          <div>
                                                <label for="password" class="text-sm font-medium text-gray-900 block mb-2 dark:text-gray-300">New Password</label>
                                                <input type="password" name="newPass" id="password" placeholder="••••••••" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white" required="">
                                          </div>
                                              <div>
                                                <label for="password" class="text-sm font-medium text-gray-900 block mb-2 dark:text-gray-300">Confirm Password</label>
                                                <input type="password" name="conPass" id="password" placeholder="••••••••" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white" required="">
                                          </div>                         
                                          <button type="submit" class="w-full text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Reset Password your account</button>                                    
                                    </form>
                              </div>
                        </div>
                  </div> 
            </div>
            <!--End Of Forgot PassWord--> 
            <%@include file="allIncludeFooter.jsp" %>
            <script>
                        $(document).ready(function (e) {
                              $("#add_post_form").on("submit", function (event) {
                                    //this code gets called when form is submitted
                                    event.preventDefault();
                                    let form = new FormData(this);
                                    // Now Request to server
                                    $.ajax({
                                          url: "addQuestionServlet",
                                          type: 'POST',
                                          data: form,
                                          success: function (data, textStatus, jqXHR) {
                                                console.log(data);
                                                if (data.trim() === 'done') {
                                                      swal("Good job!", "Post Saved Successfully", "success");
                                                } else {
                                                      swal("Erro!!", "Something Went Wrong Try Again!", "error");
                                                }
                                          },
                                          error: function (jqXHR, textStatus, errorThrown) {
                                                swal("Erro!!", "Something Went Wrong Try Again!", "error");
                                          },
                                          processData: false,
                                          contentType: false
                                    });
                              });
                        });
            </script>
      </body>
</html>
