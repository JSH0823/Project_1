<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="height:100%!important;">
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="/Web_project1/bootstrap-5.1.3-dist/css/uikit.min.css">
<link rel="shortcut icon" href="favicon.ico">
<meta charset="EUC-KR">
<title>TRAVELER</title>
<script type="text/javascript">

 function keyword_check(){

  if(document.search.keyword.value==''){ //검색어가 없을 경우  

  alert('검색어를 입력하세요'); //경고창 띄움 

  document.search.keyword.focus(); //다시 검색창으로 돌아감 

  return false; 

  }

  else return true;

 }
 
 function postKeyword(){
	 var addr = 'search.jsp'
	 const var kw = document.getElementById("keyword").value;
	 localStorage.setItem('key',kw);
	 alert(kw);
	 location.href = addr.concat(kw);
 }

</script>
<style>
/*
 * Globals
 */


/* Custom default button */
.btn-secondary,
.btn-secondary:hover,
.btn-secondary:focus {
  color: #333;
  text-shadow: none; /* Prevent inheritance from `body` */
}


/*
 * Base structure
 */

body {
  text-shadow: 0 .05rem .1rem rgba(0, 0, 0, .5);
  box-shadow: inset 0 0 5rem rgba(0, 0, 0, .5);
}

.cover-container {
  max-width: 100%;
}
@media (min-width: 992px)
.py-lg-5 {
    padding-top: 3rem!important;
    padding-bottom: 3rem!important;
}
.row {
    --bs-gutter-x: 1.5rem;
    --bs-gutter-y: 0;
    display: flex;
    flex-wrap: wrap;
    margin-top: calc(-1 * var(--bs-gutter-y));
    margin-right: calc(-.5 * var(--bs-gutter-x));
    margin-left: calc(-.5 * var(--bs-gutter-x));
    justify-content:center;
    align-items:center;
}
@media (min-width: 992px)
.py-lg-5 {
    padding-top: 3rem!important;
    padding-bottom: 3rem!important;
}

/*
 * Header
 */

.nav-masthead .nav-link {
  color: rgba(255, 255, 255, .5);
  border-bottom: .25rem solid transparent;
}

.nav-masthead .nav-link:hover,
.nav-masthead .nav-link:focus {
  border-bottom-color: rgba(255, 255, 255, .25);
}

.nav-masthead .nav-link + .nav-link {
  margin-left: 1rem;
}

.nav-masthead .active {
  color: #fff;
  border-bottom-color: #fff;
}
.px-3 {
    padding-right: 1rem!important;
    padding-left: 1rem!important;
    margin-left:170px;
}

</style>
</head>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.104.2">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/cover/">

    
<link href="/docs/5.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.2/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.2/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.2/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#712cf9">


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
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
    .image1 {
    background: url(https://cdn.pixabay.com/photo/2020/07/14/16/18/snow-5404785_960_720.jpg) no-repeat;
    background-size:100% 100%;
}
    </style>

    
    <!-- Custom styles for this template -->
    <link href="cover.css" rel="stylesheet">
  </head>
  <body class="d-flex h-100 text-center text-bg-dark">
    
<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column image1" style="position:relative;">
  <header class="mb-auto">
    <div>
      <h3 class="float-md-start mb-0" style="font-weight:bolder; padding-left:50px;color:white;">TRAVELER</h3>
      <nav class="nav nav-masthead justify-content-center float-md-end">
        <a class="nav-link fw-bold py-1 px-0 active" aria-current="page" href="#">Home</a>
        <a class="nav-link fw-bold py-1 px-0" href="planner.jsp">Planner</a>
        <a class="nav-link fw-bold py-1 px-0" href="search.jsp">Search</a>
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle nav-link fw-bold py-1 px-0" style="margin-left:1rem;" href="#" id="dropdown08" data-bs-toggle="dropdown" aria-expanded="false">My</a>
            <ul class="dropdown-menu " aria-labelledby="dropdown08">
              <li><a class="dropdown-item" href="restaurant.jsp">Information</a></li>
              <li><a class="dropdown-item" href="#">Like</a></li>
              <li><a class="dropdown-item" href="login.jsp">Login/Logout</a></li>
            </ul>
         </li>  
      </nav>
    </div>
  </header>

  <main class="px-3" style="width:80%!important;">
    <div class="row py-lg-5" style="width:100%!important;">
      <div class="col-lg-6 col-md-8 mx-auto" ref="scdown" >
        <h1 class="fw-light">나만의 여행 플래너 TRAVELER!</h1>
        <p class="lead text-muted">쉽고 빠르게 여행 계획하세요</p>
      </div>
      <div class="card-body row no-gutters align-items-center" style="width:100%;">
      <div class="col-auto"> 
      <i class="fas fa-search h4 text-body"></i>
      </div>
	<div class="col" style = "width:90%">
      <form name="search"  method = "post" action ="search.jsp" enctype = "utf-8" >
      <input class="form-control form-control-lg form-control-borderless" style="width:90%; margin:auto; margin-right:0px; float:left; "  type="search" placeholder="시,군,구를 검색해보세요." name="keyword">
      <button class="btn btn-lg btn-success" type="submit" value="search" onclick="postKeyword()" style = "float:left; margin-left:1%; border-color:#87cefa;background-color:#87cefa;">Search</button>
      </form>	
      </div>
      </div>
    </div>
  </main>
 
</div>
  

</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</html>