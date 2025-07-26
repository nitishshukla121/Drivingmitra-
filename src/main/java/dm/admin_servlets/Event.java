package dm.admin_servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dm.beans.Courses;
import dm.beans.Events;
import dm.dao.Admindao;
import dm.utils.User_messages;

/**
 * Servlet implementation class Event
 */
@WebServlet("/Event")
public class Event extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Event() {
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
		String eventname = request.getParameter("eventName");
		String venue = request.getParameter("venue");
		String oragnizer = request.getParameter("organizer");
		String description = request.getParameter("description");
		String date = request.getParameter("date");

		System.out.println("Event name is  :" + eventname);
		System.out.println("Venue of the event :" + venue);
		System.out.println("Oraginerser Details :" + oragnizer);
		System.out.println("Description :" + description);
		System.out.println("Date for the event :" + date);

		Events e = new Events(eventname, venue, oragnizer, description, date);

		Admindao dao = new Admindao();
		int status = dao.Events(e);

		if (status > 0) {

			request.setAttribute("msg", User_messages.SUCCESS);

			RequestDispatcher dis = request.getRequestDispatcher("admin/event.jsp");

			dis.forward(request, response);
		}
	}

}
