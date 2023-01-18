<%-- 
    Document   : StudentLogin
    Created on : Oct 17, 2022, 1:32:13 AM
    Author     : kausar
--%>

<%@page import="com.examOnline.Entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.examOnline.Entities.user"%>
<%@page errorPage="error_page.jsp" %>
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
            <link href="https://unpkg.com/@material-tailwind/html@latest/styles/material-tailwind.css" rel="stylesheet"/>
            <title>Student Online EXam Page</title>
      </head>
      <!-- component -->
      <body >
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
                                          <a type="button" data-modal-toggle="authentication-modal7" class="cursor-pointer py-5 px-3 text-white hover:text-gray-900">FeedBack</a>
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
                        <a type="button" data-modal-toggle="authentication-modal7" class="cursor-pointer block py-2 px-3 text-2xl text-white hover:text-gray-900">FeedBack</a>
                        <a href="#" class="block py-2 px-3 mb-4 text-2xl text-white hover:text-gray-900">Exam</a>
                        <a  onclick="document.getElementById('myModal').showModal()" id="btn" class="cursor-pointer py-2 px-3 mr-4 mx-2 text-2xl bg-yellow-400 hover:bg-yellow-300 text-yellow-900 hover:text-yellow-800 rounded transition duration-300"><%=User.getStudentName()%></a>
                        <a onclick="document.getElementById('myModal2').showModal()" id="btn" class="cursor-pointer py-2 px-3 text-2xl bg-yellow-400 hover:bg-yellow-300 text-yellow-900 hover:text-yellow-800 rounded transition duration-300">Update Profile</a>
                  </div>
            </nav>

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
            <%                           Message m2 = (Message) session.getAttribute("msg2");
                  if (m2 != null) {
            %>
            <div class="<%= m2.getCssClass()%>" role="alert">
                  <%=  m2.getContent()%>
            </div>
            <%
                        session.removeAttribute("msg2");
                  }

            %>
            <!-- content goes here -->
            <div class="w-full h-screen lg:h-full rounded-lg text-center bg-gradient-to-r from-sky-400 via-rose-400 to-lime-400">
                  <section class="dark:bg-gray-800 dark:text-gray-100">
                        <div class="container flex flex-col justify-center p-2 mx-auto sm:py-4 lg:py-4 lg:flex-row lg:justify-between">
                              <div class="flex justify-center lg:mx-auto pl-22 p-2 mt-2 lg:mt-0 h-72 sm:h-80 lg:h-96 xl:h-112 2xl:h-128">
                                    <img src="img/Business_SVG.svg" alt="" class="object-contain h-72 sm:h-80 lg:h-96 xl:h-112 2xl:h-128">
                              </div>
                              <div class="flex flex-col justify-center text-center rounded-sm lg:max-w-md xl:max-w-lg lg:text-left">
                                    <p class="mt-2 text-lg font-bold text-red-900 ">«For Teachers by Teachers»</p>
                                    <h1 class="text-2xl font-bold leading-none sm:text-6xl">Simply
                                          <span class="dark:text-violet-400">Powerful</span>Online Exams
                                    </h1>
                                    <p class="mt-6 mb-4 lg:mb-8 text-lg sm:mb-12">Feel confident conducting secure digital exams on this Website made by teachers 
                                          <br class="hidden md:inline lg:hidden"> who understand the realities of the classroom.
                                    </p>
                                    <div class="flex flex-col space-y-4 sm:items-center sm:justify-center sm:flex-row sm:space-y-0 sm:space-x-4 lg:justify-start">
                                          <a class="inline-block rounded bg-indigo-600 px-4 py-2 lg:px-8 lg:py-3 text-2xl font-medium text-white transition hover:rotate-2 hover:scale-110 focus:outline-none focus:ring active:bg-indigo-500" href="signUp.jsp" >
                                                Profile
                                          </a>
                                          <a class="group relative inline-block overflow-hidden border border-indigo-600 px-4 py-2  lg:px-8 lg:py-3 focus:outline-none focus:ring"href="/download" >
                                                <span class="absolute inset-y-0 right-0 w-[2px] bg-indigo-600 transition-all group-hover:w-full group-active:bg-indigo-500"></span>
                                                <span class="relative text-2xl font-medium text-indigo-600 transition-colors group-hover:text-white"  >
                                                      Update Profile
                                                </span>
                                          </a>
                                    </div>
                              </div>
                        </div>
                  </section>
            </div>
            <div class="inline-flex justify-center items-center w-full">
                  <hr class="my-8 w-64 h-1 bg-green-600 rounded border-0 ">
                  <div class="absolute left-1/2 px-4 bg-white -translate-x-1/2 dark:bg-gray-900">
                        <svg aria-hidden="true" class="w-5 h-5 text-green-700 dark:text-gray-300" viewBox="0 0 24 27" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M14.017 18L14.017 10.609C14.017 4.905 17.748 1.039 23 0L23.995 2.151C21.563 3.068 20 5.789 20 8H24V18H14.017ZM0 18V10.609C0 4.905 3.748 1.038 9 0L9.996 2.151C7.563 3.068 6 5.789 6 8H9.983L9.983 18L0 18Z" fill="currentColor"/></svg>
                  </div>
            </div>
            <!--Feedback Section-->
            <link rel="stylesheet" href="https://unpkg.com/@themesberg/flowbite@1.2.0/dist/flowbite.min.css" />
            <!-- This is an example component -->
            <div class="max-w-2xl mx-auto">
                  <!-- Main modal -->
                  <div id="authentication-modal7" aria-hidden="true" class="hidden overflow-x-hidden overflow-y-auto fixed h-modal md:h-full top-4 left-0 right-0 md:inset-0 z-50 justify-center items-center">
                        <div class="relative w-full max-w-md px-4 h-full md:h-auto">
                              <!-- Modal content -->
                              <div class="bg-white rounded-lg shadow relative dark:bg-gray-700">
                                    <div class="flex justify-end p-2">
                                          <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-800 dark:hover:text-white" data-modal-toggle="authentication-modal7">
                                                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>  
                                          </button>
                                    </div>
                                    <form class="space-y-6 px-6 lg:px-8 pb-4 sm:pb-6 xl:pb-8" action="changePass" method="post">
                                          <form action="" method="post" class="mt-4">
                                                <h3 class="text-xl font-medium text-gray-900 dark:text-white">FeedBack Form</h3>
                                                <div>
                                                      <label for="email"  class="text-sm font-medium text-gray-900 block mb-2 dark:text-gray-300">Your email</label>
                                                      <input type="email" name="email" id="email" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white" placeholder="name@company.com" required="">
                                                </div>
                                                <div>
                                                      <label for="date" class="text-sm font-medium text-gray-900 block mb-2 dark:text-gray-300">date</label>
                                                      <input type="date" name="date" id="password"  class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white" required="">
                                                </div>
                                                <div>
                                                      <label for="text" class="text-sm font-medium text-gray-900 block mb-2 dark:text-gray-300">FeedBack Subject</label>
                                                      <input type="text" name="conPass" id="text" placeholder="Feedback Subject" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white" required="">
                                                </div>  
                                                <div>
                                                      <label for="message" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-400">Your message</label>
                                                      <textarea id="message" rows="4" class="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="Your message..."></textarea>
                                                </div>  
                                                <button type="submit" class="w-full text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Post FeedBack</button>                                    
                                          </form>
                              </div>
                        </div>
                  </div> 
            </div>
            <script src="https://unpkg.com/@themesberg/flowbite@1.2.0/dist/flowbite.bundle.js"></script>
            <!--End Of feedback Section-->
            <section class="bg-white dark:bg-gray-900">
                  <div class="container px-6 py-12 mx-auto">
                        <div class="grid grid-cols-1 gap-8 md:grid-cols-2 lg:grid-cols-3">
                              <div>
                                    <svg class="w-8 h-8" viewBox="0 0 30 30" fill="none">
                                    <path d="M29.6931 14.2283L22.7556 6.87823C22.3292 6.426 21.6175 6.40538 21.1652 6.83212C20.7137 7.25851 20.6927 7.9706 21.1195 8.42248L27.3284 15L21.1195 21.5783C20.6927 22.0302 20.7137 22.7419 21.1652 23.1687C21.3827 23.3738 21.6606 23.4754 21.9374 23.4754C22.2363 23.4754 22.5348 23.3569 22.7557 23.1233L29.6932 15.7729C30.1022 15.339 30.1023 14.6618 29.6931 14.2283Z" fill="#2D3748"/><path d="M8.88087 21.578L2.67236 15L8.88087 8.42215C9.30726 7.97028 9.28664 7.25812 8.83476 6.83179C8.38323 6.4054 7.67073 6.42603 7.2444 6.87791L0.306858 14.2279C-0.102245 14.6614 -0.102245 15.3391 0.306858 15.7726L7.24475 23.123C7.466 23.3574 7.76413 23.4755 8.06302 23.4755C8.33976 23.4755 8.61767 23.3735 8.83476 23.1684C9.28705 22.742 9.30726 22.0299 8.88087 21.578Z" fill="#2D3748"/><path d="M16.8201 3.08774C16.2062 2.99476 15.6317 3.41622 15.5379 4.03011L12.2379 25.6302C12.1441 26.2445 12.566 26.8186 13.1803 26.9124C13.238 26.921 13.295 26.9252 13.3516 26.9252C13.898 26.9252 14.3773 26.5266 14.4624 25.97L17.7624 4.3699C17.8562 3.7556 17.4343 3.1815 16.8201 3.08774Z" fill="#4299E1"/>
                                    </svg>
                                    <h1 class="mt-4 text-xl font-semibold text-gray-800 dark:text-white">Everything you need</h1>
                                    <p class="mt-2 text-gray-500 dark:text-gray-400">Create comprehensive exams with powerful tools that are easy to use and quick to apply.</p>
                              </div>
                              <div>
                                    <svg class="w-8 h-8" viewBox="0 0 30 30" fill="none">
                                    <path d="M27.3633 7.08984H26.4844V6.21094C26.4844 4.75705 25.3015 3.57422 23.8477 3.57422H4.39453C2.94064 3.57422 1.75781 4.75705 1.75781 6.21094V21.1523H0.878906C0.393516 21.1523 0 21.5459 0 22.0312V23.7891C0 25.2429 1.18283 26.4258 2.63672 26.4258H27.3633C28.8172 26.4258 30 25.2429 30 23.7891V9.72656C30 8.27268 28.8172 7.08984 27.3633 7.08984ZM3.51562 6.21094C3.51562 5.72631 3.9099 5.33203 4.39453 5.33203H23.8477C24.3323 5.33203 24.7266 5.72631 24.7266 6.21094V7.08984H20.332C18.8781 7.08984 17.6953 8.27268 17.6953 9.72656V21.1523H3.51562V6.21094ZM1.75781 23.7891V22.9102H17.6953V23.7891C17.6953 24.0971 17.7489 24.3929 17.8465 24.668H2.63672C2.15209 24.668 1.75781 24.2737 1.75781 23.7891ZM28.2422 23.7891C28.2422 24.2737 27.8479 24.668 27.3633 24.668H20.332C19.8474 24.668 19.4531 24.2737 19.4531 23.7891V9.72656C19.4531 9.24193 19.8474 8.84766 20.332 8.84766H27.3633C27.8479 8.84766 28.2422 9.24193 28.2422 9.72656V23.7891Z" fill="#2D3748"/><path d="M24.7266 21.1523H22.9688C22.4834 21.1523 22.0898 21.5459 22.0898 22.0312C22.0898 22.5166 22.4834 22.9102 22.9688 22.9102H24.7266C25.212 22.9102 25.6055 22.5166 25.6055 22.0312C25.6055 21.5459 25.212 21.1523 24.7266 21.1523Z" fill="#4299E1"/><path d="M23.8477 12.3633C24.3331 12.3633 24.7266 11.9698 24.7266 11.4844C24.7266 10.999 24.3331 10.6055 23.8477 10.6055C23.3622 10.6055 22.9688 10.999 22.9688 11.4844C22.9688 11.9698 23.3622 12.3633 23.8477 12.3633Z" fill="#4299E1"/>
                                    </svg>
                                    <h1 class="mt-4 text-xl font-semibold text-gray-800 dark:text-white">Make it simple</h1>
                                    <p class="mt-2 text-gray-500 dark:text-gray-400">Conduct exams with confidence and control thanks to our intuitive software that simplifies technical complexity.</p>
                              </div>
                              <div>
                                    <svg class="w-8 h-8" viewBox="0 0 30 30" fill="none">
                                    <g clip-path="url(#clip0)"><path d="M26.599 4.339a1.875 1.875 0 11-3.75 0 1.875 1.875 0 013.75 0zM7.151 25.661a1.875 1.875 0 11-3.75 0 1.875 1.875 0 013.75 0zM23.486 13.163a8.636 8.636 0 00-1.19-2.873l1.123-1.123-2.592-2.59L19.705 7.7a8.636 8.636 0 00-2.873-1.19V4.921h-3.664v1.586a8.634 8.634 0 00-2.873 1.19l-1.122-1.12-2.592 2.589 1.123 1.123a8.636 8.636 0 00-1.19 2.873H4.922l-.002 3.663h1.592A8.626 8.626 0 007.704 19.7l-1.127 1.127 2.59 2.591 1.128-1.127a8.623 8.623 0 002.873 1.19v1.597h3.664v-1.597a8.628 8.628 0 002.873-1.19l1.128 1.128 2.59-2.592-1.127-1.127a8.627 8.627 0 001.19-2.873h1.593v-3.664h-1.593zM15 19.256a4.255 4.255 0 110-8.511 4.255 4.255 0 010 8.51z" fill="#4299E1"/><path d="M5.276 23.2c-.42 0-.823.105-1.182.302A13.853 13.853 0 011.172 15C1.172 7.375 7.375 1.172 15 1.172c.927 0 1.854.092 2.754.274a.586.586 0 00.232-1.149A15.111 15.111 0 0015 0C10.993 0 7.226 1.56 4.393 4.393A14.902 14.902 0 000 15c0 3.37 1.144 6.66 3.228 9.296-.268.4-.413.872-.413 1.365 0 .657.257 1.275.721 1.74a2.444 2.444 0 001.74.721c.658 0 1.276-.256 1.74-.721.465-.465.721-1.083.721-1.74s-.256-1.276-.72-1.74a2.445 2.445 0 00-1.74-.72zm.912 3.373a1.28 1.28 0 01-.912.377 1.28 1.28 0 01-.911-.377 1.28 1.28 0 01-.378-.912c0-.344.134-.668.378-.912a1.28 1.28 0 01.911-.377c.345 0 .668.134.912.378.243.243.377.567.377.911 0 .344-.134.668-.377.912zM26.772 5.703a2.465 2.465 0 00-.308-3.104 2.446 2.446 0 00-1.74-.721c-.658 0-1.276.256-1.74.72a2.445 2.445 0 00-.721 1.74c0 .658.256 1.276.72 1.741.465.465 1.083.72 1.74.72.42 0 .824-.104 1.183-.3A13.854 13.854 0 0128.828 15c0 7.625-6.203 13.828-13.828 13.828-.918 0-1.836-.09-2.728-.269a.586.586 0 00-.23 1.15c.968.193 1.963.291 2.958.291 4.007 0 7.773-1.56 10.607-4.393A14.902 14.902 0 0030 15c0-3.37-1.145-6.66-3.228-9.297zm-2.96-.452a1.28 1.28 0 01-.377-.912c0-.344.134-.668.377-.911a1.28 1.28 0 01.912-.378 1.29 1.29 0 010 2.578 1.28 1.28 0 01-.912-.377z" fill="#2D3748"/><path d="M12.582 25.078c0 .324.263.586.586.586h3.664a.586.586 0 00.586-.586v-1.136a9.179 9.179 0 002.199-.911l.802.802a.586.586 0 00.829 0l2.59-2.592a.586.586 0 000-.828l-.802-.802a9.169 9.169 0 00.911-2.199h1.132a.586.586 0 00.586-.585v-3.664a.586.586 0 00-.586-.586h-1.132a9.17 9.17 0 00-.911-2.199l.797-.797a.587.587 0 000-.829l-2.592-2.59a.586.586 0 00-.829 0l-.795.797a9.177 9.177 0 00-2.2-.912V4.922a.586.586 0 00-.585-.586h-3.664a.586.586 0 00-.586.586v1.126a9.169 9.169 0 00-2.199.91l-.796-.795a.586.586 0 00-.828 0l-2.592 2.59a.585.585 0 000 .828l.797.797a9.173 9.173 0 00-.911 2.199h-1.13a.586.586 0 00-.586.585l-.002 3.664a.585.585 0 00.586.586h1.132c.207.77.512 1.507.911 2.2l-.801.8a.586.586 0 000 .83l2.59 2.59a.586.586 0 00.829 0l.801-.801a9.185 9.185 0 002.2.911v1.136zm-1.97-3.28a.586.586 0 00-.732.078l-.713.714-1.761-1.763.712-.713a.586.586 0 00.078-.732 8.02 8.02 0 01-1.11-2.679.586.586 0 00-.572-.462H5.507l.002-2.492h1.005a.586.586 0 00.572-.463 8.022 8.022 0 011.11-2.678.586.586 0 00-.078-.733l-.708-.708 1.763-1.761.707.707c.196.196.5.228.733.078a8.016 8.016 0 012.678-1.11.586.586 0 00.463-.573v-1h2.492v1c0 .277.193.515.463.573a8.024 8.024 0 012.678 1.11c.232.15.537.118.732-.078l.708-.707 1.762 1.761-.708.708a.586.586 0 00-.078.732 8.027 8.027 0 011.11 2.679c.058.27.297.463.573.463h1.007v2.492h-1.007a.586.586 0 00-.573.462 8.02 8.02 0 01-1.11 2.679.586.586 0 00.078.732l.713.713-1.761 1.762-.714-.713a.586.586 0 00-.732-.078 8.027 8.027 0 01-2.678 1.11.586.586 0 00-.463.573v1.011h-2.492v-1.01a.586.586 0 00-.463-.574 8.021 8.021 0 01-2.678-1.11z" fill="#2D3748"/><path d="M19.841 15A4.847 4.847 0 0015 10.158 4.847 4.847 0 0010.158 15 4.847 4.847 0 0015 19.841 4.847 4.847 0 0019.841 15zm-8.51 0A3.674 3.674 0 0115 11.33 3.674 3.674 0 0118.67 15 3.674 3.674 0 0115 18.67 3.674 3.674 0 0111.33 15z" fill="#2D3748"/><path d="M20.395 2.216a.59.59 0 00.415-.172.593.593 0 00.171-.415.59.59 0 00-.586-.586.589.589 0 00-.586.586.589.589 0 00.586.587zM9.63 27.794a.59.59 0 00-.586.586.59.59 0 00.586.586.59.59 0 00.586-.586.59.59 0 00-.586-.585z" fill="#4299E1"/></g><defs><clipPath id="clip0"><path fill="#fff" d="M0 0h30v30H0z"/></clipPath></defs>
                                    </svg>
                                    <h1 class="mt-4 text-xl font-semibold text-gray-800 dark:text-white">Empower every studentt</h1>
                                    <p class="mt-2 text-gray-500 dark:text-gray-400">Customize exams to empower each student’s individual needs and let their knowledge shine.</p>
                              </div>
                        </div>
                  </div>
            </section>
            <div class="inline-flex justify-center items-center w-full">
                  <hr class="my-8 w-64 h-1 bg-green-600 rounded border-0 ">
                  <div class="absolute left-1/2 px-4 bg-white -translate-x-1/2 dark:bg-gray-900">
                        <svg aria-hidden="true" class="w-5 h-5 text-green-700 dark:text-gray-300" viewBox="0 0 24 27" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M14.017 18L14.017 10.609C14.017 4.905 17.748 1.039 23 0L23.995 2.151C21.563 3.068 20 5.789 20 8H24V18H14.017ZM0 18V10.609C0 4.905 3.748 1.038 9 0L9.996 2.151C7.563 3.068 6 5.789 6 8H9.983L9.983 18L0 18Z" fill="currentColor"/></svg>
                  </div>
            </div>
            <!--Frequently Ask question-->
            <section class="bg-white dark:bg-gray-900">
                  <div class="container px-6 py-12 mx-auto">
                        <h1 class="text-2xl font-semibold text-gray-800 lg:text-4xl dark:text-white">Frequently asked questions.</h1>
                        <div class="grid grid-cols-1 gap-8 mt-8 lg:mt-16 md:grid-cols-2 xl:grid-cols-3">
                              <div>
                                    <div class="inline-block p-3 text-white bg-blue-600 rounded-lg">
                                          <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8.228 9c.549-1.165 2.03-2 3.772-2 2.21 0 4 1.343 4 3 0 1.4-1.278 2.575-3.006 2.907-.542.104-.994.54-.994 1.093m0 3h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                                          </svg>
                                    </div>
                                    <div>
                                          <h1 class="text-xl font-semibold text-gray-700 dark:text-white">What are the minimum system requirements I need for online exams</h1>
                                          <p class="mt-2 text-sm text-gray-700 dark:text-gray-300">
                                                You will need a working webcam (preferably external) and microphone, and a stable internet 
                                                connection. You should take your written examination on either a desktop computer or laptop 
                                                – the TestReach system is compatible with both Apple and Windows operating systems
                                          </p>
                                    </div>
                              </div>
                              <div>
                                    <div class="inline-block p-3 text-white bg-blue-600 rounded-lg">
                                          <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8.228 9c.549-1.165 2.03-2 3.772-2 2.21 0 4 1.343 4 3 0 1.4-1.278 2.575-3.006 2.907-.542.104-.994.54-.994 1.093m0 3h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                                          </svg>
                                    </div>
                                    <div>
                                          <h1 class="text-xl font-semibold text-gray-700 dark:text-white">My internet connection at home is really poor. What other options do I have?</h1>
                                          <p class="mt-2 text-sm text-gray-700 dark:text-gray-300">
                                                If your internet connection is not reliable enough to take an examination, you can see if your 
                                                workplace has the facilities to take the examination there. If this is not possible, then we 
                                                suggest contacting a friend or family member who has a stable internet connection to allow 
                                                you to take the exam at their house.
                                          </p>
                                    </div>
                              </div>
                              <div>
                                    <div class="inline-block p-3 text-white bg-blue-600 rounded-lg">
                                          <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8.228 9c.549-1.165 2.03-2 3.772-2 2.21 0 4 1.343 4 3 0 1.4-1.278 2.575-3.006 2.907-.542.104-.994.54-.994 1.093m0 3h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                                          </svg>
                                    </div>
                                    <div>
                                          <h1 class="text-xl font-semibold text-gray-700 dark:text-white">How will you stop candidates from cheating?</h1>
                                          <p class="mt-2 text-sm text-gray-700 dark:text-gray-300">
                                                The TestReach system will lock down the device that you are using so that the only thing you 
                                                can access is your examination. The examinations are fully live-proctored via webcam and 
                                                microphone, so the proctors will be able to pick up on anything they think is suspicious and 
                                                directly communicate this to the candidate. 
                                          </p>
                                    </div>
                              </div>
                              <div>
                                    <div class="inline-block p-3 text-white bg-blue-600 rounded-lg">
                                          <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8.228 9c.549-1.165 2.03-2 3.772-2 2.21 0 4 1.343 4 3 0 1.4-1.278 2.575-3.006 2.907-.542.104-.994.54-.994 1.093m0 3h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                                          </svg>
                                    </div>
                                    <div>
                                          <h1 class="text-xl font-semibold text-gray-700 dark:text-white">What happens if I am late for the examination?</h1>
                                          <p class="mt-2 text-sm text-gray-700 dark:text-gray-300">
                                                For written examinations, if you are more than 30 minutes late you will not be able to sit. For 
                                                oral examinations, you may be allowed in after the start of your exam, but extra time will not 
                                                be added to compensate.
                                          </p>
                                    </div>
                              </div>
                              <div>
                                    <div class="inline-block p-3 text-white bg-blue-600 rounded-lg">
                                          <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8.228 9c.549-1.165 2.03-2 3.772-2 2.21 0 4 1.343 4 3 0 1.4-1.278 2.575-3.006 2.907-.542.104-.994.54-.994 1.093m0 3h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                                          </svg>
                                    </div>
                                    <div>
                                          <h1 class="text-xl font-semibold text-gray-700 dark:text-white">What internet speed do I need?</h1>
                                          <p class="mt-2 text-sm text-gray-700 dark:text-gray-300">
                                                TestReach have advised that a minimum of 516kbps connection speed is recommended. The 
                                                software has also been designed to handle fluctuating connection speeds. Any issues with a 
                                                candidate’s connection speed should be highlighted 
                                          </p>
                                    </div>
                              </div>
                              <div>
                                    <div class="inline-block p-3 text-white bg-blue-600 rounded-lg">
                                          <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8.228 9c.549-1.165 2.03-2 3.772-2 2.21 0 4 1.343 4 3 0 1.4-1.278 2.575-3.006 2.907-.542.104-.994.54-.994 1.093m0 3h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                                          </svg>
                                    </div>
                                    <div>
                                          <h1 class="text-xl font-semibold text-gray-700 dark:text-white">Can I use two screens during my exam?</h1>
                                          <p class="mt-2 text-sm text-gray-700 dark:text-gray-400">
                                                Yes, but any second screen will need to be a mirror of the main screen, and the invigilator will 
                                                need to be able to see both screens. Please be aware that candidates have had issues with 
                                                using two screens in the past and found it slowed down the app.

                                          </p>
                                    </div>
                              </div>
                        </div>
                  </div>
            </section>
            <div class="inline-flex justify-center items-center w-full">
                  <hr class="my-8 w-64 h-1 bg-green-600 rounded border-0 ">
                  <div class="absolute left-1/2 px-4 bg-white -translate-x-1/2 dark:bg-gray-900">
                        <svg aria-hidden="true" class="w-5 h-5 text-green-700 dark:text-gray-300" viewBox="0 0 24 27" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M14.017 18L14.017 10.609C14.017 4.905 17.748 1.039 23 0L23.995 2.151C21.563 3.068 20 5.789 20 8H24V18H14.017ZM0 18V10.609C0 4.905 3.748 1.038 9 0L9.996 2.151C7.563 3.068 6 5.789 6 8H9.983L9.983 18L0 18Z" fill="currentColor"/></svg>
                  </div>
            </div>
            <!--Features Of Online Exam--> 
            <div class="dark:bg-gray-800 dark:text-gray-100">
                  <div class="px-4 py-16 mx-auto max-w-7xl sm:px-6 lg:px-8">
                        <div class="max-w-3xl mx-auto text-center">
                              <h2 class="text-3xl font-extrabold sm:text-4xl">All the features you want</h2>
                              <p class="mt-4 text-lg dark:text-gray-400">An online exam is totally different from that of a webinar or lecture. It often gets hectic for institutions to manage the entire schedule while ensuring that the conducted examinations are absolutely cheat-proof.</p>
                        </div>
                        <dl class="mt-12 space-y-10 sm:space-y-0 sm:grid sm:grid-cols-2 sm:gap-x-6 sm:gap-y-12 lg:grid-cols-4 lg:gap-x-8">
                              <div class="flex">
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true" class="flex-shrink-0 w-6 h-6 dark:text-violet-400">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
                                    </svg>
                                    <div class="ml-3">
                                          <dt class="text-lg font-medium"> Automation Of Planning And Scheduling</dt>
                                          <dd class="mt-2 dark:text-gray-400">Online exam software should be capable enough to deal with the messy planning phase. It should be able to collect information from students via its online portal and set up a schedule, process student applications.</dd>
                                    </div>
                              </div>
                              <div class="flex">
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true" class="flex-shrink-0 w-6 h-6 dark:text-violet-400">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
                                    </svg>
                                    <div class="ml-3">
                                          <dt class="text-lg font-medium">Assessment Pattern Creation</dt>
                                          <dd class="mt-2 dark:text-gray-400">Assessment pattern creation is more of a technical term used for setting up subject-wise question papers. Online exam software should be able to process various question types, based on marks.</dd>
                                    </div>
                              </div>
                              <div class="flex">
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true" class="flex-shrink-0 w-6 h-6 dark:text-violet-400">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
                                    </svg>
                                    <div class="ml-3">
                                          <dt class="text-lg font-medium">Configuration Of Questions</dt>
                                          <dd class="mt-2 dark:text-gray-400">The software must be capable enough to help teachers set up multiple question patterns for any subject of their choice. Thus, including questions like multiple-choice, open-ended, quizzes, and more.</dd>
                                    </div>
                              </div>
                              <div class="flex">
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true" class="flex-shrink-0 w-6 h-6 dark:text-violet-400">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
                                    </svg>
                                    <div class="ml-3">
                                          <dt class="text-lg font-medium">Reports And Dashboard</dt>
                                          <dd class="mt-2 dark:text-gray-400">It should have the ability to produce different kinds of real-time reports for institutions. The method of representation plays a key factor, as it is seen that multimedia presentations turn out to be more appealing to individual users.</dd>
                                    </div>
                              </div>
                              <div class="flex">
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true" class="flex-shrink-0 w-6 h-6 dark:text-violet-400">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
                                    </svg>
                                    <div class="ml-3">
                                          <dt class="text-lg font-medium"> Automated Evaluation</dt>
                                          <dd class="mt-2 dark:text-gray-400">While going through papers submitted by individual students, teachers might be biased at times. Always look out for software involving various security stages, evaluator handling processes, and click-by-click audit mechanisms.</dd>
                                    </div>
                              </div>
                              <div class="flex">
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true" class="flex-shrink-0 w-6 h-6 dark:text-violet-400">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
                                    </svg>
                                    <div class="ml-3">
                                          <dt class="text-lg font-medium">Online Proctoring</dt>
                                          <dd class="mt-2 dark:text-gray-400">Look for online exam software that provides proper methods of surveillance over individual students. It must be able to detect misconduct showcased by individual students and send timely notifications to the controller.</dd>
                                    </div>
                              </div>
                              <div class="flex">
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true" class="flex-shrink-0 w-6 h-6 dark:text-violet-400">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
                                    </svg>
                                    <div class="ml-3">
                                          <dt class="text-lg font-medium">Transcript Generation</dt>
                                          <dd class="mt-2 dark:text-gray-400">Online exam software should be able to provide transcripts via automated calculations. Each transcript should be expertly managed by the software, including student information, marks obtained.</dd>
                                    </div>
                              </div>
                              <div class="flex">
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true" class="flex-shrink-0 w-6 h-6 dark:text-violet-400">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
                                    </svg>
                                    <div class="ml-3">
                                          <dt class="text-lg font-medium">Result Analysis and Dashboards</dt>
                                          <dd class="mt-2 dark:text-gray-400">Analyzing student’s progress and knowledge is important for schools to maintain their reputation. So once the exams are finished the complete inspections and analysis is done by the teachers as well as the administrators.</dd>
                                    </div>
                              </div>
                        </dl>
                  </div>
            </div>
            <!--End Of Online Exam Features--> 
            <div class="inline-flex justify-center items-center w-full">
                  <hr class="my-8 w-64 h-1 bg-green-600 rounded border-0 ">
                  <div class="absolute left-1/2 px-4 bg-white -translate-x-1/2 dark:bg-gray-900">
                        <svg aria-hidden="true" class="w-5 h-5 text-green-700 dark:text-gray-300" viewBox="0 0 24 27" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M14.017 18L14.017 10.609C14.017 4.905 17.748 1.039 23 0L23.995 2.151C21.563 3.068 20 5.789 20 8H24V18H14.017ZM0 18V10.609C0 4.905 3.748 1.038 9 0L9.996 2.151C7.563 3.068 6 5.789 6 8H9.983L9.983 18L0 18Z" fill="currentColor"/></svg>
                  </div>
            </div>

            <!--Student Profile And Edit-->
            <dialog id="myModal" class="h-auto w-11/12 md:w-2/5 lg:w-2/5 p-3 bg-gradient-to-r from-yellow-400 via-gray-50 to-teal-300 rounded-md  ">
                  <div class="flex flex-col w-full h-auto ">
                        <!-- Header -->
                        <div class="flex w-full h-auto justify-center items-center">
                              <div class="flex w-11/12 lg:w-8/12 h-auto py-4 justify-center items-center text-2xl font-bold ">
                                    Student Profile 
                              </div>
                              <div onclick="document.getElementById('myModal').close();" class="flex w-1/12 h-auto justify-center cursor-pointer">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                              </div>
                              <!--Header End-->
                        </div>
                        <!-- Modal Content-->
                        <div class="flex w-full h-auto py-4 px-2 justify-center items-center flex-col bg-radial from-amber-200 via-violet-600 to-sky-900 rounded text-center text-gray-500">
                              <img class="w-1/5 rounded-full h-auto align-middle" src="img/<%= User.getProfile()%>" alt=""/>
                              <h1 class="text-2xl text-center text-black font-bold mt-2 mb-2"> <%= User.getStudentName()%></h1>
                              <!--Table Data--> 
                              <div id="profile_details" class="overflow-hidden">
                                    <table class="min-w-full">
                                          <thead class=" lg:border-b">
                                                <tr class= lg:border-b transition duration-300 ease-in-out hover:bg-gray-100">
                                                      <th scope="col" class="text-lg font-bold text-green-600  lg:px-6 lg:py-2 text-left">
                                                            Gender
                                                      </th>
                                                      <td class="text-sm text-gray-900 font-bold px-6 py-2 whitespace-nowrap">
                                                            <%=User.getGender()%>
                                                      </td>
                                                </tr>
                                                <tr class= lg:border-b  transition duration-300 ease-in-out hover:bg-gray-100">
                                                      <th scope="col" class="text-lg font-bold text-green-600  lg:px-6 lg:py-2 text-left">
                                                            UserId
                                                      </th>
                                                      <td class=" whitespace-nowrap text-sm font-bold text-green-600"><%=User.getUserId()%></td>
                                                </tr>
                                                <tr class= lg:border-b transition duration-300 ease-in-out hover:bg-gray-100">
                                                      <th scope="col" class="text-lg font-bold text-green-600  lg:px-6 lg:py-2 text-left">
                                                            Qualification
                                                      </th>
                                                      <td class="text-sm text-gray-900 font-bold  whitespace-nowrap">
                                                            <%= User.getQualification()%>
                                                      </td>
                                                </tr>
                                                <tr class= lg:border-b transition duration-300 ease-in-out hover:bg-gray-100">
                                                      <th scope="col" class="text-lg font-bold text-green-600  lg:px-6 lg:py-2 text-left">
                                                            BirthDay
                                                      </th>
                                                      <td class="text-sm text-gray-900 font-bold  whitespace-nowrap">
                                                            <%= User.getDateBirth()%>
                                                      </td>
                                                </tr>
                                                <tr class= lg:border-b transition duration-300 ease-in-out hover:bg-gray-100">
                                                      <th scope="col" class="text-lg font-bold text-green-600  lg:px-6 lg:py-2 text-left">
                                                            Address
                                                      </th>
                                                      <td class="text-sm text-gray-900 font-bold px-6 py-4 whitespace-nowrap">
                                                            <%= User.getAddress()%>
                                                      </td>
                                                </tr>
                                                <tr class= lg:border-b transition duration-300 ease-in-out hover:bg-gray-100">
                                                      <th scope="col" class="text-lg font-bold text-green-600  lg:px-6 lg:py-2 text-left">
                                                            Gender
                                                      </th>
                                                      <td class="text-sm text-gray-900 font-bold px-6 py-2 whitespace-nowrap">
                                                            <%=User.getGender()%>
                                                      </td>
                                                </tr>
                                                <tr class= lg:border-b transition duration-300 ease-in-out hover:bg-gray-100">
                                                      <th scope="col" class="text-lg font-bold text-green-600  lg:px-6 lg:py-4 text-left">
                                                            Contact
                                                      </th>
                                                      <td class="text-sm text-gray-900 font-bold px-6 py-2 whitespace-nowrap">
                                                            <%=User.getContact()%>
                                                      </td>
                                                </tr>                               
                                          </thead>
                                    </table>
                              </div>
                        </div>
                        <!-- End of Modal Content-->
                  </div>
            </dialog>
            <!--End Of Student Profile--> 

            <!--student Profile Edit-->
            <dialog id="myModal2" class="h-auto w-11/12 md:w-2/5 lg:w-2/5 p-3 bg-gradient-to-r from-yellow-400 via-gray-50 to-teal-300 rounded-md  ">

                  <div class="flex flex-col w-full h-auto ">
                        <!-- Header -->
                        <div class="flex w-full h-auto justify-center items-center">
                              <div class="flex w-11/12 lg:w-8/12 h-auto py-1 justify-center items-center text-2xl font-bold ">
                                    Tech Blog With Kausar 
                              </div>
                              <div onclick="document.getElementById('myModal2').close();" class="flex w-1/12 h-auto justify-center cursor-pointer">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                              </div>
                              <!--Header End-->
                        </div>
                        <!-- Modal Content-->
                        <div class="flex w-full h-auto py-1 px-2 justify-center items-center flex-col bg-radial from-amber-200 via-violet-600 to-sky-900 rounded text-center text-gray-500">
                              <img class="w-1/6" src="img/<%= User.getProfile()%>" alt="alt"/>  
                              <!--<h1 class="text-2xl text-center text-black font-bold mt-2 mb-2"> <%= User.getStudentName()%></h1>-->
                              <!--Profile Edit--> 
                              <form action="editRegister" method="post" enctype="multipart/form-data">
                                    <table class="min-w-full"> 
                                          <tr class= lg:border-b  transition duration-300 ease-in-out hover:bg-gray-100">
                                                <th scope="col" class="text-sm font-bold text-green-600 px-2 py-2  text-left">
                                                      UserId
                                                </th>
                                                <td class=" whitespace-nowrap text-sm font-bold text-green-600"><%=User.getUserId()%></td>
                                          </tr>
                                          <tr class= lg:border-b  transition duration-300 ease-in-out hover:bg-gray-100">
                                                <th scope="col" class="text-sm font-bold text-green-600 px-2 py-2   text-left">
                                                      Name:
                                                </th>
                                                <td class=" whitespace-nowrap text-sm font-bold text-green-600">  <input type="text" name="name" class="pr-4 pl-10 py-2 bg-green-100 border focus:ring-gray-500 focus:border-gray-900  sm:text-sm border-gray-300 rounded-md focus:outline-none text-gray-600" value="<%= User.getStudentName()%>"></td>
                                          </tr>
                                          <tr class= lg:border-b  transition duration-300 ease-in-out hover:bg-gray-100">
                                                <th scope="col" class="text-sm font-bold text-green-600 px-2 py-2  text-left">
                                                      Qualification:
                                                </th>
                                                <td class=" whitespace-nowrap text-sm font-bold text-green-600">  
                                                      <!--<input type="text" name="qualification" class="pr-4 pl-10 bg-green-100 py-2 border focus:ring-gray-500 focus:border-gray-900  sm:text-sm border-gray-300 rounded-md focus:outline-none text-gray-600" value=""></td>-->
                                                      <svg class="w-2 h-2 absolute top-0 right-0 m-4 pointer-events-none" xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 412 232">
                                                      <path d="M206 171.144L42.678 7.822c-9.763-9.763-25.592-9.763-35.355 0-9.763 9.764-9.763 25.592 0 35.355l181 181c4.88 4.882 11.279 7.323 17.677 7.323s12.796-2.441 17.678-7.322l181-181c9.763-9.764 9.763-25.592 0-35.355-9.763-9.763-25.592-9.763-35.355 0L206 171.144z"fill="#648299" fill-rule="nonzero" />
                                                      </svg>
                                                      <select name="qualification" class="pr-32 pl-10 bg-green-100 py-2 border focus:ring-gray-500 focus:border-gray-900  sm:text-sm border-gray-300 rounded-md focus:outline-none text-gray-600">
                                                            <option><%= User.getQualification()%></option>
                                                            <option>B.tech</option>
                                                            <option>BCA</option>
                                                            <option>BBA</option>
                                                            <option>B.Com</option>
                                                            <option>BSc</option>
                                                            <option>MBA</option>
                                                            <option>MCA</option>
                                                            <option>LOL</option>
                                                      </select>
                                          </tr>
                                          <tr class= lg:border-b  transition duration-300 ease-in-out hover:bg-gray-100">
                                                <th scope="col" class="text-sm  font-bold text-green-600 px-4 py-2  text-left">
                                                      BirthDay:
                                                </th>
                                                <td class=" whitespace-nowrap text-sm font-bold text-green-600">  <input type="date"  name="birthday" class="pr-16 pl-16 bg-green-100 py-2 border focus:ring-gray-500 focus:border-gray-900  sm:text-sm border-gray-300 rounded-md focus:outline-none text-gray-600" value="<%= User.getDateBirth()%>"></td>
                                          </tr>
                                          <tr class= lg:border-b  transition duration-300 ease-in-out hover:bg-gray-100">
                                                <th scope="col" class="text-sm  font-bold text-green-600 px-2 py-2  text-left">
                                                      Address:
                                                </th>
                                                <td class=" whitespace-nowrap text-sm font-bold text-green-600">  <input type="text" name="address" class="pr-4 pl-10 bg-green-100 py-2 border focus:ring-gray-500 focus:border-gray-900  sm:text-sm border-gray-300 rounded-md focus:outline-none text-gray-600" value="<%= User.getAddress()%>"></td>
                                          </tr><!-- comment -->
                                          <tr class= lg:border-b  transition duration-300 ease-in-out hover:bg-gray-100">
                                                <th scope="col" class="text-sm  font-bold text-green-600 px-2 py-2  text-left">
                                                      Gender:
                                                </th>
                                                <td class=" whitespace-nowrap text-sm font-bold text-green-600">  <input type="text" name="gender" class="pr-4 pl-10 bg-green-100 py-2 border focus:ring-gray-500 focus:border-gray-900  sm:text-sm border-gray-300 rounded-md focus:outline-none text-gray-600" value="<%= User.getGender()%>"></td>
                                          </tr>
                                          <tr class= lg:border-b  transition duration-300 ease-in-out hover:bg-gray-100">
                                                <th scope="col" class="text-sm  font-bold text-green-600 px-2 py-2  text-left">
                                                      Contact:
                                                </th>
                                                <td class=" whitespace-nowrap text-sm font-bold text-green-600">  <input type="text" name="contact" class="pr-4 pl-10 bg-green-100 py-2 border focus:ring-gray-500 focus:border-gray-900  sm:text-sm border-gray-300 rounded-md focus:outline-none text-gray-600" value="<%= User.getContact()%>"></td>
                                          </tr>
                                          <tr class= lg:border-b  transition duration-300 ease-in-out hover:bg-gray-100">
                                                <th scope="col" class="text-sm  font-bold text-green-600 px-2 py-2  text-left">
                                                      City:
                                                </th>
                                                <td class=" whitespace-nowrap text-sm font-bold text-green-600">  <input type="text" name="city" class="pr-4 pl-10 bg-green-100 py-2 border focus:ring-gray-500 focus:border-gray-900  sm:text-sm border-gray-300 rounded-md focus:outline-none text-gray-600" value="<%= User.getCity()%>"></td>
                                          </tr>
                                          <tr class= lg:border-b  transition duration-300 ease-in-out hover:bg-gray-100">
                                                <th scope="col" class="text-sm font-bold text-green-600  px-2 py-2 text-left">
                                                      Password:
                                                </th>
                                                <td class=" whitespace-nowrap text-sm font-bold text-green-600">  
                                                      <div  x-data="{ show: true }">

                                                            <div class="relative">
                                                                  <input name="pass" required placeholder="password" :type="show ? 'password' : 'text'" class="text-md block px-3 py-2 rounded-lg w-full
                                                                         bg-white border-2 border-gray-300 placeholder-gray-600 shadow-md
                                                                         focus:placeholder-gray-500
                                                                         focus:bg-white
                                                                         focus:border-gray-600
                                                                         focus:outline-none" value="<%= User.getPassword()%>">
                                                                  <div class="absolute inset-y-0 right-0 pr-3 flex items-center text-sm leading-5">

                                                                        <svg class="h-6 text-gray-700" fill="none" @click="show = !show"
                                                                             :class="{'hidden': !show, 'block':show }" xmlns="http://www.w3.org/2000/svg"
                                                                             viewbox="0 0 576 512">
                                                                        <path fill="currentColor"
                                                                              d="M572.52 241.4C518.29 135.59 410.93 64 288 64S57.68 135.64 3.48 241.41a32.35 32.35 0 0 0 0 29.19C57.71 376.41 165.07 448 288 448s230.32-71.64 284.52-177.41a32.35 32.35 0 0 0 0-29.19zM288 400a144 144 0 1 1 144-144 143.93 143.93 0 0 1-144 144zm0-240a95.31 95.31 0 0 0-25.31 3.79 47.85 47.85 0 0 1-66.9 66.9A95.78 95.78 0 1 0 288 160z">
                                                                        </path>
                                                                        </svg>

                                                                        <svg class="h-4 text-gray-700" fill="none" @click="show = !show"
                                                                             :class="{'block': !show, 'hidden':show }" xmlns="http://www.w3.org/2000/svg"
                                                                             viewbox="0 0 640 512">
                                                                        <path fill="currentColor"
                                                                              d="M320 400c-75.85 0-137.25-58.71-142.9-133.11L72.2 185.82c-13.79 17.3-26.48 35.59-36.72 55.59a32.35 32.35 0 0 0 0 29.19C89.71 376.41 197.07 448 320 448c26.91 0 52.87-4 77.89-10.46L346 397.39a144.13 144.13 0 0 1-26 2.61zm313.82 58.1l-110.55-85.44a331.25 331.25 0 0 0 81.25-102.07 32.35 32.35 0 0 0 0-29.19C550.29 135.59 442.93 64 320 64a308.15 308.15 0 0 0-147.32 37.7L45.46 3.37A16 16 0 0 0 23 6.18L3.37 31.45A16 16 0 0 0 6.18 53.9l588.36 454.73a16 16 0 0 0 22.46-2.81l19.64-25.27a16 16 0 0 0-2.82-22.45zm-183.72-142l-39.3-30.38A94.75 94.75 0 0 0 416 256a94.76 94.76 0 0 0-121.31-92.21A47.65 47.65 0 0 1 304 192a46.64 46.64 0 0 1-1.54 10l-73.61-56.89A142.31 142.31 0 0 1 320 112a143.92 143.92 0 0 1 144 144c0 21.63-5.29 41.79-13.9 60.11z">
                                                                        </path>
                                                                        </svg>

                                                                  </div>
                                                            </div>
                                                      </div>
                                          </tr>
                                          <tr class= lg:border-b  transition duration-300 ease-in-out hover:bg-gray-100">
                                                <th scope="col" class="text-sm font-bold text-green-600 px-2 py-1 text-left">
                                                      Profile Pic:
                                                </th>
                                                <td class=" whitespace-nowrap text-sm font-bold py-1 text-green-600">   <label class="block shadow">
                                                            <span class="sr-only">Choose File</span>
                                                            <input name="image" type="file" class="block text-sm file:py-1 file:px-2 text-gray-500 file:rounded file:border-1 file:border-gray-400"/>
                                                      </label></td>
                                          </tr>
                                    </table>
                                    <div class="mb-1 flex flex-col mt-1">
                                          <button type="submit" class="px-4 py-1 rounded-md text-sm font-medium border focus:outline-none focus:ring transition text-green-600 border-green-600 hover:text-white hover:bg-green-600 active:bg-green-700 focus:ring-green-300" >Save</button>
                                    </div>
                              </form>

                        </div>
                        <!--Profile Edit Colse-->


                        <!-- End of Modal Content-->

                  </div>

            </dialog>
            <!--Student Profile Edit End-->

            <!--Footer Section-->
            <footer class="flex justify-center px-4 text-gray-800 bg-white dark:text-white dark:bg-gray-900">
                  <div class="container py-6">
                        <h1 class="text-lg font-bold text-center lg:text-2xl">
                              Join 31,000+ other and never miss <br> out on new tips, tutorials, and more.
                        </h1>

                        <div class="flex justify-center mt-6">
                              <div class="bg-white border rounded-md focus-within:ring dark:bg-gray-900 dark:border-gray-700 focus-within:border-blue-400 focus-within:ring-blue-300 focus-within:ring-opacity-40 dark:focus-within:border-blue-300">
                                    <div class="flex flex-wrap justify-between md:flex-row">
                                          <input type="email" class="p-2 m-1 text-sm text-gray-700 bg-transparent appearance-none focus:outline-none focus:placeholder-transparent" placeholder="Enter your email" aria-label="Enter your email">
                                          <button class="w-full px-3 py-2 m-1 text-sm font-medium tracking-wider text-white uppercase transition-colors duration-300 transform bg-gray-800 rounded-md dark:hover:bg-gray-600 dark:bg-gray-800 lg:w-auto hover:bg-gray-700">subscribe</button>
                                    </div>
                              </div>
                        </div>

                        <hr class="h-px mt-6 bg-gray-200 border-none dark:bg-gray-700">

                        <div class="flex flex-col items-center justify-between mt-6 md:flex-row">
                              <div>
                                    <a href="#" class="text-xl font-bold text-gray-800 transition-colors duration-300 dark:text-white hover:text-gray-700 dark:hover:text-gray-300">Online Exam Portal With Kausar</a>
                              </div>

                              <div class="flex mt-4 md:m-0">
                                    <div class="-mx-4">
                                          <a href="#" class="px-4 text-sm font-medium text-gray-600 transition-colors duration-300 dark:text-gray-200 hover:text-blue-500 dark:hover:text-blue-400 hover:underline">About</a>
                                          <a href="#" class="px-4 text-sm font-medium text-gray-600 transition-colors duration-300 dark:text-gray-200 hover:text-blue-500 dark:hover:text-blue-400 hover:underline">Blog</a>
                                          <a href="#" class="px-4 text-sm font-medium text-gray-600 transition-colors duration-300 dark:text-gray-200 hover:text-blue-500 dark:hover:text-blue-400 hover:underline">News</a>
                                          <a href="#" class="px-4 text-sm font-medium text-gray-600 transition-colors duration-300 dark:text-gray-200 hover:text-blue-500 dark:hover:text-blue-400 hover:underline">Contact</a>
                                    </div>
                              </div>
                        </div>
                  </div>
            </footer>
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


