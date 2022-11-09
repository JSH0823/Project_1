package db;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import db.Db_func;
import db.Transfer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Planer
 */
public class Planer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Planer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		Transfer tf = new Transfer(request, response);
		//PrintWriter out = response.getWriter();
		
		//String email = URLDecoder.decode((String)request.getParameter("email"),"UTF-8");
		String place = URLDecoder.decode((String)request.getParameter("place"),"UTF-8");
		String area = URLDecoder.decode((String)request.getParameter("area"),"UTF-8");
		String addr = URLDecoder.decode((String)request.getParameter("address"),"UTF-8");
		String tel = URLDecoder.decode((String)request.getParameter("phone"),"UTF-8");
		String day = URLDecoder.decode((String)request.getParameter("todaybirthday"),"UTF-8");
		String email = URLDecoder.decode((String)request.getParameter("email"),"UTF-8");
		
		request.setAttribute("email",email);
		request.setAttribute("day",day);
		Db_func df = new Db_func();
		df.db_connection();
		df.schedule_db_insert(area,place,addr,tel,email,day);
		tf.page("GoCreatePlan");
	}

}
