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
	닉네임1 : 와 너무 멋져요
	</div>
	<div class=chat>
	닉네임2 : 와 너무 멋져요
	</div>
	<div class=chat>
	닉네임3 : 와 너무 멋져요
	</div>
	<div class=chat>
	닉네임4 : 와 너무 멋져요
	</div>
</div>
<div class="container">
	<div class="row">
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<tbody>
				<tr>
					<td align="left" bgcolor="beige">댓글</td>
				</tr>
				<tr>
				<%
					CommentDAO commentDAO = new CommentDAO();
					ArrayList<Comment> list = commentDAO.getList(boardID, bbsID);
					for(int i=0; i<list.size(); i++){
				%>
						<div class="container">		//댓글하나당 container만들어서 보여줌
							<div class="row">
								<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
									<tbody>
										<tr>						
											<td align="left"><%= list.get(i).getUserID() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= list.get(i).getCommentDate().substring(0,11) + list.get(i).getCommentDate().substring(11,13) + "시" + list.get(i).getCommentDate().substring(14,16) + "분" %></td>		
											<td colspan="2"></td>
											<td align="right">
												<%
												if(list.get(i).getUserID() != null && list.get(i).getUserID().equals(userID)){   //댓글 쓴사람과 지금 유저가 같을 때 수정과 삭제를 가능하게 함
												%>
													<form name = "p_search">
														<a type="button" onclick="nwindow(<%=boardID%>,<%=bbsID %>,<%=list.get(i).getCommentID()%>)" class="btn-primary">수정</a>
													</form>	
														<a onclick="return confirm('정말로 삭제하시겠습니까?')" href = "commentDeleteAction.jsp?commentID=<%= list.get(i).getCommentID() %>" class="btn-primary">삭제</a>																	
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
		<form method="post" encType = "multipart/form-data" action="commentAction.jsp?bbsID=닉네임&boardID=닉네임">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<tr>
					<td style="border-bottom:none;" valign="middle"><br><br>닉네임</td>
					<td><input type="text" style="height:100px;" class="form-control" placeholder="상대방을 존중하는 댓글을 남깁시다." name = "commentText"></td>
					<td><br><br><input type="submit" class="btn-primary pull" value="댓글 작성"></td>
				</tr>
			</table>
		</form>
	</div>
</div>
</body>
</html>