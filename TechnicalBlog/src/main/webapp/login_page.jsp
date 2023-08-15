<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.mani.blog.entities.Message" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login JSP Page</title>

     <!--  CSS -->
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">   
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

     <style>
      .banner-background {
      clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 70%, 82% 87%, 58% 98%, 23% 98%, 0 96%, 0% 35%, 0 0);
      }   
    </style>

</head>
<body>

      <!-- navbar -->
 
 <%@include file="normal_navbar.jsp" %>
 
 
    <main class="d-flex align-items-center primary-background banner-background" style="height: 70vh">
        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                
                     <div class="card">
                         <div class="card-header primary-background text-white text-center">
                           <span class="fa fa-user-plus fa-3x"></span>
                           <br>
                             <p>Login here</p>
                         </div>
                         
                         <%
                             Message m=(Message)session.getAttribute("msg");
                            if(m!=null)
                            {
                            	%>
                            	   <div class="alert  <%= m.getCssClass() %>" role="alert">
                                       <%= m.getContent() %>
                                  </div>
                            	
                            	<% 
                            	
                            	     session.removeAttribute("msg");
                            }
                         
                         
                         %>
                         
                         <div class="card-body">
                     <form action="LoginServlet" method="post">
                          <div class="mb-3">
                          
                            <label for="exampleInputEmail1" class="form-label">Email address</label>
                            <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                            <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                          </div>
                          
                          <div class="mb-3">
                            <label for="exampleInputPassword1" class="form-label">Password</label>
                            <input name="password" type="password" class="form-control" id="exampleInputPassword1">
                          </div>  
                          
                          <div class="container text-center" >
                             <button type="submit" class="btn btn-primary">Submit</button>
                          </div>                                                                          
                          
                     </form>
                     
                         </div>
                     
                     </div>
                
                </div>
            
            </div>
        
        
        </div>
    
    </main>





          <!--  JavaScript -->
          
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
          
    <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script> -->
    
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    
    <script src="js/myjs.js" type="text/javascript"></script>



</body>
</html> 