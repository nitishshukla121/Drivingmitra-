package dm.admin_servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.datatype.Duration;

import dm.beans.Courses;
import dm.beans.TrainerAccount;
import dm.dao.Admindao;
import dm.utils.User_messages;

/**
 * Servlet implementation class Course_details
 */
@WebServlet("/Course_details")
public class Course_details extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Course_details() {
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
		String courcename = request.getParameter("courseName");
		String price = request.getParameter("charge");
		String discription = request.getParameter("description");
		String duration = request.getParameter("duration");

		System.out.println("Cource name :" + courcename);
		System.out.println("Cource name :" + price);
		System.out.println("Cource name :" + discription);
		System.out.println("Cource name :" + duration);

		Courses c = new Courses(courcename, price, discription, duration);

		Admindao dao = new Admindao();
		int status = dao.addcourses(c);

		if (status > 0) {

			request.setAttribute("msg", User_messages.SUCCESS);

			RequestDispatcher dis = request.getRequestDispatcher("admin/cource_details.jsp");

			dis.forward(request, response);
		}
	}

}
