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
			// id�� pwd �� ��ġ�ϴ� ���
			Cookie cookie = new Cookie("savedID", id);
			session.setAttribute("MEMBERID", id);

			if (chb == null) {
				cookie.setMaxAge(0);
			}

			response.addCookie(cookie);

			String aaa = request.getParameter("zxc");

			response.sendRedirect(aaa);

		} else {
			// id�� pwd�� ��ġ���� �ʴ� ���

			Cookie cookie = new Cookie("savedID", id);
			cookie.setMaxAge(0);
			response.addCookie(cookie);

			request.setAttribute("msg", "ID�Ǵ� ��й�ȣ�� Ʋ���ϴ�."); // request ��ü�� �޽����� ����

			RequestDispatcher reqDis = request.getRequestDispatcher("/LoginForm.jsp");
			reqDis.forward(request, response);

		}

	}
}