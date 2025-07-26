package dm.common_servlets;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dm.beans.Feedbacks;

import dm.dao.Userdao;
import dm.utils.User_messages;

/**
 * Servlet implementation class Feedback
 */
@WebServlet("/Feedback")
public class Feedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Feedback() {
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
		String user=request.getParameter("name");
		String email=request.getParameter("email");
		String remark=request.getParameter("remarks");

		String rating=request.getParameter("feedback");
		
	
		
		java.util.Date d= new java.util.Date();
		java.sql.Date todayDate =new java.sql.Date(d.getTime());
		Feedbacks f = new Feedbacks(user,email,remark,rating,todayDate);
		
		Userdao dao = new Userdao();
		
		int feed = dao.addFeedback(f);
		if(feed>0) {
			 
			request.setAttribute("message",User_messages.SUCCESS);
			RequestDispatcher dis = request.getRequestDispatcher("/common_jsp/feedback.jsp");
			dis.forward(request, response);

		 }
	}

}
