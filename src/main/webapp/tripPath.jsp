<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.util.*, db.Distance" %>
<!DOCTYPE html>
<html>
<head>
<style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'����',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:800px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
.custom_pencontrol {position:absolute;top:230px;right:1px;width:36px;height:40px;overflow:hidden;z-index:1;background-color:#f5f5f5;}
.custom_pencontrol span {display:block;width:36px;heigth:40px;text_align:center;curson:pointer;}
.custom_pencontrol span img {width:15px;height:15px;padding:12px 0;border:none;}   
.radius_pen{border:1px solid #919191;border-radius:5px;}
.dot {overflow:hidden;float:left;width:12px;height:12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png');}    
.dotOverlay {position:relative;bottom:10px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;font-size:12px;padding:5px;background:#fff;}
.dotOverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}    
.number {font-weight:bold;color:#ee6152;}
.dotOverlay:after {content:'';position:absolute;margin-left:-6px;left:50%;bottom:-8px;width:11px;height:8px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')}
.distanceInfo {position:relative;top:5px;left:5px;list-style:none;margin:0;}
.distanceInfo .label {display:inline-block;width:50px;}
.distanceInfo:after {content:none;}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="/Web_project1/bootstrap-5.1.3-dist/css/uikit.min.css">
<link rel="stylesheet" href="/Web_project1/bootstrap-5.1.3-dist/js/map.js">
<link rel="shortcut icon" href="/img/favicon.ico">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=de6b6425bc0fad8a53c7e8950b883733&libraries=services"></script>
<meta charset="EUC-KR">
<title>TRAVELER_Search</title>
<link rel="shortcut icon" type="image/x-icon" href="./favicon.ico" sizes="16x16">
</head>
<body>

<% String email = (String)request.getAttribute("email");
	
int len = Integer.parseInt(request.getParameter("len"));
String [] place = new String[len];
double [] lat = new double[len];
double [] lng = new double[len];

for(int i=0; i< len; i++) {
	String pn = "place";
	String latn = "lat";
	String lngn = "lng";
	pn += i;
	latn +=i;
	lngn +=i;
	place[i] = request.getParameter(pn);
	lat[i] = Double.parseDouble(request.getParameter(latn));
	lng[i] = Double.parseDouble(request.getParameter(lngn));
	//out.print(place[i]);
}
%>

<section>

<input type='hidden' id='len' value='<%=len%>'>
<% for(int i=0; i<len; i++) { %>

<input type='hidden' id='place<%=i%>' value='<%=place[i]%>'>
<input type='hidden' id='lat<%=i%>' value='<%=lat[i]%>'>
<input type='hidden' id='lng<%=i%>' value='<%=lng[i]%>'>

<%
}
%>
<script>
var places = [];
var latlng = [];
var len = document.getElementById('len').value;
var pl,la,ln;
len = parseInt(len);
for(let i=0; i<len; i+=1){
	 pl = 'place';
	 la = 'lat';
	 ln = 'lng';
	 pl+=i;
	 la+=i;
	 ln+=i;
	 places[i] = document.getElementById(pl).value;
	 latlng[i] = new kakao.maps.LatLng( parseFloat(document.getElementById(la).value), parseFloat(document.getElementById(ln).value));
	 //alert(document.getElementById(pl).value);
	 //alert(typeof(document.getElementById(la).value));
	//alert(document.getElementById(ln).value);
}

</script>
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
          <form action="Goinfo" method="post">
        	<input type="hidden" name="email" id="email" value = "<%=email %>">
        	<button  style="background-color:transparent;border-color:transparent;color:rgba(255, 255, 255, .5);margin-left:5px;margin-right:5px;border-bottom:0.25rem solid transparent;"class="nav-link fw-bold py-1 px-0">Planner</button>
        </form>
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
      </section>

<% 
	///String place = request.getParameter("place");
 	//String lat = request.getParameter("lat");
	//String lng = request.getParameter("lng");
%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=de6b6425bc0fad8a53c7e8950b883733&libraries=services"></script>
<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

    
    <div class="custom_pencontrol radius_pen">
    	<span onclick="deleteClickLine();showDistance();deleteDistnce();displayCircleDot();deleteDircleDot();getTimeHTML();" ondbclick="removeEvent()" title="�Ÿ� ����"><img src="/img/ruler.png" style="width:35px; height:43px;padding:1px 0px;"></span>
    </div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=de6b6425bc0fad8a53c7e8950b883733&libraries=services"></script>
<script>

var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
    mapOption = {
        center: new kakao.maps.LatLng(parseFloat(document.getElementById('lat0').value), parseFloat(document.getElementById('lng0').value)), // ������ �߽���ǥ
        level: 7 // ������ Ȯ�� ����
    };  

// ������ �����մϴ�    
var map = new kakao.maps.Map(mapContainer, mapOption); 

function zoomIn() {
    map.setLevel(map.getLevel() - 1);
}

// ���� Ȯ��, ��� ��Ʈ�ѿ��� ��� ��ư�� ������ ȣ��Ǿ� ������ Ȯ���ϴ� �Լ��Դϴ�
function zoomOut() {
    map.setLevel(map.getLevel() + 1);
}
//�Ϲ� ������ ��ī�̺�� ���� Ÿ���� ��ȯ�� �� �ִ� ����Ÿ�� ��Ʈ���� �����մϴ�
var mapTypeControl = new kakao.maps.MapTypeControl();

// ������ ��Ʈ���� �߰��ؾ� �������� ǥ�õ˴ϴ�
// kakao.maps.ControlPosition�� ��Ʈ���� ǥ�õ� ��ġ�� �����ϴµ� TOPRIGHT�� ������ ���� �ǹ��մϴ�
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

// ���� Ȯ�� ��Ҹ� ������ �� �ִ�  �� ��Ʈ���� �����մϴ�
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);






var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
var imageSrc1 = "/img/mark.png";
for (var i=0; i<1;i++){
	  // ��Ŀ �̹����� �̹��� ũ�� �Դϴ�
    var imageSize = new kakao.maps.Size(50, 61); 
    
    // ��Ŀ �̹����� �����մϴ�    
    var markerImage = new kakao.maps.MarkerImage(imageSrc1, imageSize); 
    
    // ��Ŀ�� �����մϴ�
    var marker = new kakao.maps.Marker({
        map: map, // ��Ŀ�� ǥ���� ����
        position: latlng[i], // ��Ŀ�� ǥ���� ��ġ
        title : places[i], // ��Ŀ�� Ÿ��Ʋ, ��Ŀ�� ���콺�� �ø��� Ÿ��Ʋ�� ǥ�õ˴ϴ�
        image : markerImage // ��Ŀ �̹��� 
    });
}
for (var i = 1; i < len; i ++) {
    
    // ��Ŀ �̹����� �̹��� ũ�� �Դϴ�
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // ��Ŀ �̹����� �����մϴ�    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // ��Ŀ�� �����մϴ�
    var marker = new kakao.maps.Marker({
        map: map, // ��Ŀ�� ǥ���� ����
        position: latlng[i], // ��Ŀ�� ǥ���� ��ġ
        title : places[i], // ��Ŀ�� Ÿ��Ʋ, ��Ŀ�� ���콺�� �ø��� Ÿ��Ʋ�� ǥ�õ˴ϴ�
        image : markerImage // ��Ŀ �̹��� 
    });
}
//���� �����ϴ� ��ǥ �迭�Դϴ�. �� ��ǥ���� �̾ ���� ǥ���մϴ�



var poly = [];
for(let i=0; i<len; i++){
	 la = 'lat';
	 ln = 'lng';
	 la+=i;
	 ln+=i;
	poly[i] = new kakao.maps.LatLng(parseFloat(document.getElementById(la).value), parseFloat(document.getElementById(ln).value));
	//alert(poly[i]);
}
//alert(poly);
// ������ ǥ���� ���� �����մϴ�
 
var first_linePath = new kakao.maps.Polyline({
 
path: poly, // ���� �����ϴ� ��ǥ�迭 �Դϴ�
 
strokeWeight: 3, // ���� �β� �Դϴ�
 
strokeColor: 'black', // ���� �����Դϴ�
 
strokeOpacity: 0.7, // ���� ������ �Դϴ� 1���� 0 ������ ���̸� 0�� �������� �����մϴ�
 
strokeStyle: 'solid' // ���� ��Ÿ���Դϴ�
 
});

first_linePath.setMap(map);










</script>
<!-- ��Ʈ��Ʈ�� primary ��ư -->
<!-- ��Ʈ��Ʈ�� �̿��� ���� jQuery�� CDN -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</html>