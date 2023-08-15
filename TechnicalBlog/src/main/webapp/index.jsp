<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%@ page import="com.mani.blog.helper.ConnectionProvider" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Index JSP Page</title>

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
 
     <%@include file="normal_navbar.jsp" %>
    
         <!--  banner -->
     <div class="banner-background">        
    <div class="container-fluid p-0 m-0">
    
        <div class="jumbotron primary-background text-white">
           <div class="container">
            <h3>Welcome to Technical Blog</h3>
            
            <p>Welcome to technical blog, world of technology ,A programming
              language is a system of notation for writing computer programs.
              [1] Most programming languages are text-based formal languages,
               but they may also be graphical. They are a kind of computer 
               language.</p>
            <p>Programming language theory is a subfield of computer science
                that deals with the design, implementation, analysis, 
                characterization, and classification of programming languages.</p>
            
            <button class="btn btn-outline-light btn-lg"> <span class="fa fa-user-plus"></span> Start ! its Free</button>
            <a href="login_page.jsp" class="btn btn-outline-light btn-lg"> <span class="fa fa-user-circle fa-spin"></span> Login</a>           
            
           </div>
           
        </div>
        
    </div>
    
 </div>
    
        <br>
        
    <!-- cards -->
    
    <div class="container  mb-20 ">
    
        <div class="row mb-2">
            
            <div class="col-md-4">
        
               <div class="card" >
  
                  <div class="card-body">
                       <h5 class="card-title">Java Programming</h5>
                       <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                       <a href="#" class="btn btn-primary">Read more</a>
                  </div>
               </div>
          
             </div>
             <div class="col-md-4">
        
               <div class="card" >
  
                  <div class="card-body">
                       <h5 class="card-title">Java Programming</h5>
                       <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                       <a href="#" class="btn btn-primary">Read more</a>
                  </div>
               </div>
          
             </div>
             <div class="col-md-4">
        
               <div class="card" >
  
                  <div class="card-body">
                       <h5 class="card-title">Java Programming</h5>
                       <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                       <a href="#" class="btn btn-primary">Read more</a>
                  </div>
               </div>
             </div> 
             </div>
             <div class="row mb-2">
                          <div class="col-md-4">
        
               <div class="card" >
  
                  <div class="card-body">
                       <h5 class="card-title">Java Programming</h5>
                       <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                       <a href="#" class="btn btn-primary">Read more</a>
                  </div>
               </div>
             </div>
                          <div class="col-md-4">
        
               <div class="card" >
  
                  <div class="card-body">
                       <h5 class="card-title">Java Programming</h5>
                       <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                       <a href="#" class="btn btn-primary">Read more</a>
                  </div>
               </div>
             </div>
                          <div class="col-md-4">
        
               <div class="card" >
  
                  <div class="card-body">
                       <h5 class="card-title">Java Programming</h5>
                       <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                       <a href="#" class="btn btn-primary">Read more</a>
                  </div>
               </div>
             </div>  
            
             
             
             
         </div>

         
     </div>
    
    
    
    
    
          <!--  JavaScript -->
          
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
          
   <!--  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script> -->
    
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    
    <script src="js/myjs.js" type="text/javascript"></script>

    
</body>
</html>