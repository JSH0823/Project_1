<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="/Web_project1/bootstrap-5.1.3-dist/css/uikit.min.css">
<meta charset="EUC-KR">
<title>TRAVELER_Planner</title>
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
              <li><a class="dropdown-item" href="#">Information</a></li>
              <li><a class="dropdown-item" href="#">Like</a></li>
              <li><a class="dropdown-item" href="login.jsp">Login/Logout</a></li>
            </ul>
          </li>
        </ul>
      </div>
      </div>
      </nav>
      </section>
      <div class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center bg-light">
    <div class="col-md-5 p-lg-5 mx-auto my-5">
      <h1 class="display-4 fw-normal" style="font-weight:bolder;">TRAVELER PLANNER</h1>
      <p class="lead fw-normal">여행 가기 전! 나만의 여행 스케줄을 작성해보세요.<br>언제, 어디에서나 편하게!</p>
      <a class="btn btn-outline-secondary" style="width:150px;" href="MainForm.jsp">Create Planner</a>
      <a class="btn btn-outline-secondary" style="width:150px;" href="viewP.jsp">View My Planer</a>
    </div>
    <div class="product-device shadow-sm d-none d-md-block" style="position:absolute;right:10%;bottom:-30%;width:300px;height:540px;background-color:#333;border-radius:21px;transform:rotate(30deg);display:block!important;box-shadow:0 .125rem .25rem rgba(0,0,0,.075)!important;">
    	<div style="position:absolute;top:10%;rigth:10px;bottom:10%;left:10px;background-color:rgba(255, 255, 255, .1);border-radius:5px;box-sizing:border-box;"></div>
    	</div>
    <div class="product-device product-device-2 shadow-sm d-none d-md-block" style="position:absolute;width:300px;heigth:540px;border-radius:21px;transform:rotate(30deg);top:-25%;rigth:auto;borrom:0;left:5%;background-color:#e5e5e5;display:block!important;box-shadow: 0 .125rem .25rem rgba(0,0,0,.075)!important;">
    	<div style="position:absolute;top:10%;rigth:10px;bottom:10%;left:10px;background-color:rgba(255, 255, 255, .1);border-radius:5px;box-sizing:border-box;"></div>
    	</div>
  </div>
  <div class="d-md-flex flex-md-equal w-100 my-md-3 ps-md-3" style="padding-left:1rem!important;margin-top:1rem!important;margin-bottom:1rem!important;display:flex!important;width:100%important;">
    <div class="text-bg-dark me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden" style="padding-right:3rem!important;padding-left:3rem!important;margin-left:1rem!important;text-align:center!important;overflow:hidden!important;color:#fff!important;background-color:RGBA(33,37,41,var(--bs-bg-opacity,1))!important;width:48%;">
      <div class="my-3 py-3">
        <h2 class="display-5" style="font-weight:bolder;">다른 사람들은 어떻게 짜지?</h2>
        <p class="lead">다른 사람들의 스케줄을 참고하여 작성해보세요</p>
      </div>
      <div class="bg-light shadow-sm mx-auto" style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;"></div>
    </div>
    <div class="bg-light me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden" style="width:48%;">
      <div class="my-3 p-3">
        <h2 class="display-5" style="font-weight:bolder;">여행 스케줄 최적화!</h2>
        <p class="lead">내가 가고 싶은 곳들만 최적의 스케줄로 작성해보세요</p>
      </div>
      <div class="bg-dark shadow-sm mx-auto" style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;"></div>
    </div>
  </div>
       
</body>
</html>