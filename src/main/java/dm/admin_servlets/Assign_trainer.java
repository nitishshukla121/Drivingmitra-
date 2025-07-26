package dm.admin_servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dm.beans.Assignment;
import dm.dao.Admindao;
import dm.utils.User_messages;

/**
 * Servlet implementation class Assign_trainer
 */
@WebServlet("/Assign_trainer")
public class Assign_trainer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Assign_trainer() {
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

    String trainer_id= request.getParameter("trainer_id");
	String trainee_id = request.getParameter("trainee_id");
	System.out.println("Trainerid is"+trainer_id+"trainee"+trainee_id);
	Assignment  a = new Assignment();
	a.setTrainer_id(trainer_id);
	a.setTrainee_id(trainee_id);
	a.setStatus("true");
	
	Admindao dao = new Admindao();
	 int  status=dao.assignment(a);
	 if(status>0) {
	  request.setAttribute( "msg",User_messages.SUCCESS); RequestDispatcher
	  rd=request.getRequestDispatcher("/admin/assign_trainer.jsp"); 
	  rd.forward(request,response);
	 }
	
	}

}
