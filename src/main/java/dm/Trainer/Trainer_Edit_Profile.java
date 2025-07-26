package dm.Trainer;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dm.beans.Admins;
import dm.beans.TrainerAccount;
import dm.dao.Admindao;
import dm.dao.Trainerdao;
import dm.utils.User_messages;

/**
 * Servlet implementation class Trainer_Edit_Profile
 */
@WebServlet("/Trainer_Edit_Profile")
public class Trainer_Edit_Profile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Trainer_Edit_Profile() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{

		HttpSession hs=request.getSession(false);// it gave the reference of existing session
		 String trainer_id=(String)hs.getAttribute("sessionKey");
		
		String name=request.getParameter("name");
		String phone=request.getParameter("phone");
		String email=request.getParameter("email");
		String experience=request.getParameter("experience");
		String gender=request.getParameter("gender");
		String address=request.getParameter("address");
		String description=request.getParameter("description");
	
		
		TrainerAccount a= new TrainerAccount();
		a.setName(name);
		a.setEmail(email);
		a.setPhone(phone);
		a.setExperience(experience);
		a.setGender(gender);
		a.setAddress(address);
		a.setDricption(description);
		
		a.setTrainer_id(trainer_id);
		Trainerdao dao= new Trainerdao();

int status= dao.editProfile(a);
		 if (status>0) {
			 response.sendRedirect("/Drivingmitra/admin/trainer_home.jsp");
				
		 }
		
		
	
	}

}
