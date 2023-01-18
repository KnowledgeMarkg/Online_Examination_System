/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.examOnline.servlets;

import com.examOnline.Entities.Message;
import com.examOnline.Entities.addQuestion;
import com.examOnline.UserDao.questionDao;
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
public class addQuestionServlet extends HttpServlet {

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
                  int qId = Integer.parseInt(request.getParameter("quId"));
                  String question = request.getParameter("question");
                  String option1 = request.getParameter("opt1");
                  String option2 = request.getParameter("opt2");
                  String option3 = request.getParameter("opt3");
                  String option4 = request.getParameter("opt4");
                  String answer = request.getParameter("ans");
                  addQuestion q = new addQuestion(qId, question, option1, option2, option3, option4, answer);
                  questionDao dao = new questionDao(ConnectionProvider.getConnection());
                  HttpSession s = request.getSession();
                  if (dao.saveQuestion(q)) {
                        out.println("done");
                        Message msg = new Message("Profile details updated...", "success ", " bg-green-100 rounded-lg py-5 px-6 mb-4 text-base text-green-700 mb-3");
                        s.setAttribute("msg", msg);
                        HttpSession quest = request.getSession();
                        s.setAttribute("currentquestion", q);
                  } else {
                        out.println("error");
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
                  Logger.getLogger(addQuestionServlet.class.getName()).log(Level.SEVERE, null, ex);
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
                  Logger.getLogger(addQuestionServlet.class.getName()).log(Level.SEVERE, null, ex);
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
