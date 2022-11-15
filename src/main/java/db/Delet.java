package db;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Delet
 */
public class Delet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Delet() {
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
		
		String email = URLDecoder.decode((String)request.getParameter("email"),"UTF-8");
		String place = URLDecoder.decode((String)request.getParameter("place"),"UTF-8");
		
		String day_of = URLDecoder.decode((String)request.getParameter("day_of"),"UTF-8");
		
		request.setAttribute("email",email);
		
		Db_func df = new Db_func();
		df.db_connection();
		df.schedule_db_remove(place,email,day_of);
		tf.page("viewP.jsp");
	}

}
