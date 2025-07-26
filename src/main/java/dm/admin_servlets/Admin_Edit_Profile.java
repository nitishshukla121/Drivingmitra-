package dm.admin_servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dm.beans.Admins;
import dm.dao.Admindao;

/**
 * Servlet implementation class Admin_Edit_Profile
 */
@WebServlet("/Admin_Edit_Profile")
public class Admin_Edit_Profile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Admin_Edit_Profile() {
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
		HttpSession hs=request.getSession(false);// it gave the reference of existing session
		 String admin_id=(String)hs.getAttribute("sessionKey");
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");

		
		Admins a= new Admins();
		a.setName(name);
		a.setEmail(email);
		a.setPhone(phone);
		a.setAdmin_id(admin_id);

		Admindao dao= new Admindao();
 
 int status= dao.editProfile(a);
		 if (status>0) {
			 response.sendRedirect("/Drivingmitra/admin/admin_profile.jsp");
		 }
		
		
	}

}
