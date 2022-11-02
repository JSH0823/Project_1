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
<script type="text/javascript">
    function changeView(value){                        
	if(value == "0") // 개요 버튼 클릭시 첫화면으로 이동            
	{                
		location.href="viewP.jsp";            
	}            
	else if(value == "1") // 지도 버튼 클릭시 로그인 화면으로 이동            
	{                
		location.href="viewP.jsp?contentPage=restaurant.jsp";
	}            
	else if(value == "2") // 댓글 버튼 클릭시 회원가입 화면으로 이동            
	{                
		location.href="viewP.jsp?contentPage=chatting.jsp";            
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
<title>Insert title here</title>
</head>
<body>
<div style="background-color:lightblue;width:100%;height:100%;">
<p>이름:정수현</p>
<p>경주여행 가볼까?</p>
<p>2022.08.01~08.03</p>
</div>
<div class="btn-group btn-group-lg" role="group" aria-label="Large button group" style="width:100%;">
  	  <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" value='0'>
	  <label class="btn btn-outline-primary" for="btnradio1" onclick="changeView(0)">개요</label>
	
	  <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off" value='1'>
	  <label class="btn btn-outline-primary" for="btnradio2" onclick="changeView(1)" >지도</label>
	 
	  <input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off" value='2'>
	  <label class="btn btn-outline-primary" for="btnradio3" onclick="changeView(2)">댓글</label>
</div>
</body>
</html>