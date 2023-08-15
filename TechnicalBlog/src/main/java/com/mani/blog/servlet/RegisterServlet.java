package com.mani.blog.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mani.blog.dao.UserDao;
import com.mani.blog.entities.User;
import com.mani.blog.helper.ConnectionProvider;


@WebServlet("/RegisterServlet")
@MultipartConfig
public class RegisterServlet extends HttpServlet {
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		
		try (PrintWriter out = response.getWriter()) {
			
//			out.println("<!DOCTYPE html>");
//			out.println("<html>");
//			out.println("<head>");
//			out.println("<title>Servlet1</title>");
//			out.println("</head>");
//			out.println("<body>");
			
			String check=request.getParameter("check");
			if (check == null) {
				
				out.println("box not checked");
				
			} else {
						
				//baki ka yaha likhna hai
				String name=request.getParameter("user_name");
				String email=request.getParameter("user_email");
				String password=request.getParameter("user_password");
				String gender=request.getParameter("gender");
				String about=request.getParameter("about");
				
				// create user object and set all data to that object
	// MANISH	
				
				User user=new User(name,email,password,gender,null,about);
								
				// create a user dao object
				
				UserDao dao=new UserDao(ConnectionProvider.getConnection());
				
				if (dao.saveUser(user)) {
					out.println("done");
				}else {
					out.println("error");
				}
			}
				
		
//			out.println("</body>");
//			out.println("</html>");
			
		}
	}
}
//	    @Override
//	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	    	processRequest(request, response);
//	    }
//	    @Override
//	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	    	processRequest(request, response);
//	    }
	//    
//	    public String getServletInfo() {
//	    	return "Short description";
//	    }
	//}
