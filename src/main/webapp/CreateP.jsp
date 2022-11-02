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
<title>TRAVELER_Create</title>
<script>
function getLocation(){
    if(navigator.geolocation){
        navigator.geolocation.getCurrentPosition(locationSuccess, locationError, geo_options);
    }else{
        console.log("지오 로케이션 없음")
    }
};
// getLocation
function locationSuccess(p){
        var latitude = p.coords.latitude,
        longitude = p.coords.longitude;
        var rs = dfs_xy_conv("toXY",latitude,longitude);
        // 위도/경도 -> 기상청 좌표x / 좌표 y 변환
        xml2jsonCurrentWth(rs.nx, rs.ny);
    }
// locationSuccess
 function locationError(error){
        var errorTypes = {
            0 : "무슨 에러냥~",
            1 : "허용 안눌렀음",
            2 : "위치가 안잡힘",
            3 : "응답시간 지남"
        };
        var errorMsg = errorTypes[error.code];
        console.log(errorMsg)
    }
    // locationError
    var geo_options = {
        enableHighAccuracy: true,
        maximumAge        : 30000,
        timeout           : 27000
    };
    // geo_options
    // LCC DFS 좌표변환을 위한 기초 자료
    //
    var RE = 6371.00877; // 지구 반경(km)
    var GRID = 5.0; // 격자 간격(km)
    var SLAT1 = 30.0; // 투영 위도1(degree)
    var SLAT2 = 60.0; // 투영 위도2(degree)
    var OLON = 126.0; // 기준점 경도(degree)
    var OLAT = 38.0; // 기준점 위도(degree)
    var XO = 43; // 기준점 X좌표(GRID)
    var YO = 136; // 기1준점 Y좌표(GRID)
    //
    // LCC DFS 좌표변환 ( code : "toXY"(위경도->좌표, v1:위도, v2:경도), "toLL"(좌표->위경도,v1:x, v2:y) )
    //
