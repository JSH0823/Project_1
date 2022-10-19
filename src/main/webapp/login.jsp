<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<!--<ul>
	<li onclick="kakaoLogout();">
      <a href="javascript:void(0)">
          <span>카카오 로그아웃</span>
      </a>
	</li>
</ul>-->

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
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
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
</script>
<meta charset="EUC-KR">
<title>TRAVELER_Login</title>
</head>
<body style="align:center">
<div align="center">
<div style="background-color : ; width : 50%;  margin-bottom : 20% ">
	<form style="align : center">
    <a href="index.jsp"><img class="mb-4" src="TRAVELING.png"  width="50%" height="200" margin-top=-25spx ></a>
   
 	<div style="padding:20px 28px; border:2px solid ; border-color:#BBBBBB; border-radius:20px 20px 20px 20px"  role="tabpanel" aria-controls="loinid" >
    	<div style="border-radis:6px 6px 0 0; box-shadow:none; display:table;table-layout:fixed;width:100%;padding:14px 17px 13px;box-sizing:border-box">
                                    <div style="border-radius:6px 6px 0 0; box-shadow : none;display:table;table-layout:fixed;width:100%;padding:14px 17px 13px;box-sizing:border-box; position:relative;height:100%;border:1px solid;text-align:left;" id="id_line">
                                        <div style="display:table-cell;width:24px;vertical-align:middle;" id="id_cell">
                                            <img src="icon_people.png" style="width:100%; height:100%; padding-right:50px;">
                                                <span style="position:absolute;clip:rect(0 0 0 0); width:1px;height:1px;margin:-1px;overflow:hidden;">ID</span>
                                            </span> 
                                        </div>
                                        <input type="text" id="id" name="id" placeholder="ID" title="ID" style="display:table-cell;padding-right:30px;position:relative;width:100%;font-size:16px;font-weight:400;line-height:19px;letter-spacing:-.5px;color:#222;box-sizing:border-box;z-index:4" maxlength="41" value="">
                                    </div>
                                    <div style="border-radius:6px 6px 0 0; box-shadow : none;display:table;table-layout:fixed;width:100%;padding:14px 17px 13px;box-sizing:border-box; position:relative;height:100%;border:1px solid;text-align:left;" id="pw_line">
                                        <div style="display:table-cell;width:24px;vertical-align:middle;" id="pw_cell">
                                            <img src="icon_lock.png" style="width:100%; height:100%">
                                                <span style="position:absolute;clip:rect(0 0 0 0); width:1px;height:1px;margin:-1px;overflow:hidden;">Password</span>
                                            </span>
                                        </div>
                                        <input type="password" id="pw" name="pw" placeholder="Password" title="Password" style="display:table-cell;padding-right:30px;position:relative;width:100%;font-size:16px;font-weight:400;line-height:19px;letter-spacing:-.5px;color:#222;box-sizing:border-box;z-index:4" maxlength="16">
                                    </div>
                                </div>
	<br>
    <div class="checkbox mb-3">
      <label>
        <input type="checkbox" value="remember-me"> Remember me
      </label>
    </div>
    <br>
    <button class="w-100 btn btn-lg btn-primary" type="submit" style="display:block; width : 90%; padding : 13px 10px 13px; border-color:#87cefa; background-color : #87cefa; box-sizing : border-box"><span style="font-size : 20px; font-weight:700; line-height:24px;color:#fff; border-radius:12px;">Login</span></button>
    <br><br><br>
  </form>

	<div class="button-login" align ="center" >
                <a id="kakao-login-btn" >
    <a href="javascript:void(0)"><img src="//k.kakaocdn.net/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="300px" height ="50px" onclick="kakaoLogin();"></img></a>
    </a>
            </div>
            
 </div>
 </div>
</body>
</html>