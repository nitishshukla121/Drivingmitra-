package dm.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dm.beans.Admins;
import dm.beans.Assignment;
import dm.beans.Contacts;
import dm.beans.Courses;
import dm.beans.Events;
import dm.beans.Feedbacks;
import dm.beans.Tips;
import dm.beans.Trainee;
import dm.beans.TrainerAccount;
import dm.dbinfo.DBConnection;
import java.util.*;

public class Admindao {

	// Trainee method for dropdown
	public ArrayList<Trainee> viewTrainee() {

		ArrayList<Trainee> TraineeList = new ArrayList<>();
		Trainee t = null;
		Connection con = DBConnection.openConnection();
		String selectQuery = "select id,name  from admission where id not in(select trainee_id from assignment)";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement(selectQuery);
			rs = ps.executeQuery();
			while (rs.next()) {
				// trainer_id, password, name, email, phone, gender, address, dricption, date,
				// experience String course_name = rs.getString("course_name");// fetching data
				// from columns
				String name = rs.getString("name");
				String id = rs.getString("id");
				t = new Trainee();
				t.setName(name);
				t.setId(id);
				TraineeList.add(t);

			}

		} catch (SQLException se) {
			se.printStackTrace();

		}

		return TraineeList;
	}

	// trainerwiseTrainee method

