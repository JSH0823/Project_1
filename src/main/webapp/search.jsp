<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<% String email = (String)request.getAttribute("email");%>
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


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=de6b6425bc0fad8a53c7e8950b883733&libraries=services"></script>
<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" style="width:25%;" class="bg_white">
        <div class="option">
            <div>
                <form onsubmit="searchPlaces(); return false;">
                <% 
                request.setCharacterEncoding("utf-8"); 
                String id = request.getParameter("keyword");
                if (id == null) id = "����";
                %>
                <script>
                	var data = $(#id).val();
                	alert(data);
                </script>
                Ű���� : <input type="text" placeholder="Ű���带 �Է��ϼ���" value="<%= id %>"  id="keyword" size="15"> 
                    <button type="submit">�˻��ϱ�</button> 
                </form>
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
    <div class="custom_pencontrol radius_pen">
    	<span onclick="deleteClickLine();showDistance();deleteDistnce();displayCircleDot();deleteDircleDot();getTimeHTML();" ondbclick="removeEvent()" title="�Ÿ� ����"><img src="/img/ruler.png" style="width:35px; height:43px;padding:1px 0px;"></span>
    </div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=de6b6425bc0fad8a53c7e8950b883733&libraries=services"></script>
<script>
// ��Ŀ�� ���� �迭�Դϴ�
var markers = [];

var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // ������ �߽���ǥ
        level: 3 // ������ Ȯ�� ����
    };  

// ������ �����մϴ�    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// ��� �˻� ��ü�� �����մϴ�
var ps = new kakao.maps.services.Places();  

// �˻� ��� ����̳� ��Ŀ�� Ŭ������ �� ��Ҹ��� ǥ���� ���������츦 �����մϴ�
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// Ű����� ��Ҹ� �˻��մϴ�
searchPlaces();


// Ű���� �˻��� ��û�ϴ� �Լ��Դϴ�
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('Ű���带 �Է����ּ���!');
        return false;
    }

    // ��Ұ˻� ��ü�� ���� Ű����� ��Ұ˻��� ��û�մϴ�
    ps.keywordSearch( keyword, placesSearchCB); 
}

// ��Ұ˻��� �Ϸ���� �� ȣ��Ǵ� �ݹ��Լ� �Դϴ�
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // ���������� �˻��� �Ϸ������
        // �˻� ��ϰ� ��Ŀ�� ǥ���մϴ�
        displayPlaces(data);

        // ������ ��ȣ�� ǥ���մϴ�
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('�˻� ����� �������� �ʽ��ϴ�.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('�˻� ��� �� ������ �߻��߽��ϴ�.');
        return;

    }
}

// �˻� ��� ��ϰ� ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // �˻� ��� ��Ͽ� �߰��� �׸���� �����մϴ�
    removeAllChildNods(listEl);

    // ������ ǥ�õǰ� �ִ� ��Ŀ�� �����մϴ�
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // ��Ŀ�� �����ϰ� ������ ǥ���մϴ�
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // �˻� ��� �׸� Element�� �����մϴ�

        // �˻��� ��� ��ġ�� �������� ���� ������ �缳���ϱ�����
        // LatLngBounds ��ü�� ��ǥ�� �߰��մϴ�
        bounds.extend(placePosition);

        // ��Ŀ�� �˻���� �׸� mouseover ������
        // �ش� ��ҿ� ���������쿡 ��Ҹ��� ǥ���մϴ�
        // mouseout ���� ���� ���������츦 �ݽ��ϴ�
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'click', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // �˻���� �׸���� �˻���� ��� Element�� �߰��մϴ�
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;
	
    // �˻��� ��� ��ġ�� �������� ���� ������ �缳���մϴ�
    map.setBounds(bounds);
}

