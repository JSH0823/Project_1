<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="db.Db_func, java.net.URLDecoder" %>
<!DOCTYPE html>
<html>
<head profile="http://www.w3.org/2005/10/profile">
<meta charset="utf-8">
<title>TRAVELER</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="/Web_project1/bootstrap-5.1.3-dist/css/uikit.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<link rel="icon" href="/img/favicon.ico">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
	#wrap {
		width: 800px;
		margin: 0 auto 0 auto;}
	#header {
		text-align: center;
		width: 800px;
		height: 150px;
		background-color:lightgray;;
		padding: 60px 0px;
		}
	#main {
	    float: left;
	    width: 800px;
	    height: 500px;
		background-color: #FFCA6C;
		text-align:center;
		vertical-align: middle;}
	#footer {
		clear: left;
		width: 800px;
		height: 60px;
		background-color: #7DFE74;}
</style>
<% 
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
String email = (String)request.getAttribute("email");
	String name =(String)request.getAttribute("name");
	String day = (String)request.getAttribute("day");
	

		if(day==null){
			day = " ";
		}
	%>
</head>
<body>
<section>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark" aria-label="Tenth navbar example">
    <div class="container-fluid" id='wrap'>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample08" aria-controls="navbarsExample08" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample08">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">TRAVELER</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="index.jsp">Home</a>
          </li>
          <li>
           <form action="Goinfo" method="post">
             <input type="hidden" name="name" id="name" value = "<%=name %>">
          	<input type="hidden" name="email" id="email" value = "<%=email %>">
            <button  style="background-color:transparent;border-color:transparent;color:rgba(255, 255, 255, .5);margin-left:5px;margin-right:5px;border-bottom:0.25rem solid transparent;"class="nav-link fw-bold py-1 px-0">Planner</button>
            </form>
            </li>
          <li class="nav-item">
            <a class="nav-link" href="search.jsp">Search</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="dropdown08" data-bs-toggle="dropdown" aria-expanded="false">My</a>
            <ul class="dropdown-menu" aria-labelledby="dropdown08">
              <li><a class="dropdown-item" href="#">Information</a></li>
              <li><a class="dropdown-item" href="login.jsp">Login/Logout</a></li>
            </ul>
          </li>
        </ul>
      </div>
      </div>
      </nav>
      </section>
      
   <!--     <script type="text/javascript">
  	window.onload = function() {
  		today = new Date();
  		console.log("today.toISOString() >>>" + today.toISOString());
  		today = today.toISOString().slice(0, 10);
  		console.log("today >>>> " + today);
  		bir = document.getElementById("todaybirthday");
  		bir.value = today.value;
  	}-->
  </script>
			<div style="background-color:#F5F5F5;width:100%;height:100%;padding:10px;">
				<p>이름 : 정수현</p> 
				<p>E-mail : <%=email %></p>
				<p>여행 날짜 : <%=day %></p>
			</div>         
		<div id="main">
			<form action="search_day" method="post" style="margin-left:210px;">
      
					<input type='date' value='2022-11-23' name = "todaybirthday" id = 'todaybirthday'>
					<input type='hidden' value='<%=email %>' name = "email" id = 'email'>
					<input type='hidden' value='<%=name %>' name = "name" id = 'name'>
					<input type='hidden' value='<%=day %>' name='day' id='day'>
					<input type="submit" value="검색" >
				</form>            
			<jsp:include page="tPlan.jsp"/>       
		</div>        
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</html>