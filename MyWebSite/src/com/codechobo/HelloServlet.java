package com.codechobo;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MyWebSite")
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	int count=0;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		

		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");

		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head");
		out.println("</head");

		out.println("<body>");
		out.println("<h1>Hello, "+id+".</h1>");
		out.println("<h1>Your password is "+pwd+".</h1>");
		out.println("<h1>count="+  ++count  +".</h1>");
		out.println("</body>");
		out.println("</html>");

	}
}