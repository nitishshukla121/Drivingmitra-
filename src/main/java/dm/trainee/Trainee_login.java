package dm.trainee;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dm.dao.Traineedao;
import dm.utils.User_messages;

/**
 * Servlet implementation class Trainee_login
 */
@WebServlet("/Trainee_login")
public class Trainee_login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Trainee_login() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("Id");
		String password = request.getParameter("password");

		Traineedao dao = new Traineedao();
		boolean status = dao.trainee_login(id, password);

		if (status == true) {
			HttpSession rs = request
					.getSession();/*
									 * creating session for the conection of the web client and web browser
									 */
			/*
			 * String sessionId = rs.getId();
			 */			rs.setAttribute("sessionKey", id);// binding the id to the session key
			rs.setAttribute("role", "Trainee");

			response.sendRedirect("/Drivingmitra/trainee/trainee_Home.jsp");
		} else {
			request.setAttribute("msg", User_messages.LOGIN_ERROR);

			RequestDispatcher rd = request.getRequestDispatcher("/trainee/trainee_login.jsp");
			rd.forward(request, response);

		}

	}

}
