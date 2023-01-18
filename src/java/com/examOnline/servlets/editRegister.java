/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.examOnline.servlets;

import com.examOnline.Entities.Message;
import com.examOnline.Entities.user;
import com.examOnline.UserDao.userDao;
import com.examOnline.helper.ConnectionProvider;
import com.examOnline.helper.helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author kausar
 */
@MultipartConfig
public class editRegister extends HttpServlet {

      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException, SQLException {
            response.setContentType("text/html;charset=UTF-8");
            try ( PrintWriter out = response.getWriter()) {
                  out.println("<!DOCTYPE html>");
                  out.println("<html>");
                  out.println("<head>");
                  out.println("<title>Servlet editRegister</title>");
                  out.println("</head>");
                  out.println("<body>");
                  String studentName = request.getParameter("name");
                  String qualification = request.getParameter("qualification");
                  String dateBirth = request.getParameter("birthday");
                  String address = request.getParameter("address");
                  String gender = request.getParameter("gender");
                  String contact = request.getParameter("contact");
                  String city = request.getParameter("city");
                  String password = request.getParameter("pass");
                  Part part = request.getPart("image");
                  String image_Name = part.getSubmittedFileName();

//                  Create Session to Find User
                  HttpSession s = request.getSession();
                  user User = (user) s.getAttribute("currentUser");
                  User.setStudentName(studentName);
                  User.setQualification(qualification);
                  User.setDateBirth(dateBirth);
                  User.setAddress(address);
                  User.setGender(gender);
                  User.setContact(contact);
                  User.setCity(city);
                  User.setPassword(password);
                  String oldFile = User.getProfile();
                  User.setProfile(image_Name);
                  userDao dao = new userDao(ConnectionProvider.getConnection());
                  boolean ans = dao.updateUser(User);
                  if (ans) {
                        String path = request.getRealPath("/") + "img" + File.separator + User.getProfile();
                        //start of photo work
                        //delete code
                        String pathOldFile = request.getRealPath("/") + "img" + File.separator + oldFile;
                        if (!oldFile.equals("default.png")) {
                              helper.deleteFile(pathOldFile);
                        }
                        if (helper.saveFile(part.getInputStream(), path)) {
                              out.println("Profile updated...");
                              Message msg = new Message("Profile details updated...", "success ", " bg-green-100 rounded-lg py-5 px-6 mb-4 text-base text-green-700 mb-3");
                              s.setAttribute("msg", msg);
                        } else {
                              Message msg = new Message("Something went wrong..", "error", "bg-red-100 rounded-lg py-2 px-6 mb-2 text-base text-red-700 mb-3");
                              s.setAttribute("msg", msg);
                        }
                        //end of phots work
                  } else {
                        out.println("not updated..");
                        Message msg = new Message("Something went wrong..", "error", "bg-red-100 rounded-lg py-2 px-6 mb-2 text-base text-red-700 mb-3");
                        s.setAttribute("msg", msg);
                  }
                  response.sendRedirect("StudentLogin.jsp");
                  out.println("</body>");
                  out.println("</html>");
            }
      }

      // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
      /**
       * Handles the HTTP <code>GET</code> method.
       *
       * @param request servlet request
       * @param response servlet response
       * @throws ServletException if a servlet-specific error occurs
       * @throws IOException if an I/O error occurs
       */
      @Override
      protected void doGet(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {
            try {
                  processRequest(request, response);
            } catch (SQLException ex) {
                  Logger.getLogger(editRegister.class.getName()).log(Level.SEVERE, null, ex);
            }
      }

      /**
       * Handles the HTTP <code>POST</code> method.
       *
       * @param request servlet request
       * @param response servlet response
       * @throws ServletException if a servlet-specific error occurs
       * @throws IOException if an I/O error occurs
       */
      @Override
      protected void doPost(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {
            try {
                  processRequest(request, response);
            } catch (SQLException ex) {
                  Logger.getLogger(editRegister.class.getName()).log(Level.SEVERE, null, ex);
            }
      }

      /**
       * Returns a short description of the servlet.
       *
       * @return a String containing servlet description
       */
      @Override
      public String getServletInfo() {
            return "Short description";
      }// </editor-fold>

}
