<%-- 
    Document   : modals
    Created on : Oct 31, 2022, 4:04:25 PM
    Author     : kausar
--%>

<%@page import="com.examOnline.Entities.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


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
