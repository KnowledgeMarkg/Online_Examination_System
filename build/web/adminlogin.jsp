<%-- 
    Document   : adminlogin
    Created on : Oct 16, 2022, 1:23:09 AM
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
            <title>Admin Login Page </title>
      </head>
      <!-- component -->
      <body class="bg-[conic-gradient(at_bottom_left,_var(--tw-gradient-stops))] from-fuchsia-300 via-green-400 to-rose-700 h-auto w-full py-8">
            <!-- component -->
            <script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.js" defer></script>
            <div>
                  <div class="flex flex-col items-center flex-1 h-full justify-center px-4 sm:px-0 mb-4">
                        <div class="flex rounded-lg shadow-lg w-full sm:w-3/4 lg:w-1/2 bg-white sm:mx-0" style="height: 500px">
                              <div class="flex flex-col w-full md:w-1/2 p-4">
                                    <div class="flex flex-col flex-1 justify-center mb-8">
                                          <h1 class="text-4xl text-center font-thin">Welcome Back</h1>
                                          <div class="w-full mt-2">
                                                <div class="flex justify-center">
                                                      <svg xmlns="http://www.w3.org/2000/svg" class="w-20 h-20 text-green-600" fill="none"
                                                           viewBox="0 0 24 24" stroke="currentColor">
                                                      <path d="M12 14l9-5-9-5-9 5 9 5z" />
                                                      <path
                                                            d="M12 14l6.16-3.422a12.083 12.083 0 01.665 6.479A11.952 11.952 0 0012 20.055a11.952 11.952 0 00-6.824-2.998 12.078 12.078 0 01.665-6.479L12 14z" />
                                                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                            d="M12 14l9-5-9-5-9 5 9 5zm0 0l6.16-3.422a12.083 12.083 0 01.665 6.479A11.952 11.952 0 0012 20.055a11.952 11.952 0 00-6.824-2.998 12.078 12.078 0 01.665-6.479L12 14zm-4 6v-7.5l4-2.222" />
                                                      </svg>
                                                </div>
                                                <form action="adminloginServlet" method="post" class="mt-4">
                                                          <%      
                                                         Message m =  (Message) session.getAttribute("msg2");
                                                         if(m!=null){
                                                          %>
                                                          <div class="<%= m.getCssClass() %>" role="alert">
                                                                  <%=  m.getContent()  %>
                                                      </div>
                                                          <%
                                                                session.removeAttribute("msg2");
                                                            }
                                                            
                                                      %>
                                                      <div class="mx-auto max-w-lg">
                                                            <div class="py-2">
                                                                  <span class="px-1 text-sm text-gray-600">Username</span>
                                                                  <input placeholder="email" name="email" required type="text" class="text-md block px-3 py-2  rounded-lg w-full  bg-white border-2 border-gray-300 placeholder-gray-600 shadow-md focus:placeholder-gray-500 focus:bg-white focus:border-gray-600 focus:outline-none">
                                                            </div>
                                                            <div class="py-2" x-data="{ show: true }">
                                                                  <span class="px-1 text-sm text-gray-600">Password</span>
                                                                  <div class="relative">
                                                                        <input name="pass" required placeholder="password" :type="show ? 'password' : 'text'" class="text-md block px-3 py-2 rounded-lg w-full
                                                                               bg-white border-2 border-gray-300 placeholder-gray-600 shadow-md
                                                                               focus:placeholder-gray-500
                                                                               focus:bg-white
                                                                               focus:border-gray-600
                                                                               focus:outline-none">
                                                                        <div class="absolute inset-y-0 right-0 pr-3 flex items-center text-sm leading-5">
                                                                              <svg class="h-6 text-gray-700" fill="none" @click="show = !show"
                                                                                   :class="{'hidden': !show, 'block':show }" xmlns="http://www.w3.org/2000/svg"
                                                                                   viewbox="0 0 576 512">
                                                                              <path fill="currentColor"
                                                                                    d="M572.52 241.4C518.29 135.59 410.93 64 288 64S57.68 135.64 3.48 241.41a32.35 32.35 0 0 0 0 29.19C57.71 376.41 165.07 448 288 448s230.32-71.64 284.52-177.41a32.35 32.35 0 0 0 0-29.19zM288 400a144 144 0 1 1 144-144 143.93 143.93 0 0 1-144 144zm0-240a95.31 95.31 0 0 0-25.31 3.79 47.85 47.85 0 0 1-66.9 66.9A95.78 95.78 0 1 0 288 160z">
                                                                              </path>
                                                                              </svg>
                                                                              <svg class="h-6 text-gray-700" fill="none" @click="show = !show"  :class="{'block': !show, 'hidden':show }" xmlns="http://www.w3.org/2000/svg"viewbox="0 0 640 512">
                                                                              <path fill="currentColor"
                                                                                    d="M320 400c-75.85 0-137.25-58.71-142.9-133.11L72.2 185.82c-13.79 17.3-26.48 35.59-36.72 55.59a32.35 32.35 0 0 0 0 29.19C89.71 376.41 197.07 448 320 448c26.91 0 52.87-4 77.89-10.46L346 397.39a144.13 144.13 0 0 1-26 2.61zm313.82 58.1l-110.55-85.44a331.25 331.25 0 0 0 81.25-102.07 32.35 32.35 0 0 0 0-29.19C550.29 135.59 442.93 64 320 64a308.15 308.15 0 0 0-147.32 37.7L45.46 3.37A16 16 0 0 0 23 6.18L3.37 31.45A16 16 0 0 0 6.18 53.9l588.36 454.73a16 16 0 0 0 22.46-2.81l19.64-25.27a16 16 0 0 0-2.82-22.45zm-183.72-142l-39.3-30.38A94.75 94.75 0 0 0 416 256a94.76 94.76 0 0 0-121.31-92.21A47.65 47.65 0 0 1 304 192a46.64 46.64 0 0 1-1.54 10l-73.61-56.89A142.31 142.31 0 0 1 320 112a143.92 143.92 0 0 1 144 144c0 21.63-5.29 41.79-13.9 60.11z">
                                                                              </path>
                                                                              </svg>
                                                                        </div>
                                                                  </div>
                                                            </div>
                                                            <div class="flex justify-between"><label class="block text-gray-500 font-bold my-4">
                                                            <input type="checkbox" class="leading-loose text-pink-600"> <span class="py-2 text-sm text-gray-600 leading-snug"> Remember Me </span></label> <label class="block text-gray-500 font-bold my-4"><a href="forgotPassword.jsp" class="cursor-pointer tracking-tighter text-black border-b-2 border-gray-200 hover:border-gray-400"><span>Forgot Password?</span></a></label></div> <button class="mt-3 text-lg font-semibold bg-green-600 w-full text-white rounded-lg  px-6 py-3 block shadow-xl hover:text-white hover:bg-green-900">
                                                                  Login
                                                            </button>
                                                      </div>
                                                </form>
                                          </div>
                                    </div>
                              </div>
                              <div class="hidden md:block md:w-1/2 rounded-r-lg" style="background: url('https://images.unsplash.com/photo-1515965885361-f1e0095517ea?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3300&q=80'); background-size: cover; background-position: center center;"></div>
                        </div>
                  </div>
            </div>
            <script src="https://cdn.tailwindcss.com"></script>
            <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
      </body>
</html>
