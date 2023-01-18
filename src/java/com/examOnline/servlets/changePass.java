/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.examOnline.servlets;

import com.examOnline.Entities.Message;
import com.examOnline.Entities.adminLogin;
import com.examOnline.UserDao.adminDao;
import com.examOnline.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author kausar
 */
public class changePass extends HttpServlet {

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
                  out.println("<title>Servlet changePass</title>");
                  out.println("</head>");
                  out.println("<body>");
                  String oldPass = request.getParameter("oldPass");
                  String newPass = request.getParameter("newPass");
                  String conPass = request.getParameter("conPass");
                  String userId = request.getParameter("email");
                  HttpSession s = request.getSession();
                  adminLogin admin = (adminLogin) s.getAttribute("currenadmin");
                  String oriPass = admin.getPassword();
                  String oriUserId = admin.getUserId();
                  out.println(oriPass);
                  out.println(oriUserId);
                  if (oldPass.equals(null) || oldPass == "" || newPass.equals(null) || newPass == "" || conPass.equals(null) || conPass == "") {
                        Message msg = new Message("Please Fill All The Field...", "error", "bg-red-100 rounded-lg py-2 px-6 mb-2 text-base text-red-700 mb-3");
                        s.setAttribute("msg2", msg);
                        response.sendRedirect("adminpage.jsp");
                  } else if (!newPass.equals(conPass)) {
                        Message msg = new Message("New Password And Confirm Password Not Matched", "error", "bg-red-100 rounded-lg py-2 px-6 mb-2 text-base text-red-700 mb-3");
                        s.setAttribute("msg2", msg);
                        response.sendRedirect("adminpage.jsp");
                  } else if (!oriPass.equals(oldPass)) {
                        Message msg = new Message("Old Password is Incorrect", "error", "bg-red-100 rounded-lg py-2 px-6 mb-2 text-base text-red-700 mb-3");
                        s.setAttribute("msg2", msg);
                        response.sendRedirect("adminpage.jsp");
                  } else {
                        adminDao dao = new adminDao(ConnectionProvider.getConnection());
                        boolean f = dao.updateAdmin(conPass, userId);
                        if (f) {
                              Message m = new Message("Password Change Successfully", "success ", " bg-green-100 rounded-lg py-2 px-6 mb-2 text-base text-green-700 mb-3");
                              s.setAttribute("msg2", m);
                              response.sendRedirect("adminlogin.jsp");
                        } else {
                              Message msg = new Message("Old Password is Incorrect", "error", "bg-red-100 rounded-lg py-2 px-6 mb-2 text-base text-red-700 mb-3");
                              s.setAttribute("msg2", msg);
                              response.sendRedirect("adminpage.jsp");
                        }
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
                  Logger.getLogger(changePass.class.getName()).log(Level.SEVERE, null, ex);
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
                  Logger.getLogger(changePass.class.getName()).log(Level.SEVERE, null, ex);
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
