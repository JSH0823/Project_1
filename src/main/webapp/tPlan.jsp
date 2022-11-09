<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.sql.*, db.Db_func" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="/Web_project1/bootstrap-5.1.3-dist/css/uikit.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="EUC-KR">
</head>
<body>
<main class="container">
<table class= "table table-striped table-hover">
<% 
	Db_func df = new Db_func();
	ResultSet rs = (ResultSet)request.getAttribute("rs");
try{
	out.print("<tr>");
	out.print("<td>");
	out.print("여행 날짜");
	out.print("</td>");
	out.print("<td>");
	out.print("여행 지역");
	out.print("</td>");
	out.print("<td>");
	out.print("관광지명");
	out.print("</td>");
	out.print("</tr>");
	while(rs.next()){
		out.print("<tr>");
		out.print("<td>");
		out.print(rs.getString("day_of"));
		out.print("</td>");
		out.print("<td>");
		out.print(rs.getString("area"));
		out.print("</td>");
		out.print("<td>");
		out.print(rs.getString("place"));
		out.print("</td>");
		out.print("</tr>");
	} 
}catch(Exception e){
	e.printStackTrace();
	df.db_close();
}
%>
</table>
</main>
</body>
</html>