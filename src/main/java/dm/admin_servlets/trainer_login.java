package dm.admin_servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dm.dao.Admindao;
import dm.utils.User_messages;

/**
 * Servlet implementation class trainer_login
 */
@WebServlet("/trainer_login")
public class trainer_login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public trainer_login() {
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
		String id=request.getParameter("trainer-id");
		String password=request.getParameter("password");
		
			
			Admindao dao = new Admindao();
			boolean status =dao.trainer_login(id,password);  
			
			
			if (status==true) 
			{
				
				
				  HttpSession rs = request.getSession();//creating session for the conection of
				// the web client and web browser
				 
				
				
				 rs.setAttribute("sessionKey", id);//binding admin id in session
				  rs.setAttribute("role", "trainer");
				 
				
				response.sendRedirect("/Drivingmitra/admin/trainer_home.jsp");
				//It is used to navigate the browser on another page(home page)
				
			}	else {
				
				  request.setAttribute( "msg",User_messages.LOGIN_ERROR); RequestDispatcher
				  rd=request.getRequestDispatcher("/admin/trainer_login.jsp"); 
				  rd.forward(request,response);
				 
		}
	}

}
