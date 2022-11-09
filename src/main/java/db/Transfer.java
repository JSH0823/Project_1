package db;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Transfer {
	HttpServletResponse response;
	HttpServletRequest request;
	public Transfer(HttpServletRequest request, HttpServletResponse response) {
		this.response = response;
		this.request = request;
	}
	public void page(String path) throws ServletException, IOException {
		RequestDispatcher dispatcher = this.request.getRequestDispatcher(path);
		dispatcher.forward(this.request, this.response);
	}

}
