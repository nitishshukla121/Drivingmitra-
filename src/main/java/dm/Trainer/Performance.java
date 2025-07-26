package dm.Trainer;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dm.beans.Assignment;
import dm.beans.Ride_log;
import dm.dao.Admindao;
import dm.dao.Trainerdao;
import dm.utils.User_messages;

/**
 * Servlet implementation class Performance
 */
@WebServlet("/Performance")
public class Performance extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Performance() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


	    String ride_id= request.getParameter("ride_id");
	    
	    HttpSession hs=request.getSession(false);
	    String trainer_id=(String)hs.getAttribute("sessionKey");
	   // String Trainer_id= request.getParameter("Trainee_id");

	    
		String performance = request.getParameter("performance");
		System.out.println("Trainerid is"+ride_id+"trainee"+performance);
//		Ride_log  r = new Ride_log();
//				r.setRideId(Integer.parseInt(ride_id));
//				r.setRide_performance(performance);
//				r.setTrainer_id(trainer_id);
//				
//				r.setRide_status("Complete");
		
		Trainerdao dao = new Trainerdao();
		 int  status=dao.updateRide(ride_id,trainer_id,performance);
		 if (status > 0) {
				
				RequestDispatcher dis = request.getRequestDispatcher("/trainer/performance.jsp");
				request.setAttribute("message", User_messages.SUCCESS);

				dis.forward(request, response);

			} 
		
	
	}

}
