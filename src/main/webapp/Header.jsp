<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="/Web_project1/bootstrap-5.1.3-dist/css/uikit.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
    function changeView(value){                        
	if(value == "0") // HOME 버튼 클릭시 첫화면으로 이동            
	{                
		location.href="MainForm.jsp";            
	}            
	else if(value == "1") // 관광명소 버튼 클릭시 로그인 화면으로 이동            
	{                
		location.href="MainForm.jsp?contentPage=place.jsp";
	}            
	else if(value == "2") // 음식점 버튼 클릭시 회원가입 화면으로 이동            
	{                
		location.href="MainForm.jsp?contentPage=restaurant.jsp";            
	}            
	else if(value == "3") // 여행일정 버튼 클릭시 로그아웃 처리            
	{                
		location.href="MainForm.jsp?contentPage=tPlan.jsp";            
	}     
}    
</script>
<script>
$('input[name=btnradio]').change(function(){
	var value = $(this).val();
	var checked = $(this).prop('checked');
	confirm(value);
});
</script>
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
              <li><a class="dropdown-item" href="#">Like</a></li>
              <li><a class="dropdown-item" href="login.jsp">Login/Logout</a></li>
            </ul>
          </li>
        </ul>
      </div>
      </div>
      </nav>
      </section>
<div id='wrap' style="margin-top:100px;textcolor:lightblue;">      
	<div class="btn-group" style="width:90%;padding-left:160px;justify-content:center;margin-bottom:50px;textcolor:lightblue;"role="group" aria-label="Basic radio toggle button group">
	  <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" value='0'>
	  <label class="btn btn-outline-primary" for="btnradio1" onclick="changeView(0)" style="background-color:lightblue;"> 홈</label>
	
	  <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off" value='1'>
	  <label class="btn btn-outline-primary" for="btnradio2" onclick="changeView(1)" >관광명소</label>
	 
	  <input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off" value='2'>
	  <label class="btn btn-outline-primary" for="btnradio3" onclick="changeView(2)">음식점</label>
	  
	  <input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off" value='3'>
	  <label class="btn btn-outline-primary" for="btnradio3" onclick="changeView(3)">여행 일정</label>
	  
	</div>
</div>
</body>
</html>