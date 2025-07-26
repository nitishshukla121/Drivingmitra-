package dm.admin_servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dm.dao.Admindao;
import dm.utils.User_messages;

/**
 * Servlet implementation class Trainee_account
 */
@WebServlet("/Trainee_account")
public class Trainee_account extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Trainee_account() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String id = request.getParameter("id");
System.out.println("id recive from ajax" + id);
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		// out.println("Repsonce from server");
		Admindao dao = new Admindao();

		boolean status = dao.checkTraineeId(id);

		if (status == true) {

			out.println("Trainee Id already exists");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String formId = request.getParameter("formid");
		int formid = Integer.parseInt(formId);

		String id = request.getParameter("id");
		String password = request.getParameter("password");

		Admindao dao = new Admindao();
		int status = dao.TraineeAccount(formid, id, password);

		if (status > 0) {
			request.setAttribute("message", User_messages.SUCCESS);
			RequestDispatcher dis = request.getRequestDispatcher("/admin/panding_admission.jsp");
			dis.forward(request, response);
		}

	}

}
