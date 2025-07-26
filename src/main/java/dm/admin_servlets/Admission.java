package dm.admin_servlets;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dm.beans.Trainee;
import dm.beans.TrainerAccount;
import dm.dao.Admindao;
import dm.dao.Traineedao;
import dm.utils.User_messages;

/**
 * Servlet implementation class Trainee
 */
@WebServlet("/Admission")
public class Admission extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Admission() {
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

		String selectcourse = request.getParameter("selectcourse");
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		int a = Integer.parseInt(age);
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String occupation = request.getParameter("occupation");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String learning_licence = request.getParameter("learninglicence");
		String gender = request.getParameter("gender");
		String altnumber = request.getParameter("alternatenumber");
		String mothername = request.getParameter("mothername");
		String fathername = request.getParameter("fathername");

		/*
		 * 
		 * int age, String selectcourse, String name, String phone, String email, String
		 * occupation, String address, String city, String learning_licence, String
		 * gender, String altnumber, String mothername, String fathername, Date date
		 */
		java.util.Date d = new java.util.Date();
		java.sql.Date Date = new java.sql.Date(d.getTime());
		Trainee t = new Trainee(a, selectcourse, name, phone, email, occupation, address, city, learning_licence,
				gender, altnumber, mothername, fathername, Date);

		Traineedao dao = new Traineedao();

		int status = dao.addTrainee(t);

		if (status > 0) {
			String fees = dao.viewFees(selectcourse);

			System.out.println("fees is" + fees);
			request.setAttribute("message", User_messages.SUCCESS);

			request.setAttribute("fee", fees);
			request.setAttribute("licence", learning_licence);

			RequestDispatcher dis = request.getRequestDispatcher("trainee/payment.jsp");
			dis.forward(request, response);

		} else {

			request.setAttribute("message", User_messages.USEREXESTENCE);
			RequestDispatcher dis = request.getRequestDispatcher("/trainee/onlineadmission.jsp");
			dis.forward(request, response);

		}

	}

}
