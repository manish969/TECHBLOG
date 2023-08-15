<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register JSP Page</title>

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
    
        <main class="primary-background banner-background" style="padding-bottom: 80px;">
        
            <div class="container">
            
                <div class="col-md-6 offset-md-3">
                
                    <div class="card">
                       <div class="card-header text-center primary-background text-white">
                         <span class="fa fa-3x fa-user-circle"></span>
                         <br>
                         Register here
                       </div>
                       <div class="card-body">
                         <form id="reg-form" action="RegisterServlet" method="POST">
                             <div class="mb-3">
                               <label for="user_name" class="form-label">User name</label>
                               <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholer="Enter name">
                               
                             </div>
                             <div class="mb-3">
                               <label for="exampleInputEmail1" class="form-label">Email address</label>
                               <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                               <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                             </div>
                             <div class="mb-3">
                               <label for="exampleInputPassword1" class="form-label">Password</label>
                               <input name="user_password" type="password" class="form-control" id="exampleInputPassword1">
                             </div>
                             <div class="mb-3">
                               <label for="gender" class="form-label">Select Gender</label>
                               <br>
                               <input type="radio" id="gender" name="gender" value="male" >Male
                               <input type="radio" id="gender" name="gender" value="female" >Female
                             </div>
                             
                             <div class="form-group">
                             
                                 <textarea name="about" class="form-control" id="" rows="5" placeholder="Enter something about yourself"></textarea>
                             
                             </div>
                             <div class="mb-3 form-check">
                               <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                               <label class="form-check-label" for="exampleCheck1">agree terms and conditions</label>
                             </div>
                             <br>
                             
                             <div class="container text-center" id="loader" style="display:none;">
                                 <span class="fa fa-refresh fa-spin fa-4x"></span>
                                 <h4>Please wait......</h4>
                             </div>
                             
                             <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
                           </form>
                       </div>
                       
                    
                    </div>
                
                
                </div>
            
            </div>
        
        </main>



       <!--  JavaScript -->
          
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
          
    
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    
    <script src="js/myjs.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    
      <script>
      
           $(document).ready(function() {
        	   console.log("loaded........")
        	   
        	   $('#reg-form').on('submit', function (event) {
        		   event.preventDefault();
        		   
        		   let form=new FormData(this);
        		   
        		   $("#submit-btn").hide();
        		   $("#loader").show();
        		   
        		   //send register servlet:
        			   
        		   $.ajax({
        			   url: "RegisterServlet",
        			   type: 'POST',
        			   data: form,
        			   success: function (data, textStatus, jqXHR) {
        				   console.log(data)
        				   
        				   $("#submit-btn").show();
                		   $("#loader").hide();
                		   
                		   if(data.trim() === 'done')
                			{
              		   
                		   swal("Registered successfully...We are going to redirect to login page")
                		   .then((value) => {
                		    window.location="login_page.jsp"
                		   });
                		   
                			} else
                			{
                				swal(data);
                			}
                				         				   
        			   },
        			   error: function (jqXHR, textStatus, errorThrown) {
        				 
        				   
        				   $("#submit-btn").show();
                		   $("#loader").hide();
        				   
        				   swal("Something went wrong...try again");
                		          				   
        			   },
        			   processData: false,
        			   contentType: false
        			   
        		   });
        		   
        		   
        	   });
           });
         
      </script>




</body>
</html>