package db;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.sql.ResultSet;

import db.Db_func;
import db.Transfer;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class search_day
 */
public class search_day extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public search_day() {
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
		
		String day = URLDecoder.decode((String)request.getParameter("todaybirthday"),"UTF-8");
		String day1 = URLDecoder.decode((String)request.getParameter("day"),"UTF-8");
		String email = URLDecoder.decode((String)request.getParameter("email"),"UTF-8");
		String name = URLDecoder.decode((String)request.getParameter("name"),"UTF-8");
		
		Db_func df = new Db_func();
		df.db_connection();
		ResultSet rs = df.schedule_search_day(day, email);
		request.setAttribute("rs", rs);
		request.setAttribute("email", email);
		request.setAttribute("name", name);
		request.setAttribute("day",day);
		request.setAttribute("day1",day1);
		tf.page("viewP.jsp");
	}

}
