package dm.admin_servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dm.dao.Traineedao;
import dm.utils.User_messages;

/**
 * Servlet implementation class Payment
 */
@WebServlet("/Payment")
public class Payment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Payment() {
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
    String fee= request.getParameter("fee");
    String licence= request.getParameter("licence");
    String transactionId= request.getParameter("transactionId");

	Traineedao dao = new Traineedao();

	int status = dao.payment(fee,licence,transactionId);
	
	if(status>0) {
		  request.setAttribute( "msg",User_messages.SUCCESS); RequestDispatcher
		  rd=request.getRequestDispatcher("/common_jsp/index.jsp"); 
		  rd.forward(request,response);
		 }

    
	}

}
