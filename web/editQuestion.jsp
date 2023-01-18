<%-- 
    Document   : editQuestion
    Created on : Oct 20, 2022, 12:40:01 AM
    Author     : kausar
--%>
<%@page import="com.examOnline.Entities.Message"%>
<%@page import="com.examOnline.Entities.adminLogin"%>
<%@page import="com.examOnline.Entities.addQuestion"%>
<%@page import="com.examOnline.UserDao.questionDao"%>
<%@page import="com.examOnline.helper.ConnectionProvider"%>
<% Integer qid = Integer.parseInt(request.getParameter("qid"));
      questionDao dao = new questionDao(ConnectionProvider.getConnection());
      addQuestion q = dao.getSingleQuestionByQuesId(qid);
%>
<%
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
            <title>JSP Page</title>
      </head>
      <body>
            <%@include file="nabvaradmin.jsp" %>
                  <div class="mx-4 mb-4 flex items-center justify-center mt-4">
                        <!-- Modal content -->
                        <div class="bg-gradient-to-r from-yellow-400 via-gray-50 to-teal-300 rounded-md ">
                              <div class="flex justify-center items-center">
                                    <div class="text-2xl font-bold ">
                                          Add Question Online Exam
                                    </div>
                              </div>
                              <form method="POST" action="updateQuestion" id="add_post_form">     
                                            <%
                                                Message m = (Message) session.getAttribute("msg");
                                                if (m != null) {
                                          %>
                                          <div class="<%= m.getCssClass()%>" role="alert">
                                                <%=  m.getContent()%>
                                          </div>
                                          <%
                                                      session.removeAttribute("msg");
                                                }

                                          %>
                                    <div class="w-96 mx-auto mx-4">
                                          <div class="mb-1">
                                                <label for="default-input" class="block mb-1 text-2xl font-bold text-gray-900 dark:text-gray-300">Question ID</label>
                                                <input type="number" id="default-input" required name="quId" value="<%=q.getQid()%>" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                                          </div>
                                          <div class="mb-1">
                                                <label for="default-input" class="block mb-1 text-2xl font-bold text-gray-900 dark:text-gray-300">Question</label>
                                                <input type="text" id="default-input" required name="question" value="<%=q.getQuestion()%>" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                                          </div>
                                          <div class="mb-1">
                                                <label for="default-input" class="block mb-1 text-xl font-medium text-gray-900 dark:text-gray-300">Option 1</label>
                                                <input type="text" id="default-input" name="opt1" required value="<%=q.getOption1()%>" class=" bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                                          </div>
                                          <div class="mb-1">
                                                <label for="default-input" class="block mb-1 text-xl font-medium text-gray-900 dark:text-gray-300">Option 2</label>
                                                <input type="text" id="default-input" name="opt2" value="<%=q.getOption2()%>" required class=" bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                                          </div>
                                          <div class="mb-1">
                                                <label for="default-input" class="block mb-1 text-xl font-medium text-gray-900 dark:text-gray-300">Option 3</label>
                                                <input type="text" id="default-input" name="opt3" value="<%=q.getOption3()%>" required class=" bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                                          </div>
                                          <div class="mb-1">
                                                <label for="default-input" class="block mb-1 text-xl font-medium text-gray-900 dark:text-gray-300">Option 4</label>
                                                <input type="text" id="default-input" name="opt4" value="<%=q.getOption4()%>" required class=" bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                                          </div>
                                          <div class="mb-4">
                                                <label for="default-input" class="block mb-1 text-xl font-medium text-gray-900 dark:text-gray-300">Answer</label>
                                                <input type="text" id="default-input" name="ans" value="<%=q.getAns()%>" required class="  bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                                          </div> 
                                          <button type="submit" role="submit" class=" w-full text-white bg-gradient-to-r from-purple-500 via-purple-600 to-purple-700 hover:bg-gradient-to-br focus:ring-4 focus:outline-none focus:ring-purple-300 dark:focus:ring-purple-800 font-medium rounded-lg text-sm px-5 py-2.5 text-center mr-2 mb-2">Submit Question</button>
                                    </div>
                              </form>
                        </div>
                  </div>
            </div> 
            <%@include file="allIncludeFooter.jsp" %>
<!--             <script>
                        $(document).ready(function (e) {
                              $("#add_post_form").on("submit", function (event) {
                                    //this code gets called when form is submitted
                                    event.preventDefault();
                                    let form = new FormData(this);
                                    // Now Request to server
                                    $.ajax({
                                          url: "updateQuestion",
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
            </script>-->
      </body>
</html>
