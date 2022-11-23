package db;

import java.io.IOException;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Marker
 */
public class Marker extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Marker() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		Transfer tf = new Transfer(request, response);
		LinkedList<Distance> dt = new LinkedList<Distance>();
		int len = Integer.parseInt(request.getParameter("len"));
		String [] place = new String[len];
		double [] lat = new double[len];
		double [] lng = new double[len];
		
		for(int i=0; i< len; i++) {
			String pn = "place";
			String latn = "lat";
			String lngn = "lng";
			pn += i;
			latn +=i;
			lngn +=i;
			place[i] = request.getParameter(pn);
			lat[i] = Double.parseDouble(request.getParameter(latn));
			lng[i] = Double.parseDouble(request.getParameter(lngn));
		}
		
		for(int i=0; i< len; i++) {
			dt.add(new Distance(place[i],(float)lat[i], (float)lng[i]));
		}
		
		for(int i=0; i< len; i++) {
			System.out.println(dt.get(i).getPlace());
			System.out.println(dt.get(i).getLat());
			System.out.println(dt.get(i).getLng());
		}
		request.setAttribute("distance", dt);
		
		tf.page("tripPath.jsp");
		
	}

}
