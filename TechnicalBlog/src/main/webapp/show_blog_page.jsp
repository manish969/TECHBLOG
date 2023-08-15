<%@page import="com.mani.blog.entities.User" %>
<%@page errorPage="error_page.jsp" %>
<%@page import="com.mani.blog.dao.PostDao" %>
<%@page import="com.mani.blog.entities.Post" %>
<%@page import="com.mani.blog.helper.ConnectionProvider" %> 
<%@page import="java.util.ArrayList" %>
<%@page import="com.mani.blog.entities.Category" %>
<%@page import="com.mani.blog.dao.UserDao" %>
<%@page import="java.text.*" %>
<%@page import="com.mani.blog.dao.LikeDao" %>

<%
    User user = (User)session.getAttribute("currentUser");
    if (user == null)
    {
    	response.sendRedirect("login_page.jsp");
    }

%>

<%

    int postId = Integer.parseInt(request.getParameter("post_id"));
    PostDao d = new PostDao(ConnectionProvider.getConnection());
    
    Post p = d.getPostByPostId(postId);
%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%= p.getpTitle()  %>|| TechnicalBlog by Manish Kumar</title>

      <!--  CSS -->
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">      
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

     <style>
     
      .banner-background {
      clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 70%, 82% 87%, 58% 98%, 23% 98%, 0 96%, 0% 35%, 0 0);
      }   
      
      .post-title{
      
          font-weight: 100;
          font-size: 30px;
      }
      
      .post-content {
      
          font-weight: 100;
          font-size: 25px;
      
      }
      .post-date{
          font-style: italic;
          font-weight: bold;
      }
      .post-user-info{
          font-size: 20px;
          
      }
      .row-user{
        border: 1px solid #e2e2e2;
        padding-top: 15px;
      }
      
      
      body {
         background: url(img/backg.jpg);
         backgroung-size: cover;
         background-attachment: fixed;
      }
      
      
    </style>

<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v15.0" nonce="VuY7sXVc"></script>
</head>
<body>

          <!-- navbar -->


      <nav class="navbar navbar-expand-lg navbar-dark primary-background" >
     <div class="container-fluid">
    <a class="navbar-brand" href="#"><span class="fa fa-star"></span>TechBlog</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="profile.jsp"><span class="fa fa-bell"></span>LearnCode</a>
        </li> 
       
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            <span class="fa fa-check-square-o"></span>Categories
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#">Programming Language</a></li>
            <li><a class="dropdown-item" href="#">Project Implementation</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Data Structure</a></li>
          </ul>
        </li>
              
        
        <li class="nav-item">
          <a class="nav-link" href="#"><span class="fa fa-address-card-o"></span>contact</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#add-post-modal" ><span class="fa fa-star"></span>Do Post</a>
        </li>
                     
        </ul>
      
      <ul class="navbar-nav mr-right">
          <li class="nav-item">
          <a class="nav-link" href="#!" data-bs-toggle="modal" data-bs-target="#profile-modal"><span class="fa fa-user-circle"></span><%= user.getName() %></a>
        </li>
      </ul>
      
      <ul class="navbar-nav mr-right">
          <li class="nav-item">
          <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus"></span>Logout</a>
        </li>
      </ul>
      
    </div>
  </div>
