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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String username =req.getParameter("username");
		String password =req.getParameter("password");
        String mobile=req.getParameter("mobile");
        
        TodoDAO dao =new TodoDAO(DBConnect.getConn());
        boolean f = dao.addUser(username, password, mobile);
        
        HttpSession session = req.getSession();
        
        if(f) {
        	session.setAttribute("sucmsg","Registration Successfully");
        	resp.sendRedirect("index.jsp");
        }
        else {
        	session.setAttribute("failedmsg","Something wrong on server");
        	resp.sendRedirect("register.jsp");
        }
	}

	
}
