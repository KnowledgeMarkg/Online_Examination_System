/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.examOnline.servlets;

import com.examOnline.Entities.result;
import com.examOnline.Entities.user;
import com.examOnline.UserDao.questionDao;
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
public class result_mstr extends HttpServlet {

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
                  out.println("<title>Servlet result_mstr</title>");
                  out.println("</head>");
                  out.println("<body>");
                  out.println("<h1>Servlet result_mstr at " + request.getContextPath() + "</h1>");
                  HttpSession session = request.getSession();
                  user User = (user) session.getAttribute("currentUser");
                  String userId = User.getUserId();
                  if (User == null) {
                        response.sendRedirect("login.jsp");
                  }
                  String ans;
                  String time = new java.util.Date().toString();
                  int size = Integer.parseInt(request.getParameter("size"));
                  int i, count = 1, obt = 0;
                  for (i = 0; i < size; i++) {
                        String question = request.getParameter("question" + i);
                        if (request.getParameter("ans" + i) != null) {
                              ans = request.getParameter("ans" + i);
                        } else {
                              ans = "Not Submit";
                        }
                        int qid = Integer.parseInt(request.getParameter("qid" + i));
                        result res = new result(userId, qid, ans, time, obt);
                        questionDao dao = new questionDao(ConnectionProvider.getConnection());
                        dao.saveAns(res);
                        out.println(res.getObt());
                        out.println(qid + "<br>");
                        out.println(question + "<br>");
                        out.println(ans + "<br>");
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
                  Logger.getLogger(result_mstr.class.getName()).log(Level.SEVERE, null, ex);
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
                  Logger.getLogger(result_mstr.class.getName()).log(Level.SEVERE, null, ex);
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
