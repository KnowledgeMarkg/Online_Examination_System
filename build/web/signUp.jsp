<%-- 
    Document   : signUp
    Created on : Oct 15, 2022, 11:32:19 AM
    Author     : kausar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
      <head>
            <meta charset="UTF-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <link href="https://unpkg.com/@material-tailwind/html@latest/styles/material-tailwind.css" rel="stylesheet"/>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
            <title>Document</title>
      </head>
      <body class=" bg-[conic-gradient(at_bottom_left,_var(--tw-gradient-stops))] from-fuchsia-300 via-green-400 to-rose-700">
            <%@include  file="navbar.jsp" %>
            <div class="container mx-auto">
                  <div class="flex justify-center px-6 my-12">
                        <!-- Row -->
                        <div class="w-5/5 lg:w-full xl:w-3/4 lg:w-11/12 flex">
                              <!-- Col -->
                              <div
                                    class="w-full h-auto bg-gray-400 hidden lg:block lg:w-5/12 bg-cover rounded-l-lg"
                                    style="
                                    background-image: url('img/ai-nuclear-energy-future-innovation-disruptive-technology.jpg');
                                    "
                                    ></div>
                              <!-- Col -->
                              <div
                                    class="w-full lg:w-7/12 bg-gradient-to-r from-pink-300 via-purple-300 to-indigo-400 p-5 rounded-lg lg:rounded-l-none"
                                    >
                                    <h3 class="pt-2 text-2xl text-center">Create an Account!</h3>
                                    <form action="register" method="POST" id="reg" class="px-8 pt-2 pb-2 mb-4 bg-gradient-to-r from-pink-300 via-purple-300 to-indigo-400bg-white rounded ">
                                          <div class="mb-4 md:flex md:justify-between">
                                                <div class="mb-4 md:mr-2 md:mb-0">
                                                      <label
                                                            class="block mb-2 text-sm font-bold text-gray-700"
                                                            for="full_name"
                                                            >
                                                            Full Name
                                                      </label>
                                                      <input
                                                            class="w-full px-3 py-2 text-sm leading-tight text-gray-700 border rounded shadow appearance-none focus:outline-none focus:shadow-outline"
                                                            id="firstName"
                                                            type="text"
                                                            placeholder="First Name"
                                                            name="student_name"
                                                            />
                                                </div>
                                                <div class="md:ml-2">
                                                      <label
                                                            class="block mb-2 text-sm font-bold text-gray-700"
                                                            for="dropdown"
                                                            >
                                                            Qualification
                                                      </label>
                                                      <div class="relative inline-flex">
                                                            <svg
                                                                  class="w-2 h-2 absolute top-0 right-0 m-4 pointer-events-none"
                                                                  xmlns="http://www.w3.org/2000/svg"
                                                                  viewBox="0 0 412 232"
                                                                  >
                                                            <path
                                                                  d="M206 171.144L42.678 7.822c-9.763-9.763-25.592-9.763-35.355 0-9.763 9.764-9.763 25.592 0 35.355l181 181c4.88 4.882 11.279 7.323 17.677 7.323s12.796-2.441 17.678-7.322l181-181c9.763-9.764 9.763-25.592 0-35.355-9.763-9.763-25.592-9.763-35.355 0L206 171.144z"
                                                                  fill="#648299"
                                                                  fill-rule="nonzero"
                                                                  />
                                                            </svg>
                                                            <select
                                                                  name="qualification"
                                                                  class="h-9 pl-5 pr-10 text-sm bg-white leading-tight text-gray-700 border rounded shadow appearance-none focus:outline-none focus:shadow-outline"
                                                                  >
                                                                  <option>Choose Qualification</option>
                                                                  <option>B.tech</option>
                                                                  <option>BCA</option>
                                                                  <option>BBA</option>
                                                                  <option>B.Com</option>
                                                                  <option>BSc</option>
                                                                  <option>MBA</option>
                                                                  <option>MCA</option>
                                                                  <option>LOL</option>
                                                            </select>
                                                      </div>
                                                </div>
                                          </div>
                                          <div class="mb-2">
                                                <label
                                                      class="block mb-2 text-sm font-bold text-gray-700"
                                                      for="email"
                                                      >
                                                      Email
                                                </label>
                                                <input
                                                      class="w-full px-3 py-2 mb-3 text-sm leading-tight text-gray-700 border rounded shadow appearance-none focus:outline-none focus:shadow-outline"
                                                      id="email"
                                                      type="email"
                                                      placeholder="Email"
                                                      name="email"
                                                      />
                                          </div>
                                          <div class="mb-2">
                                                <label class="block mb-2 text-sm font-bold text-gray-700">
                                                      Address
                                                </label>
                                                <input
                                                      class="w-full px-3 py-2 mb-3 text-sm leading-tight text-gray-700 border rounded shadow appearance-none focus:outline-none focus:shadow-outline"
                                                      id="addressl"
                                                      placeholder="Address"
                                                      name="address"
                                                      />
                                          </div>
                                          <div class="mb-2 md:flex md:justify-between">
                                                <div class="mb-4 md:mr-2 md:mb-0">
                                                      <label class="block mb-2 text-sm font-bold text-gray-700">
                                                            Contact Number
                                                      </label>
                                                      <input
                                                            class="w-full px-3 py-2 text-sm leading-tight text-gray-700 border rounded shadow appearance-none focus:outline-none focus:shadow-outline"
                                                            type="text"
                                                            placeholder="Please Enter Mobile Number"
                                                            name="contact_num"
                                                            />
                                                </div>
                                                <div class="md:ml-2">
                                                      <label class="block mb-2 text-sm font-bold text-gray-700">
                                                            City
                                                      </label>
                                                      <input
                                                            class="w-full px-3 py-2 mb-3 text-sm leading-tight text-gray-700 border rounded shadow appearance-none focus:outline-none focus:shadow-outline"
                                                            type="text"
                                                            placeholder="City Name"
                                                            name="city"
                                                            />
                                                </div>
                                          </div>
                                          <div class="mb-2 md:flex md:justify-between">
                                                <div class="mb-2 md:mr-2 md:mb-0">
                                                      <label
                                                            class="block mb-2 text-sm font-bold text-gray-700"
                                                            for="password"
                                                            >
                                                            Password
                                                      </label>
                                                      <input
                                                            class="w-full px-3 py-2 mb-3 text-sm leading-tight text-gray-700 border border-red-500 rounded shadow appearance-none focus:outline-none focus:shadow-outline"
                                                            id="password"
                                                            type="password"
                                                            placeholder="******************"
                                                            name="pass"
                                                            />
                                                      <p class="text-xs italic text-red-500">
                                                            Please choose a password.
                                                      </p>
                                                </div>
                                                <div class="md:ml-2">
                                                      <label
                                                            class="block mb-2 text-sm font-bold text-gray-700"
                                                            for="c_password"
                                                            >
                                                            Confirm Password
                                                      </label>
                                                      <input
                                                            class="w-full px-3 py-2 mb-3 text-sm leading-tight text-gray-700 border rounded shadow appearance-none focus:outline-none focus:shadow-outline"
                                                            id="c_password"
                                                            type="password"
                                                            placeholder="******************"
                                                            name="con_pass"
                                                            />
                                                </div>
                                          </div>
                                          <div class="-mx-3 flex flex-wrap">
                                                <div class="w-full px-3 sm:w-1/2">
                                                      <div class="mb-2">
                                                            <label
                                                                  for="date"
                                                                  class="mb-3 block text-base font-medium text-[#07074D]"
                                                                  >
                                                                  Date
                                                            </label>
                                                            <input type="date" name="date" id="date" class="w-full px-3 py-2 mb-3 text-sm leading-tight text-gray-700 border rounded shadow appearance-none focus:outline-none focus:shadow-outline"/>
                                                      </div>
                                                </div>
                                                <div class="w-full px-3 sm:w-1/2">
                                                      <div class="mb-2">
                                                            <label
                                                                  class="mb-4 block text-base font-medium text-[#07074D]"
                                                                  >
                                                                  Gender?
                                                            </label>
                                                            <div class="flex items-center space-x-6">
                                                                  <div class="flex items-center mr-4">
                                                                        <input id="inline-radio" type="radio" value="Male" name="inline-radio-group" class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600">
                                                                        <label for="inline-radio" class="ml-2 text-sm font-medium text-gray-900 dark:text-gray-300">Male</label>
                                                                  </div>
                                                                  <div class="flex items-center mr-4">
                                                                        <input id="inline-2-radio" type="radio" value="Female" name="inline-radio-group" class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600">
                                                                        <label for="inline-2-radio" class="ml-2 text-sm font-medium text-gray-900 dark:text-gray-300">Female</label>
                                                                  </div>
                                                            </div>
                                                      </div>
                                                </div>
                                          </div>
                                          <div class="mb-2 text-center">
                                                <div class="flex items-center">
                                                      <input id="link-checkbox" name="check" type="checkbox" value="ok" class="w-4 h-4 mb-2 text-blue-600 bg-gray-100 rounded border-gray-300 focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600">
                                                      <label for="link-checkbox" class="ml-2  text-sm font-medium text-gray-900 dark:text-gray-300">I agree with the <a href="#" class="text-blue-600 dark:text-blue-500 hover:underline">terms and conditions</a></label> 
                                                </div>
                                                <div class="flex justify-center mb-2" style="display: none;" id="loder" > 
                                                      <div class=" w-16 h-16 border-4 border-dashed rounded-full animate-spin border-green-600" ></div>
                                                </div>
                                                <button
                                                      class="w-full px-4 py-2 font-bold text-white bg-blue-500 rounded-full hover:bg-blue-700 focus:outline-none focus:shadow-outline"
                                                      type="submit"
                                                      >
                                                      Register Account
                                                </button>
                                          </div>
                                          <hr class="mb-2 border-t" />
                                          <div class="text-center">
                                                <a
                                                      class="inline-block text-sm text-blue-500 align-baseline hover:text-blue-800"
                                                      href="#"
                                                      >
                                                      Forgot Password?
                                                </a>
                                          </div>
                                          <div class="text-center">
                                                <a
                                                      class="inline-block text-sm text-blue-500 align-baseline hover:text-blue-800"
                                                      href="./index.html"
                                                      >
                                                      Already have an account? Login!
                                                </a>
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
                  $(document).ready(function () {
                        $('#reg').on('submit', function (event) {
                              event.preventDefault(); // for to go to servlet
                              $("#submit_btn").hide();
                              $("#loder").show();
                              let form = new FormData(this);
                              // Send data to the servlet by the help of ajax function..........
                              $.ajax({
                                    url: "register",
                                    type: 'POST',
                                    data: form,
                                    success: function (data, textStatus, jqXHR) {
                                          console.log(data);
                                          $("#submit_btn").show();
                                          $("#loder").hide();
                                          if (data.trim() === 'done') {
                                                swal("Registered Successfully Redirect To Login Page .")
                                                        .then((value) => {
                                                              window.location = "login.jsp";
                                                        });
                                          } else {
                                                swal(data);
                                          }
                                    },
                                    error: function (jqXHR, textStatus, errorThrown) {
                                          console.log(jqXHR);
                                          $("#submit_btn").show();
                                          $("#loder").hide();
                                    },
                                    processData: false,
                                    contentType: false
                              });
                        });

                  });
            </script>
      </body>
</html>