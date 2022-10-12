<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="/Web_project1/bootstrap-5.1.3-dist/css/uikit.min.css">
<meta charset="EUC-KR">
<title>TRAVELER</title>
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
            <a class="nav-link" href="planner.jsp">Planner</a>
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
      </section>
      <style>
      	.back {
      		background-image:url('C:\Users\jeong\OneDrive\바탕 화면\city.gif');
      		
      	}
      </style>
      <section class="py-5 text-center container" ref="sl1" class="back">
    <div class="row py-lg-5" ref="sticky-container" >
      <div class="col-lg-6 col-md-8 mx-auto" ref="scdown" >
        <h1 class="fw-light" >나만의 여행 플래너 TRAVELER!</h1>
        <p class="lead text-muted">쉽고 빠르게 여행 계획하세요</p>
      </div>
      <div class="card-body row no-gutters align-items-center">
      <div class="col-auto"> 
      <i class="fas fa-search h4 text-body"></i>
      </div><div class="col"> 
      <input class="form-control form-control-lg form-control-borderless" type="search" placeholder="시,군,구를 검색해보세요."></div><div class="col-auto"> 
      <button class="btn btn-lg btn-success" type="submit">Search</button>
      </div>
      </div>
    </div>
  </section>
  
 <style>
    @keyframes fadeInLeft {
        0% {
            opacity: 0;
            transform: translate3d(-20%, 0, 0);
        }
        to {
            opacity: 1;
            transform: translateZ(30);
        }
    }
 
    .test_obj {
        position: relative;
        animation: fadeInLeft 1s;
    }
</style>
<div style="margin: 0px; padding: 0px; transform: translateX(-30px) translateY(24px) scale(0.88); opacity: 0.76;" class="uk-width-2-5@m uk-first-column" uk-parallax="opacity: 0,1,1; y: 100,0,0; x: -100,-100,0; scale: 0.5,1,1; viewport: 0.5;">
	<div style="
                            background-color: #fafafa;
                            height: 300px;
                            display: flex;
                            justify-content: center;
                            align-items: center;
                        "
                        class="test_obj">
		<h6>
                            여행 일자, 가고 싶은 장소를
                            <br>

                            최적의 계획으로 짤 수 있도록 도와주는	
                            <br>
                            쉽고 간편한 여행 일정 플래너 <b>TRAVELER</b></h6>
                            </div>
                            </div>
  
  <div class="uk-grid-match main-bottom-container uk-grid" uk-grid="">
                <div style="margin: 0; padding: 0" class="uk-width-3-5@m">
                    <div>
                        <div class="row" style="height: 300px">
                            <div style="
                                    margin: 0;
                                    padding: 0;
                                    display: flex;
                                    justify-content: center;
                                    align-items: center;
                                    flex-direction: column;
                                    background-color: #fff;
                                    height: 100%;
                                " class="col s12 m4">
                                <h4 style="font-family: 'Montserrat' !important">
                                    <b>STEP 1</b>
                                </h4>
                                <div>여행지선택</div>
                            </div>
                            <div style="
                                    margin: 0;
                                    padding: 0;
                                    display: flex;
                                    justify-content: center;
                                    align-items: center;
                                    flex-direction: column;
                                    background-color: #fff;
                                    height: 100%;
                                " class="col s12 m4">
                                <h4 style="font-family: 'Montserrat' !important">
                                    <b>STEP 2</b>
                                </h4>
                                <div>장소선택</div>
                            </div>
                            <div style="
                                    margin: 0;
                                    padding: 0;
                                    display: flex;
                                    justify-content: center;
                                    align-items: center;
                                    flex-direction: column;
                                    background-color: #fff;
                                    height: 100%;
                                " class="col s12 m4">
                                <h4 style="font-family: 'Montserrat' !important">
                                    <b>STEP 3</b>
                                </h4>
                                <div>일정생성</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
  <div class="album py-5 bg-light">
    <div class="container">

      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
        <div class="col">
          <div class="card shadow-sm">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"></rect><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>

            <div class="card-body">
              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"></rect><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>

            <div class="card-body">
              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"></rect><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>

            <div class="card-body">
              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
	<footer>
		<div class="container">
 		<footer class="py-3 my-4">
   		 <ul class="nav justify-content-center border-bottom pb-3 mb-3">
     	 <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Home</a></li>
     	 <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Features</a></li>
     	 <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Pricing</a></li>
     	 <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">FAQs</a></li>
     	 <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">About</a></li>
    	</ul>
   		 <p class="text-center text-muted">© 2022 Student, Jung</p>
  		</footer>
		</div>
		<script src="/Web_project1/bootstrap-5.1.3-dist/js/myro1.js"></script>
	</footer>
</div>
</nav>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</html>