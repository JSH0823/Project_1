package jvFile;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import MemberDAO;
import MemberVO;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.do") // URL mapping
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		String url = ""; // forward할 주소를 지정하는 변수
		MemberVO member = null;

		// MemberDAO 객체생성
		MemberDAO mDao = MemberDAO.getInstance();

		// userid와 pwd DB에 있는지 유효성 검사
		int result = mDao.userCheck(userid, pwd);

		switch (result) {
		case 1: // userid와 pwd가 일치할 때
			// 사용자 정보를 DB에서 가져옴
			member = mDao.getUser(userid);
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", member);
			request.setAttribute("message", "로그인에 성공하였습니다.");
			url = "main.jsp";
			break;
		case 0: // userid 일치 pwd 불일치
			request.setAttribute("message", "비밀번호가 맞지 않습니다.");
			url = "member/login.jsp";
			break;
		case -1: // userid가 존재하지 않음
			request.setAttribute("message", "존재하지않는 회원입니다.");
			url = "member/login.jsp";
			break;
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}