function dfs_xy_conv(code, v1, v2) {
    var DEGRAD = Math.PI / 180.0;
    var RADDEG = 180.0 / Math.PI;
    var re = RE / GRID;
    var slat1 = SLAT1 * DEGRAD;
    var slat2 = SLAT2 * DEGRAD;
    var olon = OLON * DEGRAD;
    var olat = OLAT * DEGRAD;
    var sn = Math.tan(Math.PI * 0.25 + slat2 * 0.5) / Math.tan(Math.PI * 0.25 + slat1 * 0.5);
    sn = Math.log(Math.cos(slat1) / Math.cos(slat2)) / Math.log(sn);
    var sf = Math.tan(Math.PI * 0.25 + slat1 * 0.5);
    sf = Math.pow(sf, sn) * Math.cos(slat1) / sn;
    var ro = Math.tan(Math.PI * 0.25 + olat * 0.5);
    ro = re * sf / Math.pow(ro, sn);
    var rs = {};
    if (code == "toXY") {
        rs['lat'] = v1;
        rs['lng'] = v2;
        var ra = Math.tan(Math.PI * 0.25 + (v1) * DEGRAD * 0.5);
        ra = re * sf / Math.pow(ra, sn);
        var theta = v2 * DEGRAD - olon;
        if (theta > Math.PI) theta -= 2.0 * Math.PI;
        if (theta < -Math.PI) theta += 2.0 * Math.PI;
        theta *= sn;
        rs['nx'] = Math.floor(ra * Math.sin(theta) + XO + 0.5);
        rs['ny'] = Math.floor(ro - ra * Math.cos(theta) + YO + 0.5);
    }
    else {
        rs['nx'] = v1;
        rs['ny'] = v2;
        var xn = v1 - XO;
        var yn = ro - v2 + YO;
        ra = Math.sqrt(xn * xn + yn * yn);
        if (sn < 0.0) - ra;
        var alat = Math.pow((re * sf / ra), (1.0 / sn));
        alat = 2.0 * Math.atan(alat) - Math.PI * 0.5;
        if (Math.abs(xn) <= 0.0) {
            theta = 0.0;
        }
        else {
            if (Math.abs(yn) <= 0.0) {
                theta = Math.PI * 0.5;
                if (xn < 0.0) - theta;
            }
            else theta = Math.atan2(xn, yn);
        }
        var alon = theta / sn + olon;
        rs['lat'] = alat * RADDEG;
        rs['lng'] = alon * RADDEG;
    }
    return rs;
}
// dfs_xy_conv
function xml2jsonCurrentWth(nx, ny){
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1;
    var yyyy = today.getFullYear();
    var hours = today.getHours();
    var minutes = today.getMinutes();
    console.log("time " + minutes)
    if(minutes < 30){
        // 30분보다 작으면 한시간 전 값
        hours = hours - 1;
        if(hours < 0){
            // 자정 이전은 전날로 계산
            today.setDate(today.getDate() - 1);
            dd = today.getDate();
            mm = today.getMonth()+1;
            yyyy = today.getFullYear();
            hours = 23;
        }
    }
    if(hours<10) {
        hours='0'+hours
    }
    if(mm<10) {
        mm='0'+mm
    }
    if(dd<10) {
        dd='0'+dd
    } 
    var _nx = nx,
    _ny = ny,
    apikey = "%2F6riuJsxV8Ynlwoz%2FKiCbqM8eOBZpTGOLqGGsaCWYET9%2BHY7stjYxXH%2FOWGq75bO8wdqgps%2F4ajJ%2BgbsKU3DXg%3D%3D",
    today = yyyy+""+mm+""+dd,
    basetime = hours + "00",
    fileName = "http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService/ForecastGrib";
    fileName += "?ServiceKey=" + apikey;
    fileName += "&base_date=" + today;
    fileName += "&base_time=" + basetime;
    fileName += "&nx=" + _nx + "&ny=" + _ny;
    fileName += "&pageNo=1&numOfRows=6";
    fileName += "&_type=json";
    $.ajax({
        url: fileName,
        type: 'GET',
        cache: false,
        success: function(data) {
            var myXML = rplLine(data.responseText);
            var indexS = myXML.indexOf('"body":{"items":{'),
                indexE = myXML.indexOf("}]}"),
                result = myXML;
//                result = myXML.substring(indexS, indexE);
            var jsonObj = $.parseJSON('[' + result + ']'),
                rainsnow = jsonObj[0].response.body.items.item[0].obsrValue,
                sky = jsonObj[0].response.body.items.item[4].obsrValue,
                temp = jsonObj[0].response.body.items.item[5].obsrValue;
                var contentText = document.getElementById('content');
            contentText.innerHTML = "하늘 상태 : " + sky + " / 눈 비 상태 : " + rainsnow + " / 온도 : " + temp;
        },
        error:function(request,status,error){
            alert("다시 시도해주세요.\n" + "code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
        });
}
// xml2jsonCurrentWth
function rplLine(value){
    if (value != null && value != "") {
        return value.replace(/\n/g, "\\n");
    }else{
        return value;
    }
}
// rplLine
$(document).ready(function(){
	  $('.slider').slider();
	});
function change_home() {
    var p = document.getElementById("firstP");
    p.innerHTML= "<div src=''>";
}
function change_place() {
    var p = document.getElementById("firstP");
    p.innerHTML= "<div src=''>";
}
function change_restaurant() {
    var p = document.getElementById("restaurant");
    p.innerHTML = "<a href='restaurant.jsp'>";
}
function change_plan() {
    var p = document.getElementById("firstP");
    p.innerHTML= "<div src=''>";
}
function change_map() {
    var p = document.getElementById("firstP");
    p.innerHTML= "<div src=''>";
}
</script>
<script type="text/javascript" src="./js/jquery.xdomainajax.js"></script>
<style>

/* Carousel base class */
.carousel {
  margin-bottom: 4rem;
}
/* Since positioning the image, we need to help out the caption */
.carousel-caption {
  bottom: 3rem;
  z-index: 10;
}

/* Declare heights because of positioning of img element */
.carousel-item {
  height: 32rem;
}


/* MARKETING CONTENT
-------------------------------------------------- */

/* Center align the text within the three columns below the carousel */
.marketing .col-lg-4 {
  margin-bottom: 1.5rem;
  text-align: center;
}
/* rtl:begin:ignore */
.marketing .col-lg-4 p {
  margin-right: .75rem;
  margin-left: .75rem;
}
/* rtl:end:ignore */


/* Featurettes
------------------------- */

.featurette-divider {
  margin: 5rem 0; /* Space out the Bootstrap <hr> more */
}

/* Thin out the marketing headings */
/* rtl:begin:remove */
.featurette-heading {
  letter-spacing: -.05rem;
}

/* rtl:end:remove */

/* RESPONSIVE CSS
-------------------------------------------------- */

@media (min-width: 40em) {
  /* Bump up size of carousel content */
  .carousel-caption p {
    margin-bottom: 1.25rem;
    font-size: 1.25rem;
    line-height: 1.4;
  }

  .featurette-heading {
    font-size: 50px;
  }
}

@media (min-width: 62em) {
  .featurette-heading {
    margin-top: 7rem;
  }
}
.carousel {
  position: relative;
}

.carousel.pointer-event {
  touch-action: pan-y;
}

.carousel-inner {
  position: relative;
  width: 100%;
  overflow: hidden;
  @include clearfix();
}

.carousel-item {
  position: relative;
  display: none;
  float: left;
  width: 100%;
  margin-right: -100%;
  backface-visibility: hidden;
  @include transition($carousel-transition);
}

.carousel-item.active,
.carousel-item-next,
.carousel-item-prev {
  display: block;
}

/* rtl:begin:ignore */
.carousel-item-next:not(.carousel-item-start),
.active.carousel-item-end {
  transform: translateX(100%);
}

.carousel-item-prev:not(.carousel-item-end),
.active.carousel-item-start {
  transform: translateX(-100%);
}

/* rtl:end:ignore */


//
// Alternate transitions
//

.carousel-fade {
  .carousel-item {
    opacity: 0;
    transition-property: opacity;
    transform: none;
  }

  .carousel-item.active,
  .carousel-item-next.carousel-item-start,
  .carousel-item-prev.carousel-item-end {
    z-index: 1;
    opacity: 1;
  }

  .active.carousel-item-start,
  .active.carousel-item-end {
    z-index: 0;
    opacity: 0;
    @include transition(opacity 0s $carousel-transition-duration);
  }
}




.carousel-control-prev,
.carousel-control-next {
  position: absolute;
  top: 0;
  bottom: 0;
  z-index: 1;
  // Use flex for alignment (1-3)
  display: flex; // 1. allow flex styles
  align-items: center; // 2. vertically center contents
  justify-content: center; // 3. horizontally center contents
  width: $carousel-control-width;
  padding: 0;
  color: $carousel-control-color;
  text-align: center;
  background: none;
  border: 0;
  opacity: $carousel-control-opacity;
  @include transition($carousel-control-transition);

  // Hover/focus state
  &:hover,
  &:focus {
    color: $carousel-control-color;
    text-decoration: none;
    outline: 0;
    opacity: $carousel-control-hover-opacity;
  }
}
.carousel-control-prev {
  left: 0;
  background-image: if($enable-gradients, linear-gradient(90deg, rgba($black, .25), rgba($black, .001)), null);
}
.carousel-control-next {
  right: 0;
  background-image: if($enable-gradients, linear-gradient(270deg, rgba($black, .25), rgba($black, .001)), null);
}

// Icons for within
.carousel-control-prev-icon,
.carousel-control-next-icon {
  display: inline-block;
  width: $carousel-control-icon-width;
  height: $carousel-control-icon-width;
  background-repeat: no-repeat;
  background-position: 50%;
  background-size: 100% 100%;
}


.carousel-control-prev-icon {
  background-image: escape-svg($carousel-control-prev-icon-bg);
}
.carousel-control-next-icon {
  background-image: escape-svg($carousel-control-next-icon-bg);
}

.carousel-indicators {
  position: absolute;
  right: 0;
  bottom: 0;
  left: 0;
  z-index: 2;
  display: flex;
  justify-content: center;
  padding: 0;
  // Use the .carousel-control's width as margin so we don't overlay those
  margin-right: $carousel-control-width;
  margin-bottom: 1rem;
  margin-left: $carousel-control-width;
  list-style: none;

  [data-bs-target] {
    box-sizing: content-box;
    flex: 0 1 auto;
    width: $carousel-indicator-width;
    height: $carousel-indicator-height;
    padding: 0;
    margin-right: $carousel-indicator-spacer;
    margin-left: $carousel-indicator-spacer;
    text-indent: -999px;
    cursor: pointer;
    background-color: $carousel-indicator-active-bg;
    background-clip: padding-box;
    border: 0;
    // Use transparent borders to increase the hit area by 10px on top and bottom.
    border-top: $carousel-indicator-hit-area-height solid transparent;
    border-bottom: $carousel-indicator-hit-area-height solid transparent;
    opacity: $carousel-indicator-opacity;
    @include transition($carousel-indicator-transition);
  }

  .active {
    opacity: $carousel-indicator-active-opacity;
  }
}



.carousel-caption {
  position: absolute;
  right: (100% - $carousel-caption-width) * .5;
  bottom: $carousel-caption-spacer;
  left: (100% - $carousel-caption-width) * .5;
  padding-top: $carousel-caption-padding-y;
  padding-bottom: $carousel-caption-padding-y;
  color: $carousel-caption-color;
  text-align: center;
}

// Dark mode carousel

.carousel-dark {
  .carousel-control-prev-icon,
  .carousel-control-next-icon {
    filter: $carousel-dark-control-icon-filter;
  }

  .carousel-indicators [data-bs-target] {
    background-color: $carousel-dark-indicator-active-bg;
  }

  .carousel-caption {
    color: $carousel-dark-caption-color;
  }
}
.slider .indicators .indicator-item {
  background-color: #666666;
  border: 3px solid #ffffff;
  -webkit-box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
  -moz-box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
  box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
}
.slider .indicators .indicator-item.active {
  background-color: #ffffff;
}
.slider {
  width: 900px;
  margin: 0 auto;
}
.slider .indicators {
  bottom: 60px;
  z-index: 100;
  /* text-align: left; */
}


</style>
</head>
<body>
	<main>

  <div id="carouselExampleIndicators" class="carousel slide" style="width:50%;padding-left:50px;padding-top:50px;" data-bs-ride="true">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="water.jpg" style="height:100%;" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="home.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="grass.jpg" class="d-block w-100" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
<div><script>getLocation();</script></div>



  <div class="container marketing">

    <!-- Three columns of text below the carousel -->
    <div class="row">
      <div class="col-lg-4">
        <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="자리 표시자: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"></rect><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>

        <h2 class="fw-normal"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">제목</font></font></h2>
        <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">컴퓨터에는 지능이 없지만 분석 능력, 구성 능력, 논리적 추론이라는 세 가지 주요 기능 요소를 통해 인공 지능을 획득한다는 것을 항상 기억하십시오.</font></font></p>
        <p><a class="btn btn-secondary" href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">세부 정보보기</font></font></a></p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4">
        <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="자리 표시자: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"></rect><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>

        <h2 class="fw-normal"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">다른 제목</font></font></h2>
        <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">스마트 컴퓨터를 사용하여 아랍어를 처리하려는 경우 특히 우리 언어는 시스템의 일관성과 중복을 특징으로 하기 때문에 큰 도전에 직면하게 됩니다. 즉, 음운 처리, 형태 처리, 구문 처리 및 의미 처리.</font></font></p>
        <p><a class="btn btn-secondary" href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">세부 정보보기</font></font></a></p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4">
        <svg class="bd-placeholder-img rounded-circle" style="width:140px;height:140px;" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="자리 표시자: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"></rect><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>

        <h2 class="fw-normal"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">정보 확인을 위한 세 번째 주소</font></font></h2>
        <p>ㅓㅓㅓㅓㅓㅓ</p>
        <p><a class="btn btn-secondary" href="#">ㅏㅏㅏㅏ</a></p>
      </div><!-- /.col-lg-4 -->
    </div><!-- /.row -->


    <!-- START THE FEATURETTES -->

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7">
        <h2 class="featurette-heading fw-normal lh-1">ㅏㅏㅏㅏ <span class="text-muted">ㅓㅓㅓㅓㅓ </span></h2>
        <p class="lead">ㅏㅏㅐㅐㅣㅣ</p>
      </div>
      <div class="col-md-5">
        <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="자리 표시자: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"></rect><text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></svg>

      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7 order-md-2">
        <h2 class="featurette-heading fw-normal lh-1">ㅓㅓㅓㅓㅓ<span class="text-muted"> ㅑㅑㅑㅏㅏ</span></h2>
        <p class="lead"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">웃거나 울 때 우리는 감정을 표시하여 눈, 눈썹, 눈꺼풀, 코, 입술과 같은 주요 얼굴 구성요소의 변화를 기반으로 우리의 얼굴을 "읽는" 동안 다른 사람들이 우리의 마음을 엿볼 수 있도록 합니다.</font></font></p>
      </div>
      <div class="col-md-5 order-md-1">
        <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="자리 표시자: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"></rect><text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></svg>

      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7">
        <h2 class="featurette-heading fw-normal lh-1"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">마지막으로 이. </font></font><span class="text-muted"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">장군.</font></font></span></h2>
        <p class="lead"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">우리 몸의 모든 근육은 신체의 모든 부분에서 척수와 뇌로 연결된 신경에 의해 지지됩니다. </font><font style="vertical-align: inherit;">이 신경 통신은 양방향으로 신경이 뇌 신호에 따라 근육 수축을 유발함과 동시에 근육 상태에 대한 정보를 뇌로 보내는 것을 의미합니다.</font></font></p>
      </div>
      <div class="col-md-5">
        <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="자리 표시자: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"></rect><text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></svg>

      </div>
    </div>

    <hr class="featurette-divider">

    <!-- /END THE FEATURETTES -->

  </div><!-- /.container -->


  <!-- FOOTER -->
  <footer class="container">
    <p class="float-end"><a href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">맨 위로</font></font></a></p>
    <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">© 2017–2022 회사, Inc. </font><font style="vertical-align: inherit;">· </font></font><a href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">개인정보 보호정책</font></font></a><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"> · </font></font><a href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">이용약관</font></font></a></p>
  </footer>
</main>
</body>
</html>