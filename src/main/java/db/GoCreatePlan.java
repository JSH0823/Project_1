package db;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GoCreatePlan
 */
public class GoCreatePlan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoCreatePlan() {
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
		
		String email = URLDecoder.decode((String)request.getParameter("email"),"UTF-8");
		//String day = URLDecoder.decode((String)request.getParameter("day"),"UTF-8");
		String e = (String)request.getAttribute("email");
		//String d = (String)request.getAttribute("day");
		if(e!=null) {
			email = e;
		}else {
			email = URLDecoder.decode((String)request.getParameter("email"),"UTF-8");
		}
		//request.setAttribute("day",day);
		request.setAttribute("email",email);
		tf.page("place.jsp");
	}

}
