/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.examOnline.servlets;

import com.examOnline.Entities.Message;
import com.examOnline.UserDao.userDao;
import com.examOnline.helper.ConnectionProvider;
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

/**
 *
 * @author kausar
 */
@MultipartConfig
public class editStudentByAdmin extends HttpServlet {

      /**
       * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
       *
       * @param request servlet request
       * @param response servlet response
       * @throws ServletException if a servlet-specific error occurs
       * @throws IOException if an I/O error occurs
       */
      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException, SQLException {
            response.setContentType("text/html;charset=UTF-8");
            try ( PrintWriter out = response.getWriter()) {
                  /* TODO output your page here. You may use following sample code. */
                  out.println("<!DOCTYPE html>");
                  out.println("<html>");
                  out.println("<head>");
                  out.println("<title>Servlet editStudentByAdmin</title>");
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
                  String userId = request.getParameter("userId");
                  userDao dao = new userDao(ConnectionProvider.getConnection());
                  boolean ans = dao.updateUserbyAdmin(studentName, qualification, dateBirth, address, gender, contact, city, password, userId);
                  HttpSession s = request.getSession();
                  if (ans) {
                        out.println("done");
                        out.println("Profile updated...");
                        Message msg = new Message("Profile details updated...", "success ", " bg-green-100 rounded-lg py-5 px-6 mb-4 text-base text-green-700 mb-3");
                        s.setAttribute("msg2", msg);
                        response.sendRedirect("adminpage.jsp");
                  } else {
                        out.println("error");
                        Message msg = new Message("Something went wrong..", "error", "bg-red-100 rounded-lg py-2 px-6 mb-2 text-base text-red-700 mb-3");
                        s.setAttribute("msg2", msg);
                  }
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
                  Logger.getLogger(editStudentByAdmin.class.getName()).log(Level.SEVERE, null, ex);
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
                  Logger.getLogger(editStudentByAdmin.class.getName()).log(Level.SEVERE, null, ex);
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
