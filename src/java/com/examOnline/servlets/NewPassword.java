package com.examOnline.servlets;

import com.examOnline.Entities.Message;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class NewPassword
 */
@WebServlet("/newPassword")
public class NewPassword extends HttpServlet {

      private static final long serialVersionUID = 1L;

      protected void doPost(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {

            HttpSession session = request.getSession();
            String newPassword = request.getParameter("password");
            String confPassword = request.getParameter("confPassword");
            RequestDispatcher dispatcher = null;
            if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {

                  try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineexam?useSSL=false", "root",
                                "kausar86");
                        PreparedStatement pst = con.prepareStatement("update adminlogin set PASSWORD = ? where userId = ? ");
                        pst.setString(1, newPassword);
                        pst.setString(2, (String) session.getAttribute("email"));

                        int rowCount = pst.executeUpdate();
                        if (rowCount > 0) {
                              Message msg = new Message("Password Reset  Successfully...", "success ", " bg-green-100 rounded-lg py-5 px-6 mb-4 text-base text-green-700 mb-3");
                              session.setAttribute("msg2", msg);
                              response.sendRedirect("adminlogin.jsp");
                        } else {
                              Message msg = new Message("Something went wrong..", "error", "bg-red-100 rounded-lg py-2 px-6 mb-2 text-base text-red-700 mb-3");
                              session.setAttribute("msg2", msg);
                              response.sendRedirect("adminlogin.jsp");;
                        }
                        dispatcher.forward(request, response);
                  } catch (Exception e) {
                        e.printStackTrace();
                  }
            }
      }

}
