package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.TodoDAO;
import com.DB.DBConnect;

@WebServlet ("/index")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
           
		String username =req.getParameter("username");
		String password =req.getParameter("password");
		
		 TodoDAO dao =new TodoDAO(DBConnect.getConn());
	        boolean f = dao.getUserDtls(username, password);
	        
	        HttpSession session = req.getSession();
	        
	        if(f) {
	            session.setAttribute("UserName", username);
	        	resp.sendRedirect("List.jsp");
	        }
	        else {
	        	resp.sendRedirect("index.jsp");
	        }

	}

}