</nav>
      
      <!-- end navbar -->
      

   <!--  Start  main content of body -->
   
   
   
     <div class="container">
         <div class="row my-4">
         
             <div class="col-md-8 offset-md-2">
             
                 <div class="card">
                 
                     <div class="card-header primary-background text-white">
                     
                         <h4 class="post-title"><%= p.getpTitle() %></h4>
                     
                     </div>
                     
                         <div class="card-body">
                         
                         <img src="blog_pic/<%= p.getpPic() %>" class="card-img-top my-2" alt="card image cap">
                         
                           <div class="row my-3 row-user">
                               <div class="col-md-8">
                               
                                 <% 
                                    UserDao ud = new UserDao(ConnectionProvider.getConnection());
                                 %>                       

                                  <p class="post-user-info"> <a href="#!" > <%= ud.getUserByUserId(p.getUserId()).getName() %></a> has posted : </p>
                               </div>
                               
                               <div class="col-md-4">
                                  <p class="post-date"> <%= DateFormat.getDateTimeInstance().format(p.getpDate())  %></p>
                               </div>
                           
                           </div>
                         
                         
                             <p class="post-content"><%= p.getpContent() %></p>
                             <br>
                             
                             <div class="post-code">
                             <pre><%= p.getpCode() %></pre>
                            </div>
                            
                         </div>
                         
                         <div class="card-footer primary-background ">
                         
                            <%
                                LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                            %>
                         
                            <a href="#!" onclick="doLike( <%= p.getPid() %>, <%= user.getId() %>)" class="btn btn-outline-light btn-sm"> <i class="fa fa-thumbs-o-up" ></i> <span class="like-counter"> <%= ld.countLikeOnPost(p.getPid()) %></span></a>
                             
                        
                            <a href="#!" class="btn btn-outline-light btn-sm"> <i class="fa fa-commenting-o" ></i> <span>20</span></a>
                         
                         
                         </div>
                         
                           <div class="card-footer">
                                <div class="fb-page" data-href="http://localhost:8090/TechnicalBlog/show_blog_page.jsp?post_id=<%= p.getPid() %>" data-tabs="timeline" data-width="" data-height="" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"></div>
                           </div>
                 
                 </div>
             
             
             </div>
         
         
         </div>
     
     
     </div>
   
   
   
   
   <!--  End main content of body -->
   
   
   
   
         <!-- Start Profile modal -->
      


<!-- Modal -->
<div class="modal fade" id="profile-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header primary-background text-white">
        <h5 class="modal-title" id="exampleModalLabel">TechnicalBlog</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <div class="container text-center">
               <img  src="pics/<%= user.getProfile() %>" class="img-fluid" style="border-radius:50%;max-width: 150px;" >
               <h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName() %></h5>
               
              <!--  DETAILS -->
              
              <div id="profile-details">
              <table class="table">
  
                 <tbody>
                   <tr>
                     <th scope="row">ID :</th>
                     <td><%= user.getId() %></td>
                   </tr>
                   <tr>
                     <th scope="row">Email :</th>
                     <td><%= user.getEmail() %></td>
                   </tr>
                   <tr>
                     <th scope="row">Gender :</th>
                     <td colspan="2"><%= user.getGender() %></td>    
                   </tr>
                   <tr>
                     <th scope="row">About :</th>
                     <td colspan="2"><%= user.getAbout() %></td>    
                   </tr>
                   <tr>
                     <th scope="row">Registered on :</th>
                     <td colspan="2"><%= user.getDateTime().toString() %></td>    
                   </tr>
    
                 </tbody>
               </table>
                  </div>     
                  
                       <!-- PROFILE EDIT -->
                       
                       
                       <div id="profile-edit" style="display: none;">
                           <h3 class="mt-2">Please Edit Carefully</h3>
                           <form action="EditServlet" method="post" enctype="multipart/form-data">
                              <table class="table">
                               <tr>
                                   <td>ID :</td>
                                   <td><%= user.getId() %></td>
                               </tr>
                               <tr>
                                   <td>Email :</td>
                                   <td> <input type="email" class="form-control" name="user_email" value="<%= user.getEmail() %>"> </td>
                               </tr>
                               <tr>
                                   <td>Name :</td>
                                   <td> <input type="text" class="form-control" name="user_name" value="<%= user.getName() %>"> </td>
                               </tr>
                               <tr>
                                   <td>Password :</td>
                                   <td> <input type="password" class="form-control" name="user_password" value="<%= user.getPassword() %>"> </td>
                               </tr>
                               <tr>
                                   <td>Gender :</td>
                                   <td> <%= user.getGender().toUpperCase() %> </td>
                               </tr>
                               <tr>
                                   <td>About :</td>
                                   <td>
                                       <textarea rows="3" class="form-control" name="user_about"><%= user.getAbout() %>                                              
                                       </textarea>
                                   </td>
                               </tr>
                               <tr>
                                   <td>New Profile Pic :</td>
                                   <td>
                                       <input type="file" name="image" class="form-control">
                                   </td>
                               </tr>
                               
                             </table>
                             
                             <div class="container">
                               <button type="submit" class="btn btn-outline-primary">Save</button>                          
                           </div>
                           
                           </form>
                                                     
                       
                       </div>
                      
               
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
      </div>
    </div>
  </div>
