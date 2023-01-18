<%-- 
    Document   : questionList
    Created on : Oct 19, 2022, 3:23:10 PM
    Author     : kausar
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.examOnline.Entities.addQuestion"%>
<%@page import="com.examOnline.UserDao.questionDao"%>
<%@page import="com.examOnline.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
      <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link href="https://unpkg.com/@material-tailwind/html@latest/styles/material-tailwind.css" rel="stylesheet"/>
            <link rel="stylesheet" href="https://unpkg.com/flowbite@1.5.3/dist/flowbite.min.css" />
            <title>Question List</title>
      </head>
      <body>
            <nav class="bg-gradient-to-t from-violet-300 to-violet-400 border-gray-200 px-2 sm:px-4 py-2.5 rounded dark:bg-gray-900">
                  <div class="container flex flex-wrap justify-between items-center mx-auto">
                        <a href="https://flowbite.com/" class="flex items-center">
                              <img src="https://flowbite.com/docs/images/logo.svg" class="mr-8 h-6 sm:h-12 " alt="Flowbite Logo">
                              <span class="self-center text-2xl font-semibold whitespace-nowrap dark:text-white outline-dotted outline-4 outline-offset-4 rounded outline-blue-500 hover:outline-blue-900 hover:text-white">Online Exam</span>
                        </a>
                        <button data-collapse-toggle="navbar-default" type="button" class="inline-flex items-center p-2 ml-3 text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600" aria-controls="navbar-default" aria-expanded="false">
                              <span class="sr-only">Open main menu</span>
                              <svg class="w-6 h-6" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z" clip-rule="evenodd"></path></svg>
                        </button>
                        <div class="hidden w-full md:block md:w-auto" id="navbar-default">
                              <ul class="flex flex-col p-4 mt-4 bg-gray-50 rounded-lg border border-gray-100 md:flex-row md:space-x-8 md:mt-0 md:text-sm md:font-medium md:border-0 md:bg-white dark:bg-gray-800 md:dark:bg-gray-900 dark:border-gray-700">
                                    <li>
                                          <a href="#" class="block py-2 pr-3 pl-3 text-white bg-blue-700 rounded md:bg-transparent md:text-blue-700 md:p-0 dark:text-white" aria-current="page"> Student List</a>
                                    </li>
                                    <li>
                                          <a href="#" class="block py-2 pr-3 pl-3 text-gray-700 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-gray-400 md:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">Update Student</a>
                                    </li>
                                    <li>
                                          <a type="button" data-modal-toggle="authentication-modal" id="btn2" class="cursor-pointer block py-2 pr-3 pl-3 text-gray-700 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-gray-400 md:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">Add Questions</a>
                                    </li>
                                    <li>
                                          <a href="questionList.jsp" class="block py-2 pr-3 pl-3 text-gray-700 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-gray-400 md:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">Question List</a>
                                    </li>
                                    <li>
                                          <a type="button" data-modal-toggle="authentication-modal2" id="btn1" class="cursor-pointer block py-2 pr-3 pl-3 text-gray-700 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-gray-400 md:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">Update Question</a>
                                    </li>
                                    <li>
                                          <a href="#" class="block py-2 pr-3 pl-3 text-gray-700 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-gray-400 md:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">Result</a>
                                    </li>
                                    <li>
                                          <a href="#" class="block py-2 pr-4 pl-3 text-gray-700 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-gray-400 md:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">View Feedback</a>
                                    </li>
                                    <li>
                                          <a href="#" class="block py-2 pr-4 pl-3 text-gray-700 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-gray-400 md:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">Logout</a>
                                    </li>
                                    <li>
                                          <a href="#" class="block py-2 pr-4 pl-3 text-gray-700 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-gray-400 md:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">Change Password</a>
                                    </li>
                              </ul>
                        </div>
                  </div>
            </nav>
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
                        <%
                              questionDao dao = new questionDao(ConnectionProvider.getConnection());
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
                                          <a href="#?name=<%= elem.getQid()%>" class="font-medium text-blue-600 dark:text-blue-500 hover:underline">Edit</a>
                                    </td>
                                    <td class="py-4 px-6 text-right">
                                          <a href="#" class="font-medium text-blue-600 dark:text-blue-500 hover:underline">Delete</a>
                                    </td>
                                    <%}%>
                              </tr>

                        </tbody>
                  </table>
            </div>


            <script src="https://cdn.tailwindcss.com"></script>
            <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
            <script src="https://unpkg.com/flowbite@1.5.3/dist/flowbite.js"></script>
      </body>
</html>
