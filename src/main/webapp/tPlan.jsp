<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.sql.*, db.Db_func, java.util.*, db.Distance ,db.Order,db.Transfer" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="/Web_project1/bootstrap-5.1.3-dist/css/uikit.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<%
	String email = (String)request.getAttribute("email");
	String name = (String)request.getAttribute("name");
	String day1 = (String)request.getAttribute("day1");
	//name = name.substring(0,3);
	//out.print(name);
%>
<script type="text/javascript">

function frm(frm){
	var frm = document.frm;
	let email = frm.email.value;
	frm.method = "post";
	frm.action = "Delet";
	frm.submit();
}
</script>

<%!
public static double distance(double lat1, double lng1, double lat2, double lng2, String unit) {
		double theta = lng1-lng2;
		double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));
	
		dist = Math.acos(dist);
		dist = rad2deg(dist);
		dist = dist * 60 * 1.1515 * 1.609344;
	

		return (dist); // 단위 meter
	}

	public static double deg2rad(double deg) { // 10진수를 라디안으로 변경
		return (deg * Math.PI / 180.0);
	}
	public static double rad2deg(double rad) { // 라디안을 10진수로 변경
		return (rad * 180 / Math.PI);
	}
	
	public void swap(LinkedList<Distance> dis_link, int idx, int swapIdx){
		LinkedList<Distance> temp = new LinkedList<Distance>();
		
	}
	
%>

<style>
	.imgh {
		background : url(/img/map.png);
	}
	.imgh:hover {
		background : url(/img/mapclick.png);
	}
</style>

</head>
<body>
<main class="container">
<table class= "table table-striped table-hover">
<% 
	LinkedList<Distance> dis_link = new LinkedList<Distance>();
LinkedList<String> dis_sort = new LinkedList<String>();
	
	//Distance dis = new Distance();
	Db_func df = new Db_func();
	//Distance diss;
	ResultSet rs = (ResultSet)request.getAttribute("rs");
	String day_of, place;
try{
	out.print("<table class ='table table-striped' style='background-color:#F5FFFA'>");
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
	out.print("<td>");
	out.print("Delete");
	out.print("</td>");
	out.print("</tr>");
	//int i=0;
	while(rs.next()){
		out.print("<tr>");
		out.print("<td>");
		day_of = rs.getString("day_of");
		out.print(day_of);
		out.print("</td>");
		out.print("<td>");
		out.print(rs.getString("area"));
		out.print("</td>");
		out.print("<td>");
		place = rs.getString("place");
		out.print(place);
		out.print("</td>");
		out.print("<form name='frm' method='post' action='Delet'><td width='25%'>");
		out.print("<input type='hidden' name='day_of' value="+day_of+">");
		out.print("<input type='hidden' name='place' value="+place+">");
		out.print("<input type='hidden' name='email' value="+email+">");
		out.print("<input type='submit' value='삭제' onclick='javascript:frm(this.form)'>");
		out.print("</td>");
		out.print("</form>");
		out.print("</tr>");

		dis_link.add(new Distance(rs.getString("place"), rs.getFloat("lat"), rs.getFloat("lng")));

	} 
	
		int dis_link_size = dis_link.size();
		for(int j=0; j<dis_link_size; j++){//0,1
			LinkedList<Order> dist = new LinkedList<Order>();
			for(int k=j+1; k<dis_link_size; k++){//1,2
				double kilo = distance(dis_link.get(j).getLat(), dis_link.get(j).getLng(),dis_link.get(k).getLat(),dis_link.get(k).getLng(), "kilometer");
				dist.add(new Order(dis_link.get(k).getPlace(),kilo, k));
		
			}
			//정렬
			Collections.sort(dist, new Comparator<Order>(){
				@Override
				public int compare(Order o1, Order o2){
					if(o1.k > o2.k)
						return 1;
					else return -1;
				}
			});
			int dist_size = dist.size();

			int nn = dist.get(0).getIdx();

			dis_link.add(j+1,dis_link.get(nn));
			dis_link.remove(nn+1);
			//dist.clear();

		}

	
}catch(Exception e){
	e.printStackTrace();
}

%>
</table>
<% 
out.print("<br>");
	out.print("<table class ='table table-striped' style='background-color:#F0FFFF'>");
	out.print("<p style='color:#B0C4DE;font-size:40px;margin-left:380px;font-weight:bolder'>정수현님의 추천 경로입니다</p>");
	out.print("<tr>");
	out.print("<td>");
	out.print("순서");
	out.print("</td>");
	out.print("<td>");
	out.print("관광지명");
	out.print("</td>");
	out.print("</tr>");
	for(int m = 0; m<dis_link.size(); m++){
		out.print("<tr>");
		out.print("<td>");
		out.print(m+1);
		out.print("</td>");
		out.print("<td>");
		out.print(dis_link.get(m).getPlace());
		out.print("</td>");
		out.print("</tr>");
	}
	Transfer tf = new Transfer(request,response);
	request.setAttribute("arr", dis_link);
%>
 
<script>
	function cm(){
		var frmmap = document.frmmap;
		frmmap.action = "Marker";
		frmmap.method="post";
		frmmap.submit();
	}
</script> 
<form name='frmmap' action='Marker' method='post'>
<%
	for(int i=0; i < dis_link.size(); i++){
%>
	<input type='hidden' name= 'len' value = <%=dis_link.size() %> >
	<input type='hidden' name = 'place<%=i%>' value = <%=dis_link.get(i).getPlace() %>  >
	<input type='hidden' name = 'lat<%=i%>'  value = <%=dis_link.get(i).getLat() %>>
	<input type='hidden' name = 'lng<%=i%>'  value = <%=dis_link.get(i).getLng() %>>
<%
	}
%>

 <div class = "imgh" id="map" onclick="cm()" style="width:800px;height:400px;margin-left:200px;"></div>
</form>
</main>
</body>
</html>