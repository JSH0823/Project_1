<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String contentPage=request.getParameter("contentPage");
    	if(contentPage==null)
    		contentPage="CreateP.jsp";
    %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="/Web_project1/bootstrap-5.1.3-dist/css/uikit.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	#wrap {
		width: 800px;
		margin: 0 auto 0 auto;}
	#header {
		text-align: center;
		width: 800px;
		height: 150px;
		background-color: #92FFFF;
		padding: 60px 0px;}
	#main {
	    float: left;
	    width: 800px;
	    height: 500px;
		background-color: #FFCA6C;
		text-align:center;
		vertical-align: middle;}
	#footer {
		clear: left;
		width: 800px;
		height: 60px;
		background-color: #7DFE74;}
</style>
</head>
<body>
	<div id="wrap">
		<div id="header">            
			<jsp:include page="Header.jsp"/>        
		</div>        
		<div id="main">            
			<jsp:include page="<%=contentPage%>"/>       
		</div>        
		<div id="footer"></div>    
	</div>
</body>
</html>