// �˻���� �׸��� Element�� ��ȯ�ϴ� �Լ��Դϴ�
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// ��Ŀ�� �����ϰ� ���� ���� ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // ��Ŀ �̹��� url, ��������Ʈ �̹����� ���ϴ�
        imageSize = new kakao.maps.Size(36, 37),  // ��Ŀ �̹����� ũ��
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // ��������Ʈ �̹����� ũ��
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // ��������Ʈ �̹��� �� ����� ������ �»�� ��ǥ
            offset: new kakao.maps.Point(13, 37) // ��Ŀ ��ǥ�� ��ġ��ų �̹��� �������� ��ǥ
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // ��Ŀ�� ��ġ
            image: markerImage 
        });

    marker.setMap(map); // ���� ���� ��Ŀ�� ǥ���մϴ�
    markers.push(marker);  // �迭�� ������ ��Ŀ�� �߰��մϴ�

    return marker;
}

// ���� ���� ǥ�õǰ� �ִ� ��Ŀ�� ��� �����մϴ�
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// �˻���� ��� �ϴܿ� ��������ȣ�� ǥ�ô� �Լ��Դϴ�
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // ������ �߰��� ��������ȣ�� �����մϴ�
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// �˻���� ��� �Ǵ� ��Ŀ�� Ŭ������ �� ȣ��Ǵ� �Լ��Դϴ�
// ���������쿡 ��Ҹ��� ǥ���մϴ�
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // �˻���� ����� �ڽ� Element�� �����ϴ� �Լ��Դϴ�
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
//HTML5�� geolocation���� ����� �� �ִ��� Ȯ���մϴ� 
if (navigator.geolocation) {
    
    // GeoLocation�� �̿��ؼ� ���� ��ġ�� ���ɴϴ�
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude, // ����
            lon = position.coords.longitude; // �浵
        
        var locPosition = new kakao.maps.LatLng(lat, lon), // ��Ŀ�� ǥ�õ� ��ġ�� geolocation���� ���� ��ǥ�� �����մϴ�
            message = '<div style="padding:5px;">���� ��ġ</div>' // ���������쿡 ǥ�õ� �����Դϴ�
        
        // ��Ŀ�� ���������츦 ǥ���մϴ�
        displayMarker(locPosition, message);
            
      });
    
} else { // HTML5�� GeoLocation�� ����� �� ������ ��Ŀ ǥ�� ��ġ�� ���������� ������ �����մϴ�
    
    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
        message = 'geolocation�� ����Ҽ� �����..'
        
    displayMarker(locPosition, message);
}

// ������ ��Ŀ�� ���������츦 ǥ���ϴ� �Լ��Դϴ�
function displayMarker(locPosition, message) {

    // ��Ŀ�� �����մϴ�
    var marker = new kakao.maps.Marker({  
        map: map, 
        position: locPosition
    }); 
    
    var iwContent = message
        iwRemoveable = true;

    // ���������츦 �����մϴ�
    var infowindow = new kakao.maps.InfoWindow({
        content : iwContent,
        removable : iwRemoveable
    });
    
    // ���������츦 ��Ŀ���� ǥ���մϴ� 
    infowindow.open(map, marker);
    
    // ���� �߽���ǥ�� ������ġ�� �����մϴ�
    map.setCenter(locPosition);      
}    
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

var drawingFlag = false; // ���� �׷����� �ִ� ���¸� ������ ���� �����Դϴ�
var moveLine; // ���� �׷����� ������ ���콺 �����ӿ� ���� �׷��� �� ��ü �Դϴ�
var clickLine // ���콺�� Ŭ���� ��ǥ�� �׷��� �� ��ü�Դϴ�
var distanceOverlay; // ���� �Ÿ������� ǥ���� Ŀ���ҿ������� �Դϴ�
var dots = {}; // ���� �׷����� ������ Ŭ���� ������ Ŭ�� ������ �Ÿ��� ǥ���ϴ� Ŀ���� �������� �迭�Դϴ�.

