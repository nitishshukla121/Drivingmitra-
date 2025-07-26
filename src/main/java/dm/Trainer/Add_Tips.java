package dm.Trainer;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dm.beans.Tips;
import dm.dao.Admindao;
import dm.utils.User_messages;

/**
 * Servlet implementation class Add_Tips
 */
@WebServlet("/Add_Tips")
public class Add_Tips extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Add_Tips() {
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
	    String trainer_id=(String)hs.getAttribute("sessionKey");
	   

		String vtype = request.getParameter("vtype");
		String tips = request.getParameter("tips");

		java.util.Date d = new java.util.Date();
		java.sql.Date date = new java.sql.Date(d.getTime());

		
		Tips t= new Tips();
		t.setTrainerid(trainer_id);
		t.setVehicle_type(vtype);
		t.setTips_content(tips);
		t.setDate(date);
		
		
	Admindao dao= new Admindao();
	int status=dao.addTips(t);
	

	if(status>0)
	{
		request.setAttribute("message",User_messages.SUCCESS);
		RequestDispatcher dis=request.getRequestDispatcher("/trainer/add_tips.jsp");
		dis.forward(request, response);
	}
	
		
		
		
		
	}

}
