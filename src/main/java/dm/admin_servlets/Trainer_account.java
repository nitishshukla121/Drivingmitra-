package dm.admin_servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dm.beans.TrainerAccount;
import dm.dao.Admindao;
import dm.utils.User_messages;

/**
 * Servlet implementation class Trainer_account
 */
@WebServlet("/Trainer_account")
public class Trainer_account extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Trainer_account() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String ajax_id=request.getParameter("id");
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();

		//out.println("Repsonce from server");
		Admindao dao = new Admindao();
		
	boolean status=	dao.checkId(ajax_id);
	
	if(status==true){
		
		out.println("Trainer Id already exists");
	}
		
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

		String id=request.getParameter("id");
		String password=request.getParameter("password");
		String name=request.getParameter("name");
		String phone=request.getParameter("phone");
		String email=request.getParameter("email");
		String experience=request.getParameter("experience");
		String gender=request.getParameter("gender");
		String address=request.getParameter("address");
		String description=request.getParameter("description");
	
		

		
		java.util.Date d=new java.util.Date();
		
		java.sql.Date date=new java.sql.Date(d.getTime());
		
		TrainerAccount t=new TrainerAccount(id, password, name, email, phone, gender, address, description, experience, date);
		
		Admindao dao=new Admindao();
		int status=dao.addtrainer(t);
		
		if(status>0)
		{
			request.setAttribute("message",User_messages.SUCCESS);
			RequestDispatcher dis=request.getRequestDispatcher("/admin/trainer_account.jsp");
			dis.forward(request, response);
		}
		else {

			request.setAttribute("message",User_messages.USEREXESTENCE);
			RequestDispatcher dis=request.getRequestDispatcher("/admin/trainer_account.jsp");
			dis.forward(request, response);
		
		}
		
	}

}