// ������ Ŭ�� �̺�Ʈ�� ����մϴ�
// ������ Ŭ���ϸ� �� �׸��Ⱑ ���۵˴ϴ� �׷��� ���� ������ ����� �ٽ� �׸��ϴ�
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {

    // ���콺�� Ŭ���� ��ġ�Դϴ� 
    var clickPosition = mouseEvent.latLng;

    // ���� Ŭ���̺�Ʈ�� �߻��ߴµ� ���� �׸����ִ� ���°� �ƴϸ�
    if (!drawingFlag) {

        // ���¸� true��, ���� �׸����ִ� ���·� �����մϴ�
        drawingFlag = true;
        
        // ���� ���� ���� ǥ�õǰ� �ִٸ� �������� �����մϴ�
        deleteClickLine();
        
        // ���� ���� Ŀ���ҿ������̰� ǥ�õǰ� �ִٸ� �������� �����մϴ�
        deleteDistnce();

        // ���� ���� ���� �׸��� ���� Ŭ���� ������ �ش� ������ �Ÿ������� ǥ�õǰ� �ִٸ� �������� �����մϴ�
        deleteCircleDot();
    
        // Ŭ���� ��ġ�� �������� ���� �����ϰ� �������� ǥ���մϴ�
        clickLine = new kakao.maps.Polyline({
            map: map, // ���� ǥ���� �����Դϴ� 
            path: [clickPosition], // ���� �����ϴ� ��ǥ �迭�Դϴ� Ŭ���� ��ġ�� �־��ݴϴ�
            strokeWeight: 3, // ���� �β��Դϴ� 
            strokeColor: '#db4040', // ���� �����Դϴ�
            strokeOpacity: 1, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
            strokeStyle: 'solid' // ���� ��Ÿ���Դϴ�
        });
        
        // ���� �׷����� ���� �� ���콺 �����ӿ� ���� ���� �׷��� ��ġ�� ǥ���� ���� �����մϴ�
        moveLine = new kakao.maps.Polyline({
            strokeWeight: 3, // ���� �β��Դϴ� 
            strokeColor: '#db4040', // ���� �����Դϴ�
            strokeOpacity: 0.5, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
            strokeStyle: 'solid' // ���� ��Ÿ���Դϴ�    
        });
    
        // Ŭ���� ������ ���� ������ ������ ǥ���մϴ�
        displayCircleDot(clickPosition, 0);

            
    } else { // ���� �׷����� �ִ� �����̸�

        // �׷����� �ִ� ���� ��ǥ �迭�� ���ɴϴ�
        var path = clickLine.getPath();

        // ��ǥ �迭�� Ŭ���� ��ġ�� �߰��մϴ�
        path.push(clickPosition);
        
        // �ٽ� ���� ��ǥ �迭�� �����Ͽ� Ŭ�� ��ġ���� ���� �׸����� �����մϴ�
        clickLine.setPath(path);

        var distance = Math.round(clickLine.getLength());
        displayCircleDot(clickPosition, distance);
    }
});
    
// ������ ���콺���� �̺�Ʈ�� ����մϴ�
// ���� �׸����ִ� ���¿��� ���콺���� �̺�Ʈ�� �߻��ϸ� �׷��� ���� ��ġ�� �������� �����ֵ��� �մϴ�
kakao.maps.event.addListener(map, 'mousemove', function (mouseEvent) {

    // ���� ���콺���� �̺�Ʈ�� �߻��ߴµ� ���� �׸����ִ� �����̸�
    if (drawingFlag){
        
        // ���콺 Ŀ���� ���� ��ġ�� ���ɴϴ� 
        var mousePosition = mouseEvent.latLng; 

        // ���콺 Ŭ������ �׷��� ���� ��ǥ �迭�� ���ɴϴ�
        var path = clickLine.getPath();
        
        // ���콺 Ŭ������ �׷��� ������ ��ǥ�� ���콺 Ŀ�� ��ġ�� ��ǥ�� ���� ǥ���մϴ�
        var movepath = [path[path.length-1], mousePosition];
        moveLine.setPath(movepath);    
        moveLine.setMap(map);
        
        var distance = Math.round(clickLine.getLength() + moveLine.getLength()), // ���� �� �Ÿ��� ����մϴ�
            content = '<div class="dotOverlay distanceInfo">�ѰŸ� <span class="number">' + distance + '</span>m</div>'; // Ŀ���ҿ������̿� �߰��� �����Դϴ�
        
        // �Ÿ������� ������ ǥ���մϴ�
        showDistance(content, mousePosition);   
    }             
});                 

