<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://kit.fontawesome.com/07a7cc3607.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
#mySidenav a {
  position: absolute;
  left: -100px;
  transition: 0.3s;
  padding: 15px;
  width: 120px;
  text-decoration: none;
  font-size: 20px;
  color: white;
  border-radius: 0 5px 5px 0;
}

#mySidenav a:hover {
  left: 0;
}

#about {
  top: 200px;
  background-color: #4CAF50;
}

#facebook {
  top: 260px;
  background-color: #3b5998;
}

#projects {
  top: 320px;
  background-color: #0077B5;
}

#contact {
  top: 380px;
  background-color: #1DA1F2;
}
</style>
</head>
<body>

<div id="mySidenav" class="sidenav">
  <a href="about_us.jsp" id="about">About</a>
  <a href="https://www.facebook.com/vinay.pandit.167" id="facebook"><i class="fab fa-facebook-f"></i>   Vinay</a>
  <a href="#" id="projects">Projects</a>
  <a href="#" id="contact">Feedback</a>
</div>


   
</body>
</html> 
