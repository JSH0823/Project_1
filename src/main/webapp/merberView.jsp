<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
    <%@page import="jvFile.MemberDTO" %>
    <%@page import="java.util.ArrayList"%>
    <%@page import="jvFile.MemberDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		MemeberDAO memberDAO = new MemberDAO();
		ArrayList<MemberDTO> dtos = memberDAO.memberSelect();
		
		for(int i=0; i<dtos.size(); i++){
			MemberDTO dto = dto.get(i);
			String name = dto.getName();
			String id = dto.getId();
			String pw = dto.getPw();
			String gender = dto.getGender();
			
			out.println("이름 : " + name + ", 아이디 : "+ id + " , 비밀번호 : " + pw + ", 성별 : " + gender + "<br />");
		}
	%>
</body>
</html>