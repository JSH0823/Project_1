<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="evaluation.Evaluation" %>
    <%@ page import="evaluation.EvaluationDAO" %>
    <%@ page import="comment.Comment" %>
    <%@ page import="comment.CommentDAO" %>
    <%@ page import="bbs.Bbs" %>
    <%@ page import="bbs.BbsDAO" %>
    <%@ page import="bbs.Jjim" %>
    <%@ page import="bbs.JjimDAO" %>
    <%@ page import ="java.util.*" %>
    
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="/Web_project1/bootstrap-5.1.3-dist/css/uikit.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
.chat {
	margin-top:30px;
	margin-left:200px;
	background-color:lightgray;
	width:80%;
	height:30%;
}
.container .form-group{
	width:100%;
	margin-top:30px;
}
</style>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div style="height:100%;">
	<div class=chat>
	�г���1 : �� �ʹ� ������
	</div>
	<div class=chat>
	�г���2 : �� �ʹ� ������
	</div>
	<div class=chat>
	�г���3 : �� �ʹ� ������
	</div>
	<div class=chat>
	�г���4 : �� �ʹ� ������
	</div>
</div>
<div class="container">
	<div class="row">
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<tbody>
				<tr>
					<td align="left" bgcolor="beige">���</td>
				</tr>
				<tr>
				<%
					CommentDAO commentDAO = new CommentDAO();
					ArrayList<Comment> list = commentDAO.getList(boardID, bbsID);
					for(int i=0; i<list.size(); i++){
				%>
						<div class="container">		//����ϳ��� container���� ������
							<div class="row">
								<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
									<tbody>
										<tr>						
											<td align="left"><%= list.get(i).getUserID() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= list.get(i).getCommentDate().substring(0,11) + list.get(i).getCommentDate().substring(11,13) + "��" + list.get(i).getCommentDate().substring(14,16) + "��" %></td>		
											<td colspan="2"></td>
											<td align="right">
												<%
												if(list.get(i).getUserID() != null && list.get(i).getUserID().equals(userID)){   //��� ������� ���� ������ ���� �� ������ ������ �����ϰ� ��
												%>
													<form name = "p_search">
														<a type="button" onclick="nwindow(<%=boardID%>,<%=bbsID %>,<%=list.get(i).getCommentID()%>)" class="btn-primary">����</a>
													</form>	
														<a onclick="return confirm('������ �����Ͻðڽ��ϱ�?')" href = "commentDeleteAction.jsp?commentID=<%= list.get(i).getCommentID() %>" class="btn-primary">����</a>																	
												<%
												}
												%>	
											</td>
										</tr>
									</tbody>
								</table>			
							</div>
						</div>
						<%
							}
						%>
				</tr>
		</table>
	</div>
</div>
<div class="container">
	<div class="form-group">
		<form method="post" encType = "multipart/form-data" action="commentAction.jsp?bbsID=�г���&boardID=�г���">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<tr>
					<td style="border-bottom:none;" valign="middle"><br><br>�г���</td>
					<td><input type="text" style="height:100px;" class="form-control" placeholder="������ �����ϴ� ����� ����ô�." name = "commentText"></td>
					<td><br><br><input type="submit" class="btn-primary pull" value="��� �ۼ�"></td>
				</tr>
			</table>
		</form>
	</div>
</div>
</body>
</html>