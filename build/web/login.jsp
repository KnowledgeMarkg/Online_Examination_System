<%-- 
    Document   : login
    Created on : Oct 15, 2022, 1:44:10 PM
    Author     : kausar
--%>

<%@page import="com.examOnline.Entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
      <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link href="https://unpkg.com/@material-tailwind/html@latest/styles/material-tailwind.css" rel="stylesheet"/>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
            <title>Login Page Of Student</title>
      </head>
      <body>
            <%@include file="navbar.jsp" %>
            <div class="min-h-screen bg-[conic-gradient(at_bottom_left,_var(--tw-gradient-stops))] from-fuchsia-300 via-green-400 to-rose-700 py-6 flex flex-col justify-center sm:py-12">
                  <div class="relative py-3 sm:max-w-xl sm:mx-auto">
                        <div
                              class="absolute inset-0 bg-gradient-to-r from-blue-300 to-blue-600 shadow-lg transform -skew-y-6 sm:skew-y-0 sm:-rotate-6 sm:rounded-3xl">
                        </div>
                        <div class="relative px-4 py-10 bg-white shadow-lg sm:rounded-3xl sm:p-20">
                              <div class="max-w-md mx-auto">
                                    <div>
                                          <h1 class="text-2xl font-semibold">Login Form For Student</h1>
                                    </div>
                                    <form action="loginServlet" method="post" class="mt-6">
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
                                          <div class="divide-y divide-gray-200">
                                                <div class="py-8 text-base leading-6 space-y-4 text-gray-700 sm:text-lg sm:leading-7">
                                                      <div class="relative">
                                                            <input autocomplete="off" id="email" required name="email" type="text" class="peer placeholder-transparent h-10 w-full border-b-2 border-gray-300 text-gray-900 focus:outline-none focus:borer-rose-600" placeholder="Email address" />
                                                            <label for="email" class="absolute left-0 -top-3.5 text-gray-600 text-sm peer-placeholder-shown:text-base peer-placeholder-shown:text-gray-440 peer-placeholder-shown:top-2 transition-all peer-focus:-top-3.5 peer-focus:text-gray-600 peer-focus:text-sm">Email Address</label>
                                                      </div>
                                                      <div class="relative">
                                                            <input autocomplete="off" id="password" required name="password" type="password" class="peer placeholder-transparent h-10 w-full border-b-2 border-gray-300 text-gray-900 focus:outline-none focus:borer-rose-600" placeholder="Password" />
                                                            <label for="password" class="absolute left-0 -top-3.5 text-gray-600 text-sm peer-placeholder-shown:text-base peer-placeholder-shown:text-gray-440 peer-placeholder-shown:top-2 transition-all peer-focus:-top-3.5 peer-focus:text-gray-600 peer-focus:text-sm">Password</label>
                                                      </div>
                                                      <div class="relative">
                                                            <button type="submit" class="bg-blue-500 text-white rounded-md px-2 py-1">Submit</button>
                                                      </div>
                                                </div>
                                          </div>
                                    </form>
                              </div>
                        </div>
                  </div>
            </div>
            <%@include file="footer.jsp" %>
            <script src="https://cdn.tailwindcss.com"></script>
            <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
