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

import com.mani.blog.dao.PostDao;
import com.mani.blog.entities.Message;
import com.mani.blog.entities.Post;
import com.mani.blog.entities.User;
import com.mani.blog.helper.ConnectionProvider;
import com.mani.blog.helper.Helper;

@MultipartConfig
@WebServlet("/AddPostServlet")
public class AddPostServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		
		try (PrintWriter out = response.getWriter()) {
			
             int cid = Integer.parseInt(request.getParameter("cid"));
			 String pTitle = request.getParameter("pTitle");
			 String pContent = request.getParameter("pContent");
			 String pCode = request.getParameter("pCode");
			 Part part = request.getPart("pic");
			 
			//   getting current user id....
			 
			 HttpSession session = request.getSession();
			 User user = (User) session.getAttribute("currentUser");
			 
			 
			 
	//		 out.println("Your post title is : " + pTitle);
	//		 out.println(part.getSubmittedFileName());
			
			 Post p = new Post(pTitle, pContent, pCode, part.getSubmittedFileName(), null, cid, user.getId());
			 
			 PostDao dao = new PostDao(ConnectionProvider.getConnection());
			 if (dao.savePost(p))
			 {
				 
				 String path = request.getRealPath("/") + "blog_pic" + File.separator + part.getSubmittedFileName(); 
				 
				 Helper.saveFile(part.getInputStream(), path);
				 
				 out.println("done....");
				 
			 } else
			 {
				 out.println("error....");
			 }
			
		}
	}
}
