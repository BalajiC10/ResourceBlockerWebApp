	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	
	<title>loginagain Page</title>
	<style>
	@import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@600&display=swap'); 
	    body {
	       background: linear-gradient(90deg, #00d2ff 0%, #3a47d5 100%);
	       color: #ffffff;
	     }
	    h1{
	       font-size: 40px;
	       text-align: center;
	       margin-top: 20%;
	       color: #ffffff;
	       font-family: "Montserrat";
	       font-weight: 400;
	    }
	    span{
	       color: black;
	       font-size: 30px;
	       font-weight: 200;
	    }
	    p{
	       text-align: center;
	       margin-top: -20px;
	       font-size: 18px;
	       letter-spacing: 3px;
	    }
	    button{
	       margin: auto;
	       display: block;
	    }
	    .btn{
	       background-color: transparent;
	       border: 2px solid ;
	       border-radius: 0.6rem;
	       color: black;
	       font-size: 1rem;
	   	
	       padding: 1.2em 2.5em;
	       cursor: grab;
	       text-align: center;
	       text-transform: uppercase;
	       font-family:"Montserrat" ;
	       font-weight: 900;   
	       font-color: black; 
	    }
	   
	    .btn:hover{
	       color: #ffffff;
	       outline: 0;
	    }
	    .lco{
	       transition: box-shadow 300ms ease-in-out color 300ms ease-in-out;
	    }
	    .lco1{
	       transition: box-shadow 300ms ease-in-out color 300ms ease-in-out;
	       
	    }
	    .lco:hover {
	     box-shadow: 0 0 40px 40px #1f1f1f inset;
	   }
	.lco1:hover {
	    box-shadow: 0 0 40px 40px #1f1f1f inset;
	   }
	</style>
	</head>
	<body>
	
			
		 <h1>Session expired...! <br><span>Please login again</span> </h1> 
	    <p></p> 
	    <button class="btn lco"><a href="../logout" style="color:black">home</a></button><br>
	     
	
	</body>
	</html>