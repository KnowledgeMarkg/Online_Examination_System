/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.examOnline.servlets;

import com.examOnline.Entities.user;
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

/**
 *
 * @author kausar
 */
@MultipartConfig
public class register extends HttpServlet {

      /**
       * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
       *
       * @param request servlet request
       * @param response servlet response
       * @throws ServletException if a servlet-specific error occurs
       * @throws IOException if an I/O error occurs
       */
      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException, SQLException, InterruptedException {
            response.setContentType("text/html;charset=UTF-8");
            try ( PrintWriter out = response.getWriter()) {
                  Thread.sleep(1000);
                  String check = request.getParameter("check");
                  if (check == null) {
                        out.println("Please Check terms And Condition");
                  } else {
                        String userId = request.getParameter("email");
                        String studentName = request.getParameter("student_name");
                        String qualification = request.getParameter("qualification");
                        String dateBirth = request.getParameter("date");
                        String address = request.getParameter("address");
                        String gender = request.getParameter("inline-radio-group");
                        String contact = request.getParameter("contact_num");
                        String city = request.getParameter("city");
                        String password = request.getParameter("pass");
                        String con_pass = request.getParameter("con_pass");
                        user User = new user(userId, studentName, qualification, dateBirth, address, gender, contact, city, password, con_pass);
                        userDao dao = new userDao(ConnectionProvider.getConnection());
                        if (dao.saveUser(User)) {
                              out.println("done");
                        } else {
                              out.println("error");
                        }
                  }
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
                  Logger.getLogger(register.class.getName()).log(Level.SEVERE, null, ex);
            } catch (InterruptedException ex) {
                  Logger.getLogger(register.class.getName()).log(Level.SEVERE, null, ex);
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
                  Logger.getLogger(register.class.getName()).log(Level.SEVERE, null, ex);
            } catch (InterruptedException ex) {
                  Logger.getLogger(register.class.getName()).log(Level.SEVERE, null, ex);
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
