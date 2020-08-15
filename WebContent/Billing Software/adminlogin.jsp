<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>


<html>
<head>
<link rel="icon" href="images/favicon.ico">
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet" href="login2.css">
	<title>Login</title>
   
   
	<!--Bootstrap 4 CDN-->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" >
    
    <!--Font awesome CDN-->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">

	<!--Custom styles-->
	<link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body style="background-color:lemonchiffon">
<div class="container">
	<div class="d-flex justify-content-center h-100">
		<div class="card">
			<div class="card-header">
				<h3>Admin Sign In</h3>
				
			</div>
			<div class="card-body">
				<form>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="text" class="form-control" id="user" autocomplete="off" placeholder="username">
						
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-key"></i></span>
						</div>
						<input type="password" class="form-control" id="pass" placeholder="password">
					</div>
					
					<div class="form-group">
						
						<input type="button" value="Login" onclick="login()" class="btn float-right login_btn">
						<input type="button" value="Cancel" onclick="back()" style="margin-right:15px;" class="btn float-right login_btn"><span>&nbsp;&nbsp;</span>
					</div>
				</form>
			</div>
			<div class="card-footer">
				
				<div class="d-flex justify-content-center">
					<a href="#">Forgot your password?</a>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">

function login(){
	var adminid = "9479532492";
	var pass = "3003";
	var id = $('#user').val();
	var password = $('#pass').val();
	
			if(id==adminid && password==pass){
				
				alert("Login Successful, Welcome Vinay Pandit!");
				window.location = "database.jsp";
				}
			else{
				alert("Login Failed! Try again.");
				location.reload(true);
			}			 
		}	

	
	function back(){
		
		$.ajax({
			type: "GET",
			url: "login.jsp",
			data:{math :10},
			success: function(data){
				if(confirm("Are you sure, you wanna go back?"))
					window.location = "index.jsp";
					else
						return false;
			}
		});
	}
	
</script>

</body>
</html>
<!--  -->
