package com.codechobo;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginAction")
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String chb = request.getParameter("chb");

		HttpSession session = request.getSession();

		if (id.equals("asdf") && pwd.equals("1234")) {
			// id와 pwd 가 일치하는 경우
			Cookie cookie = new Cookie("savedID", id);
			session.setAttribute("MEMBERID", id);

			if (chb == null) {
				cookie.setMaxAge(0);
			}

			response.addCookie(cookie);

			String aaa = request.getParameter("zxc");

			response.sendRedirect(aaa);

		} else {
			// id와 pwd가 일치하지 않는 경우

			Cookie cookie = new Cookie("savedID", id);
			cookie.setMaxAge(0);
			response.addCookie(cookie);

			request.setAttribute("msg", "ID또는 비밀번호가 틀립니다."); // request 객체에 메시지를 저장

			RequestDispatcher reqDis = request.getRequestDispatcher("/LoginForm.jsp");
			reqDis.forward(request, response);

		}

	}
}