</div>


          <!-- End Profile modal -->
          
          
          
          <!-- add post modal -->



<!-- Modal -->
<div class="modal fade" id="add-post-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Provide the post details..</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
           
         <form id="add-post-form" action="AddPostServlet" method="post">
         
            <div class="form-group"> 
                 <select class="form-control" name="cid">
                      <option selected disabled>---Select Category---</option>
                      
                      <%
                      
                         PostDao postd = new PostDao(ConnectionProvider.getConnection());
                      
                         ArrayList<Category> list = postd.getAllCategories();
                         
                         for (Category c : list) {
                        	 
                       %>
                       
                       <option value="<%= c.getCid() %>"><%= c.getName() %></option>
                        	
                        <%
                        
                         }
                        
                        %> 
                        
                        <!-- <option>Cat1</option>
                        <option>Cat2</option>
                        <option>Cat3</option> -->
                     
                 
                 </select>
            
            </div>
         
         
               <div class="form-group">
                    <input name="pTitle" type="text" class="form-control" placeholder="Enter post Title" />
               </div>
               
               <div class="form-group">
                    <textarea name="pContent" rows="" cols="" class="form-control" style="height: 200px;" placeholder="Enter your content"></textarea>
               </div>
               
               <div class="form-group">
                    <textarea name="pCode" rows="" cols="" class="form-control" style="height: 200px;" placeholder="Enter your program (if any)"></textarea>
               </div>
               
               <div class="form-group">
                    <label>Select your pic :</label>
                    <br>
                    <input type="file" name="pic" />
               </div>
               
               <div class="container text-center">
                    <button type="submit" class="btn btn-outline-primary" >Post</button>
               </div>
         
         </form>  
           
           
      </div>
    </div>
  </div>
</div>
          
          
          <!-- End post modal -->





            <!--  JavaScript -->
            
      
          
          
     <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script> 
    
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>       
   
    <script src="js/myjs.js" type="text/javascript"></script>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    
    <script>
        $(document).ready(function() {
        	let editStatus=false;
        	     	
        	$('#edit-profile-button').click(function()
        	{
        		if (editStatus == false)
        		{
                   $("#profile-details").hide()
                
                   $("#profile-edit").show();
                   editStatus = true;
                   $(this).text("Back")
                   
        		} else
        		{
        			$("#profile-details").show()
                    
                    $("#profile-edit").hide();
                    editStatus = false;
                    $(this).text("Edit")
                    
        		}
        	})
        });
    
    
    </script>
    
    
    
   <!--  now add post js -->
   
   
   <script>
   
       $(document).ready(function (e) {
    	   //
    	   $('#add-post-form').on('submit', function (event) {
    		   //this code gets called when form is submitted.....
    		   
    		   event.preventDefault();
    		   
    		   console.log("you have clicked on submit...")
    		   
    		   let form=new FormData(this);
    		   
    		   // now requesting to server...
    		   
    		   $.ajax({
    			   url: "AddPostServlet",
    			   type: 'POST',
    			   data: form,
    			   success: function (data, textStatus, jqXHR) {
    				   // SUCCESS
    				   console.log(data);
    				   if(data.trim() == 'done')
    				   {
    					   swal("Good job!", "saved successfully", "success");
    				   } else
    					{
    					   swal("Error", "Something went wrong try again...", "error");
    					}			   
    			   },
    			   error: function (jqXHR, textStatus, errorThrown) {
    				   //error
    				   swal("Error", "Something went wrong try again...", "error");
    				   
    			   },
    			   processData: false,
    			   contentType: false  			   
    			   
    		   })
    		   
    	   })
       })
   
   
   </script>
   
</body>
</html>