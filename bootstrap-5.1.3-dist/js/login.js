var logInOut = function(){

	
	var btnLogin = document.getElementById('btnLogin'); 
    
	if(btnLogin != null){
	btnLogin.onclick = function(){
		var frm = document.form_log; //name가져옴
		frm.action = '/Fineapple-final/login/login.jsp';
		frm.submit();
	}
	}
		

}