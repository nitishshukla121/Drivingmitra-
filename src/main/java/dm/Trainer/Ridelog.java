package dm.Trainer;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dm.beans.Ride_log;
import dm.dao.Trainerdao;
import dm.utils.User_messages;

/**
 * Servlet implementation class Ridelog
 */
@WebServlet("/Ridelog")
public class Ridelog extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Ridelog() {
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
		
		HttpSession hs=request.getSession(false);
				
		String trainer_id = (String)hs.getAttribute("sessionKey");

		String trainee_id = request.getParameter("trainee_id");
		String source = request.getParameter("Source");
		String distination = request.getParameter("Destination");
		String time = request.getParameter("time");

	java.util.Date d=new java.util.Date();
		
		java.sql.Date date=new java.sql.Date(d.getTime());
		
		Ride_log r= new Ride_log();
		r.setTrainer_id(trainer_id);
	  r.setTrainee_id(trainee_id);	
	  r.setSource(source);
	  r.setDestination(distination);
	  r.setTime(time);
	  r.setDate(date);
	  
	  Trainerdao dao= new Trainerdao();
	  int status = dao.ridelog(r);
	  if(status>0)
		{
			request.setAttribute("message",User_messages.SUCCESS);
			RequestDispatcher dis=request.getRequestDispatcher("/admin/trainer_home.jsp");
			dis.forward(request, response);
		}

	}

}