// ������ ���콺 ������ Ŭ�� �̺�Ʈ�� ����մϴ�
// ���� �׸����ִ� ���¿��� ���콺 ������ Ŭ�� �̺�Ʈ�� �߻��ϸ� �� �׸��⸦ �����մϴ�
kakao.maps.event.addListener(map, 'rightclick', function (mouseEvent) {

    // ���� ������ Ŭ�� �̺�Ʈ�� �߻��ߴµ� ���� �׸����ִ� �����̸�
    if (drawingFlag) {
        
        // ���콺����� �׷��� ���� �������� �����մϴ�
        moveLine.setMap(null);
        moveLine = null;  
        
        // ���콺 Ŭ������ �׸� ���� ��ǥ �迭�� ���ɴϴ�
        var path = clickLine.getPath();
    
        // ���� �����ϴ� ��ǥ�� ������ 2�� �̻��̸�
        if (path.length > 1) {

            // ������ Ŭ�� ������ ���� �Ÿ� ���� Ŀ���� �������̸� ����ϴ�
            if (dots[dots.length-1].distance) {
                dots[dots.length-1].distance.setMap(null);
                dots[dots.length-1].distance = null;    
            }

            var distance = Math.round(clickLine.getLength()), // ���� �� �Ÿ��� ����մϴ�
                content = getTimeHTML(distance); // Ŀ���ҿ������̿� �߰��� �����Դϴ�
                
            // �׷��� ���� �Ÿ������� ������ ǥ���մϴ�
            showDistance(content, path[path.length-1]);  
             
        } else {

            // ���� �����ϴ� ��ǥ�� ������ 1�� �����̸� 
            // ������ ǥ�õǰ� �ִ� ���� �������� �������� �����մϴ�.
            deleteClickLine();
            deleteCircleDot(); 
            deleteDistnce();

        }
        
        // ���¸� false��, �׸��� �ʰ� �ִ� ���·� �����մϴ�
        drawingFlag = false;          
    }  
}); 

function deleteClickLine() {
    if (clickLine) {
        clickLine.setMap(null);    
        clickLine = null;        
    }
}

// ���콺 �巡�׷� �׷����� �ִ� ���� �ѰŸ� ������ ǥ���ϰ�
// ���콺 ������ Ŭ������ �� �׸��� ������� �� ���� ������ ǥ���ϴ� Ŀ���� �������̸� �����ϰ� ������ ǥ���ϴ� �Լ��Դϴ�
function showDistance(content, position) {
    
    if (distanceOverlay) { // Ŀ���ҿ������̰� ������ �����̸�
        
        // Ŀ���� ���������� ��ġ�� ǥ���� ������ �����մϴ�
        distanceOverlay.setPosition(position);
        distanceOverlay.setContent(content);
        
    } else { // Ŀ���� �������̰� �������� ���� �����̸�
        
        // Ŀ���� �������̸� �����ϰ� ������ ǥ���մϴ�
        distanceOverlay = new kakao.maps.CustomOverlay({
            map: map, // Ŀ���ҿ������̸� ǥ���� �����Դϴ�
            content: content,  // Ŀ���ҿ������̿� ǥ���� �����Դϴ�
            position: position, // Ŀ���ҿ������̸� ǥ���� ��ġ�Դϴ�.
            xAnchor: 0,
            yAnchor: 0,
            zIndex: 3  
        });      
    }
}

// �׷����� �ִ� ���� �ѰŸ� ������ 
// �� �׸��� ������� �� ���� ������ ǥ���ϴ� Ŀ���� �������̸� �����ϴ� �Լ��Դϴ�
function deleteDistnce () {
    if (distanceOverlay) {
        distanceOverlay.setMap(null);
        distanceOverlay = null;
    }
}

