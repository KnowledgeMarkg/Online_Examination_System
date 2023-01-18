<%-- 
    Document   : navbar
    Created on : Oct 15, 2022, 1:52:25 PM
    Author     : kausar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
                                          <a href="#" class="py-5 px-3 text-white hover:text-gray-900">Contact</a>
                                          <a href="#" class="py-5 px-3 text-white hover:text-gray-900">Course</a>
                                          <a href="#" class="py-5 px-3 text-white hover:text-gray-900">About</a>
                                    </div>
                              </div>
                              <!-- secondary nav -->
                              <div class="hidden md:flex items-center space-x-1">
                                    <a href="login.jsp" class="py-5 px-3 text-2xl">Login</a>
                                    <a href="signUp.jsp" class="py-2 px-3 text-2xl bg-yellow-400 hover:bg-yellow-300 text-yellow-900 hover:text-yellow-800 rounded transition duration-300">Signup</a>
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
                  <div class="mobile-menu hidden md:hidden">
                        <a href="#" class="block py-5 px-3 text-2xl text-white hover:text-gray-900">Home</a>
                        <a href="#" class="block py-5 px-3 text-2xl text-white hover:text-gray-900">Contact</a>
                        <a href="#" class="block py-5 px-3 text-2xl text-white hover:text-gray-900">Course</a>
                        <a href="#" class="block py-5 px-3 text-2xl text-white hover:text-gray-900">About</a>
                  </div>
            </nav>
         
