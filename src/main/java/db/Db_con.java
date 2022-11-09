package db;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import db.Transfer;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Db_con
 */
public class Db_con extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Db_con() {
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
		Transfer tf = new Transfer(request, response);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String email = URLDecoder.decode((String)request.getParameter("email"),"UTF-8");
		String name = URLDecoder.decode((String)request.getParameter("nickname"),"UTF-8");
		PrintWriter out = response.getWriter();
		//out.print(email);
		//out.print(name);
		request.setAttribute("name", name);
		request.setAttribute("email", email);
		tf.page("index.jsp");
		
		}

}
