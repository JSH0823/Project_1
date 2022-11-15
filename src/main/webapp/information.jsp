<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.net.URLDecoder" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="/Web_project1/bootstrap-5.1.3-dist/css/uikit.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<link rel="shortcut icon" href="/img/favicon.ico">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>Information</title>
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
          <li class="nav-item">
            <a class="nav-link" href="planner.jsp" style="background-color:gray;">Planner</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="search.jsp">Search</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="dropdown08" data-bs-toggle="dropdown" aria-expanded="false">My</a>
            <ul class="dropdown-menu" aria-labelledby="dropdown08">
              <li><a class="dropdown-item" href="information.jsp">Information</a></li>
              <li><a class="dropdown-item" href="login.jsp">Login/Logout</a></li>
            </ul>
          </li>
        </ul>
      </div>
      </div>
      </nav>
      </section>
<body class="bg-light">
    <%    	
    	String e_mail = (String)request.getAttribute("e_mail");
    	
    	String name =new String((request.getParameter("name")).getBytes("8859_1"), "UTF-8");
    	name = name.substring(0,3);
    	
    	if(e_mail == null){
    		e_mail = " ";
    	}
   		if(name == null){
   			name = "로그인해주세요";
   		}
    %>
<div class="container">
  <main>
    <div class="py-5 text-center">
      <img class="d-block mx-auto mb-4"  src="/img/TRAVELING.png" alt="" width="200" height="100">
    </div>

    <div class="row g-5" style="float:left;width:90%;margin-left:250px;">
      <div class="col-md-7 col-lg-8">
        <h4 class="mb-3">Information</h4>
        
          <div class="row g-3">
            <div class="col-sm-6">
              <label for="firstName" class="form-label">Name</label>
				<p style="size:100px;"><%=name %></p>
              <div class="invalid-feedback">
                Valid first name is required.
              </div>
            </div>

            <div class="col-12">
              <label for="username" class="form-label">E-MAIL Address</label>
              <div class="input-group has-validation">
                <span class="input-group-text">@</span>
                <p style="size:100px;margin-left:30px;margin-top:10px;"><%=e_mail%></p>
              <div class="invalid-feedback">
                  Your username is required.
                </div>
              </div>
            </div>

			<form class="needs-validation" action="Db_con" method = 'post'>
          <hr class="my-4">
          	<input type='hidden' value='<%=name %>' name = "nickname">
			<input type='hidden' value='<%=e_mail %>' name = "email">
          <button class="w-100 btn btn-primary btn-lg" style="margin-bottom:100px;"type="submit">OK</button>
        </form>
      </div>
    </div>
   
  </main>
</div>
    <script src="/docs/5.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
      <script src="form-validation.js"></script>
</body>
</body>
</html>