// ���� �׷����� �ִ� ������ �� ������ Ŭ���ϸ� ȣ���Ͽ� 
// Ŭ�� ������ ���� ���� (���׶�̿� Ŭ�� ���������� �ѰŸ�)�� ǥ���ϴ� �Լ��Դϴ�
function displayCircleDot(position, distance) {

    // Ŭ�� ������ ǥ���� ���� ���׶�� Ŀ���ҿ������̸� �����մϴ�
    var circleOverlay = new kakao.maps.CustomOverlay({
        content: '<span class="dot"></span>',
        position: position,
        zIndex: 1
    });

    // ������ ǥ���մϴ�
    circleOverlay.setMap(map);

    if (distance > 0) {
        // Ŭ���� ���������� �׷��� ���� �� �Ÿ��� ǥ���� Ŀ���� �������̸� �����մϴ�
        var distanceOverlay = new kakao.maps.CustomOverlay({
            content: '<div class="dotOverlay">�Ÿ� <span class="number">' + distance + '</span>m</div>',
            position: position,
            yAnchor: 1,
            zIndex: 2
        });

        // ������ ǥ���մϴ�
        distanceOverlay.setMap(map);
    }

    // �迭�� �߰��մϴ�
    dots.push({circle:circleOverlay, distance: distanceOverlay});
}

// Ŭ�� ������ ���� ���� (���׶�̿� Ŭ�� ���������� �ѰŸ�)�� �������� ��� �����ϴ� �Լ��Դϴ�
function deleteCircleDot() {
    var i;

    for ( i = 0; i < dots.length; i++ ){
        if (dots[i].circle) { 
            dots[i].circle.setMap(null);
        }

        if (dots[i].distance) {
            dots[i].distance.setMap(null);
        }
    }

    dots = [];
}

// ���콺 ��Ŭ�� �Ͽ� �� �׸��Ⱑ ������� �� ȣ���Ͽ� 
// �׷��� ���� �ѰŸ� ������ �Ÿ��� ���� ����, ������ �ð��� ����Ͽ�
// HTML Content�� ����� �����ϴ� �Լ��Դϴ�
function getTimeHTML(distance) {

    // ������ �ü��� ��� 4km/h �̰� ������ �м��� 67m/min�Դϴ�
    var walkkTime = distance / 67 | 0;
    var walkHour = '', walkMin = '';

    // ����� ���� �ð��� 60�� ���� ũ�� �ð����� ǥ���մϴ�
    if (walkkTime > 60) {
        walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + '</span>�ð� '
    }
    walkMin = '<span class="number">' + walkkTime % 60 + '</span>��'

    // �������� ��� �ü��� 16km/h �̰� �̰��� �������� �������� �м��� 267m/min�Դϴ�
    var bycicleTime = distance / 227 | 0;
    var bycicleHour = '', bycicleMin = '';

    // ����� ������ �ð��� 60�� ���� ũ�� �ð����� ǥ���մϴ�
    if (bycicleTime > 60) {
        bycicleHour = '<span class="number">' + Math.floor(bycicleTime / 60) + '</span>�ð� '
    }
    bycicleMin = '<span class="number">' + bycicleTime % 60 + '</span>��'
    
    var carTime = distance / 500 | 0;
    var carHour = '', carMin = '';
    
    if(carTime > 60) {
    	carHour = '<span class="number">' + Math.floor(carTime / 60) + '</span>�ð� ' 
    }
    carMin = '<span class="number">' + carTime % 60 + '</span>��'

    // �Ÿ��� ���� �ð�, ������ �ð��� ������ HTML Content�� ����� �����մϴ�
    var content = '<ul class="dotOverlay distanceInfo">';
    content += '    <li>';
    content += '        <span class="label">�ѰŸ�</span><span class="number">' + distance + '</span>m';
    content += '    </li>';
    content += '    <li>';
    content += '        <span class="label">����</span>' + walkHour + walkMin;
    content += '    </li>';
    content += '    <li>';
    content += '        <span class="label">������</span>' + bycicleHour + bycicleMin;
    content += '    </li>';
    content += '    <li>';
    content += '        <span class="label">�ڵ���</span>' + carHour + carMin;
    content += '    </li>';
    content += '</ul>'

    return content;
}
function removeEvent() {
	remove();
}


</script>
<!-- ��Ʈ��Ʈ�� primary ��ư -->
<!-- ��Ʈ��Ʈ�� �̿��� ���� jQuery�� CDN -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</html>