/*public ArrayList<Assignment> trainerWiseTrainee(String trainer_id) {

		ArrayList<Assignment> assignList = new ArrayList<>();
		Assignment a = null;
		Connection con = DBConnection.openConnection();
		String selectQuery = "select  * from assignment where trainer_id=?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement(selectQuery);
			ps.setString(1, trainer_id);
			rs = ps.executeQuery();
			while (rs.next()) {
				// trainer_id, password, name, email, phone, gender, address, dricption, date,
				// experience String course_name = rs.getString("course_name");// fetching data
				// from columns
				a = new Assignment();
				String traineeid = rs.getString("trainee_id");
				String trainerid = rs.getString("trainer_id");

				a.setTrainee_id(traineeid);
				a.setTrainer_id(trainerid);

				assignList.add(a);

			}

		} catch (SQLException se) {
			se.printStackTrace();

		}

		return assignList;
	}*/
	
	public ArrayList<Assignment> trainerWiseTrainee(String trainer_id) {

	    ArrayList<Assignment> assignList = new ArrayList<>();
	    Connection con = null;
	    PreparedStatement psAssignment = null;
	    ResultSet rsAssignment = null;

	    PreparedStatement psTrainee = null; // New PreparedStatement for Trainee
	    ResultSet rsTrainee = null;         // New ResultSet for Trainee

	    try {
	        con = DBConnection.openConnection(); // Open connection once
	        String selectAssignmentQuery = "SELECT trainee_id, trainer_id FROM assignment WHERE trainer_id=?";
	        psAssignment = con.prepareStatement(selectAssignmentQuery);
	        psAssignment.setString(1, trainer_id);
	        rsAssignment = psAssignment.executeQuery();

	        while (rsAssignment.next()) {
	            Assignment a = new Assignment(); // Create Assignment object inside the loop
	            String traineeid = rsAssignment.getString("trainee_id");
	            String trainerid = rsAssignment.getString("trainer_id");

	            a.setTrainee_id(traineeid);
	            a.setTrainer_id(trainerid);

	            // --- Step 1: Fetch Trainee details using traineeid ---
	            String selectTraineeQuery = "SELECT name, email, phone, city, address FROM trainee WHERE id=?";
	            psTrainee = con.prepareStatement(selectTraineeQuery); // Prepare new statement
	            psTrainee.setString(1, traineeid);
	            rsTrainee = psTrainee.executeQuery();

	            if (rsTrainee.next()) { // Check if a trainee is found
	                Trainee trainee = new Trainee(); // Create a new Trainee object
	                trainee.setId(traineeid); // Set ID, as it's the identifier
	                trainee.setName(rsTrainee.getString("name"));
	                trainee.setEmail(rsTrainee.getString("email"));
	                trainee.setPhone(rsTrainee.getString("phone"));
	                trainee.setCity(rsTrainee.getString("city"));
	                trainee.setAddress(rsTrainee.getString("address"));

	                a.setTr(trainee); // --- Step 2 & 3: Set the Trainee object into the Assignment bean ---
	            } else {
	                // Handle case where trainee details are not found (optional, but good for debugging)
	                System.out.println("Warning: Trainee details not found for ID: " + traineeid);
	                a.setTr(null); // Explicitly set null if no trainee, though it's already null by default
	            }
	            // Close inner ResultSet and PreparedStatement after each trainee lookup
	            if (rsTrainee != null) { try { rsTrainee.close(); } catch (SQLException e) { e.printStackTrace(); } }
	            if (psTrainee != null) { try { psTrainee.close(); } catch (SQLException e) { e.printStackTrace(); } }


	            assignList.add(a); // Add the populated Assignment object to the list
	        }

	    } catch (SQLException se) {
	        se.printStackTrace();
	    } finally {
	        // --- Close resources in reverse order of creation ---
	        if (rsAssignment != null) { try { rsAssignment.close(); } catch (SQLException e) { e.printStackTrace(); } }
	        if (psAssignment != null) { try { psAssignment.close(); } catch (SQLException e) { e.printStackTrace(); } }
	        // psTrainee and rsTrainee are closed inside the loop
	        if (con != null) { try { con.close(); } catch (SQLException e) { e.printStackTrace(); } }
	    }
	    return assignList;
	}

	/*
	 * Trainer and Trainee method
	 */

	public ArrayList<TrainerAccount> viewTrainer() {

		ArrayList<TrainerAccount> TrainerList = new ArrayList<>();
		TrainerAccount t = null;
		Connection con = DBConnection.openConnection();
		String selectQuery = "select * from trainer  ";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement(selectQuery);
			rs = ps.executeQuery();
			while (rs.next()) {
				// trainer_id, password, name, email, phone, gender, address, dricption, date,
				// experience String course_name = rs.getString("course_name");// fetching data
				// from columns
				String name = rs.getString("name");
				String t_id = rs.getString("trainer_id");
				t = new TrainerAccount();

				t.setName(name);
				t.setTrainer_id(t_id);
				TrainerList.add(t);

			}

		} catch (SQLException se) {
			se.printStackTrace();

		}

		return TrainerList;
	}

	// Trainer login's method start here

	public boolean trainer_login(String id, String password)

	{
		Connection con = DBConnection.openConnection();
		String selectQuery = "select * from trainer where trainer_id=? and password=?";

		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement(selectQuery);
			ps.setString(1, id);
			ps.setString(2, password);
			System.out.println(ps);

			rs = ps.executeQuery();

			if (rs.next() == true)// it will put the cursor on the row and check the whether here id and passsword
									// is correct or not
				return true;

		}

		catch (SQLException se) {
			se.printStackTrace();

		}

		return false;
	}
	// Trainer login's method end's here

	// admin profile method start's here

	public Admins viewProfile(String id) {

		Connection con = DBConnection.openConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String selectQuery = "select*from admin where admin_id =?";
		Admins a = null;
		try {

			ps = con.prepareStatement(selectQuery);
			ps.setString(1, id);
			System.out.println(ps);
			rs = ps.executeQuery();
			rs.next();

			String name = rs.getString("name");
			String email = rs.getString("email");
			String phone = rs.getString("phone");
			String password = rs.getString("Admin_pass");

			a = new Admins();
			a.setName(name);
			a.setEmail(email);
			a.setPhone(phone);
			a.setAdmin_pass(password);

		} catch (SQLException e) {
			e.addSuppressed(e);
		} finally {

		}
		return a;

	}

	// admin profile method end's here
	// view contacts method
	public ArrayList<Contacts> viewcontacts() {

		ArrayList<Contacts> contactsList = new ArrayList<>();
		Contacts contact = null;
		Connection con = DBConnection.openConnection();
		String selectQuery = "select * from contacts order by date desc";
		PreparedStatement ps = null;
		ResultSet rs = null;
		// contact_id, Name, Email, Phone, Query, date
		try {
			ps = con.prepareStatement(selectQuery);
			rs = ps.executeQuery();
			while (rs.next()) {

				String name = rs.getString("Name");
				String Email = rs.getString("Email");
				String Phone = rs.getString("Phone");
				String Query = rs.getString("Query");
				java.sql.Date d = rs.getDate("date");
				contact = new Contacts(name, Email, Phone, Query, d);
				contactsList.add(contact);

			}

		} catch (SQLException se) {

			se.printStackTrace();
		}
		return contactsList;
	}
	// view contacts method end's here

	// login method for the Admin's
	public boolean login(String id, String pass)

	{
		Connection con = DBConnection.openConnection();
		String selectQuery = "select * from admin where admin_id=? and admin_pass=?";

		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement(selectQuery);
			ps.setString(1, id);
			ps.setString(2, pass);

			rs = ps.executeQuery();

			if (rs.next() == true)// it will put the cursotre on the roe and check the wheather hrere
				return true;

		}

		catch (SQLException se) {
			se.printStackTrace();

		}

		return false;
	}
	// login method end's here

	// Trainer method start here
	public int addtrainer(TrainerAccount t) {

		Connection connection = DBConnection.openConnection();

		String strinsert = "insert into trainer(trainer_id, password, name, email, phone, gender, address, dricption, date, experience)values(?,?,?,?,?,?,?,?,?,?)";

		PreparedStatement ps = null;

		int status = 0;

		try {
			ps = connection.prepareStatement(strinsert);
			ps.setString(1, t.getTrainer_id());

			ps.setString(2, t.getPassword());
			ps.setString(3, t.getName());
			ps.setString(4, t.getEmail());
			ps.setString(5, t.getPhone());
			ps.setString(6, t.getGender());
			ps.setString(7, t.getAddress());
			ps.setString(8, t.getDricption());
			ps.setDate(9, t.getDate());
			ps.setString(10, t.getExperience());
			status = ps.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			status = 0;
		}

		return status;

	}

	// Trainer method end's here

	public ArrayList<Feedbacks> viewfeebacks() {

		ArrayList<Feedbacks> feedbackList = new ArrayList<>();
		Feedbacks f = null;// bean class object SELECT * FROM courier_db.feedbacks;

		Connection con = DBConnection.openConnection();
		String selectQuery = "select * from feedback order by date desc";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement(selectQuery);
			rs = ps.executeQuery();
			while (rs.next()) {

				String name = rs.getString("name");// fetching data from columns
				String email = rs.getString("email");
				String remark = rs.getString("remark");
				String r = rs.getString("rating");
				/*
				 * // int rating = Integer.parseInt("r");
				 */ Date date = rs.getDate("date");
//id, name, email, remark, rating, date
				f = new Feedbacks(name, email, remark, r, date);

				feedbackList.add(f);

			}

		} catch (SQLException se) {
			se.printStackTrace();

		}

		return feedbackList;
	}
	// Feedback method end's here

	public int addcourses(Courses c) {

		Connection connection = DBConnection.openConnection();
		String strinsert = "insert into Courses(course_name,charge,description,duration)values(?,?,?,?)";

		PreparedStatement ps = null;

		int status = 0;

		try {
			ps = connection.prepareStatement(strinsert);
			ps.setString(1, c.getCourse_name());
			ps.setString(2, c.getCharge());
			ps.setString(3, c.getDiscription());
			ps.setString(4, c.getDuration());

			status = ps.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return status;

	}

	public int editProfile(Admins a) {

		Connection connection = DBConnection.openConnection();
		PreparedStatement ps = null;
		String UpdateQuery = "update admin set name=?,email=?,phone=? where admin_id=?";
		int status = 0;
		try {
			ps = connection.prepareStatement(UpdateQuery);
			ps.setString(1, a.getName());
			ps.setString(2, a.getEmail());
			ps.setString(3, a.getPhone());
			ps.setString(4, a.getAdmin_id());
			status = ps.executeUpdate();
			System.out.println(ps);

		} catch (Exception e) {

			e.printStackTrace();
		}

		return status;
	}

	public int addTips(Tips t) {
		Connection connection = DBConnection.openConnection();
		PreparedStatement ps = null;
		String strinsert = "insert into tips( trainerid,vehicle_type,tips_Content,date)values(?,?,?,?)";
		int status = 0;
		try {
			ps = connection.prepareStatement(strinsert);
			ps.setString(1, t.getTrainerid());
			ps.setString(2, t.getVehicle_type());
			ps.setString(3, t.getTips_content());
			ps.setDate(4, t.getDate());
			status = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public int Events(Events e) {

		Connection connection = DBConnection.openConnection();
		PreparedStatement ps = null;
		String strinsert = "insert into event(event_name,venue ,organizer,description,event_date)values(?,?,?,?,?)";
		int status = 0;
		try {
			ps = connection.prepareStatement(strinsert);
			ps.setNString(1, e.getEvent_name());
			ps.setNString(2, e.getVenue());
			ps.setNString(3, e.getOrganizer());
			ps.setNString(4, e.getDescription());
			ps.setNString(5, e.getEvent_date());

			status = ps.executeUpdate();

		} catch (SQLException se) {
			se.printStackTrace();

		}

		return status;

	}

	/*
	 * Trainee Account method start here
	 */

	public int TraineeAccount(int snumber, String id, String password) {
		Connection con = DBConnection.openConnection();
		PreparedStatement ps = null;

		String UpdateQuery = "update admission set id=?,password=?,status='Confirm',feestatus='True' where snumber=? ";
		int status = 0;
		try {
			ps = con.prepareStatement(UpdateQuery);
			ps.setString(1, id);
			ps.setString(2, password);
			ps.setInt(3, snumber);

			System.out.println(ps);
			status = ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;

	}

	public int assignment(Assignment a) {
		Connection connection = DBConnection.openConnection();
		PreparedStatement ps = null;
		String strinsert = "insert into assignment(trainer_id,trainee_id,status)values(?,?,?)";
		int status = 0;
		try {
			ps = connection.prepareStatement(strinsert);
			ps.setString(1, a.getTrainer_id());
			ps.setString(2, a.getTrainee_id());
			ps.setString(3, a.getStatus());

			status = ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public boolean checkId(String ajax_id) {

		Connection connection = DBConnection.openConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
				
		try {

			String selectQuery = "select * from trainer where trainer_id=?";
			ps=connection.prepareStatement(selectQuery);
			ps.setString(1, ajax_id);
			rs=ps.executeQuery();
			
			if(rs.next())
				return true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					rs.close();
				if (connection != null)
					rs.close();
			} catch (Exception se) {
				se.printStackTrace();
			}
		}

		return false;
	}

	public boolean checkTraineeId(String id) {
		Connection connection = DBConnection.openConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
				
		try {

			String selectQuery = "select * from admission  where id=?";
			ps=connection.prepareStatement(selectQuery);
			ps.setString(1, id);
			rs=ps.executeQuery();
			
			if(rs.next())
				return true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					rs.close();
				if (connection != null)
					rs.close();
			} catch (Exception se) {
				se.printStackTrace();
			}
		}

		return false;
	}
}
