package com.mani.blog.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.mani.blog.dao.UserDao;
import com.mani.blog.entities.Message;
import com.mani.blog.entities.User;
import com.mani.blog.helper.ConnectionProvider;
import com.mani.blog.helper.Helper;
import com.mysql.cj.Session;

@MultipartConfig
@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		
		try (PrintWriter out = response.getWriter()) {
			
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>EditServlet</title>");
			out.println("</head>");
			out.println("<body>");

	//		fetch all data
			
			String userEmail = request.getParameter("user_email");
			String userName = request.getParameter("user_name");
			String userPassword = request.getParameter("user_password");
			String userAbout = request.getParameter("user_about");
			
			Part part = request.getPart("image");
			String imageName = part.getSubmittedFileName();
			
	//		get the user from the Session.......
			
			HttpSession s = request.getSession();
			User user = (User)s.getAttribute("currentUser");
			
			user.setEmail(userEmail);
			user.setName(userName);
			user.setPassword(userPassword);
			user.setAbout(userAbout);
			
			String oldFile=user.getProfile();
			
			user.setProfile(imageName);

			
		 //	update database
			
			UserDao userDao = new UserDao(ConnectionProvider.getConnection());
			
			boolean ans = userDao.updateUser(user);
			
			if (ans) {				
				
				String path = request.getRealPath("/") + "pics" + File.separator + user.getProfile();
				
			//	delete code
				
				String pathOldFile = request.getRealPath("/") + "pics" + File.separator + oldFile ;
				
				if(!oldFile.equals("default.jpg")) {
				Helper.deleteFile(pathOldFile);
				}
				
				if (Helper.saveFile(part.getInputStream(), path)) {
					
					out.println("Profile updated...");
					
					Message msg= new Message("Profile details updated...", "success", "alert-success");
					
					s.setAttribute("msg", msg);
					
				}
				else
				{
					////////
					Message msg= new Message("Something went wrong..", "error", "alert-danger");
					
					s.setAttribute("msg", msg);
				} 
				
			} else {
				out.println("not updated....");
				
				Message msg= new Message("Something went wrong..", "error", "alert-danger");
				
				s.setAttribute("msg", msg);
				
			}
			
			response.sendRedirect("profile.jsp");
		
			out.println("</body>");
			out.println("</html>");
			
		}
	}
}


