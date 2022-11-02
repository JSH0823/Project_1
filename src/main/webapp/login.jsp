<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
Kakao.init('de6b6425bc0fad8a53c7e8950b883733'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  console.log(response)
        	  var email = response['kakao_account']['email']
        	  var nickname = response['properties']['nickname']
        	  console.log(response);
        	  alert("로그인 되었습니다");
        	  location.href="index.jsp?e_mail="+email+"&nickname="+nickname;
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
function formSubmit(){
	var params = jQuery('#response').serialize();
	jQuery.ajax({
		url : 'information.jsp',
		type : 'POST',
		data : response,
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
        dataType: 'html',
        success: function (res) {
            alert("완료");
        }
		
	})
}
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log()
        	alert("로그아웃 되었습니다.");
        	location.href="index.jsp";
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  
function kakaoLoginPro(response){
	var data = {id:response.id,email:response.kakao_account.email}
	$.ajax({
		type : 'POST',
		url : '/user/kakaoLoginPro.do',
		data : data,
		dataType : 'json',
		success : function(data){
			console.log(data)
			if(data.JavaData == "YES"){
				alert("로그인되었습니다.");
				location.href = '/user/usermain.do'
			}else if(data.JavaData == "register"){
				$("#kakaoEmail").val(response.kakao_account.email);
				$("#kakaoId").val(response.id);
				$("#kakaoForm").submit();
			}else{
				alert("로그인에 실패했습니다");
			}
			
		},
		error: function(xhr, status, error){
			alert("로그인에 실패했습니다."+error);
		}
	});
}
</script>
<meta charset="EUC-KR">
<title>TRAVELER_Login</title>
</head>
<body style="align:center;background-color:lightgray;">
<div align="center">
<div style="width : 50%;  margin-bottom : 20% ">	
    <a href="index.jsp"><img class="mb-4" src="TRAVELING.png"  width="50%" height="200" margin-top=-25spx ></a>   
 	<div style="padding:20px 28px; border:2px solid ; border-color:#BBBBBB; border-radius:20px 20px 20px 20px;background-color:white;"  role="tabpanel" aria-controls="loinid" >                       
	<br>
    <div class="modal modal-signin position-static d-block bg-secondary py-5"tabindex="-1" role="dialog" id="modalSignin">
  <div class="modal-dialog" role="document">
    <div class="modal-content rounded-4 shadow">
      <div class="modal-header p-5 pb-4 border-bottom-0">
      </div>
      <div class="modal-body p-5 pt-0">
          <div class="form-floating mb-3">
          </div>
          <div class="button-login" align ="center" style="margin-top:20px;">
        <a id="kakao-login-btn" >
    <a href="javascript:void(0)"><img src="//k.kakaocdn.net/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="300px" height ="50px" onclick="kakaoLogin();"></img></a>
    </a>
            </div>
            <div class="button-logout" align="center" style="margin-top:20px;">
    <a id="kakao-logout-btn">
    <a href="javascript:void(0)"><button style="width:100px;height:30px;background-color:#FFFFE0;border:2px solid;border-radius:5px;border-color:yellow;"onclick="kakaoLogout()">로그아웃</button></a>
    </a>
            </div>
      </div>
    </div>
  </div>
</div>
  </div>	
 </div>
 </div>
</body>
</html>