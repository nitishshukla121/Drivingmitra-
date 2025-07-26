package dm.common_servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dm.beans.Contacts;
import dm.dao.Userdao;
import dm.utils.User_messages;

/**
 * Servlet implementation class Contactus
 */
@WebServlet("/Contactus")
public class Contactus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Contactus() {
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
		String remark=request.getParameter("phone");
		String Query=request.getParameter("query");
		
		

		// creating bean class object
		
		java.util.Date d= new java.util.Date();
		java.sql.Date todayDate =new java.sql.Date(d.getTime());
		Contacts  c = new Contacts( user,email,remark,Query,todayDate); 
		
		// creating dao class object
		Userdao dao = new Userdao();
		//calling dao class method and pass bean class object
		 int resp=  dao.addContacts(c);
		
		 if(resp>0) {
			 
				request.setAttribute("message",User_messages.SUCCESS);
				RequestDispatcher dis = request.getRequestDispatcher("/common_jsp/contact_us.jsp");
				dis.forward(request, response);

		 }
		 
	}

}
