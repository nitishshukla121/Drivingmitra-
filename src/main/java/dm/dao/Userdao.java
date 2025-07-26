package dm.dao;

import dm.beans.Contacts;
import dm.beans.Courses;
import dm.beans.Employee;
import dm.beans.Feedbacks;
import dm.beans.TrainerAccount;
import dm.dbinfo.DBConnection;

import java.sql.*;
import java.util.ArrayList;

public class Userdao {

	// view

	// view course method to user

	public ArrayList<Courses> viewcouses() {

		ArrayList<Courses> coursesList = new ArrayList<>();
		Courses c = null;
		Connection con = DBConnection.openConnection();
		String selectQuery = "select * from courses  ";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement(selectQuery);
			rs = ps.executeQuery();
			while (rs.next()) {
				// course_name, charge, description
				String course_name = rs.getString("course_name");// fetching data from columns
				String charge = rs.getString("charge");
				String description = rs.getString("description");
				String duration = rs.getString("duration");

				c = new Courses(course_name, charge, description, duration);

				coursesList.add(c);

			}

		} catch (SQLException se) {
			se.printStackTrace();

		}

		return coursesList;
	}

	// view course method end's here

	// user can view feedback method

	public ArrayList<Feedbacks> viewfeebacks() {

		ArrayList<Feedbacks> feedbackList = new ArrayList<>();
		Feedbacks f = null;

		Connection con = DBConnection.openConnection();
		String selectQuery = "select * from feedback  where rating='5' or rating='4' order by date desc limit 9 ";
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
	// user can view feedback method

	public int addContacts(Contacts c) {
		// TODO Auto-generated method stub

		String name = c.getUser_name();
		String email = c.getUser_email();
		String phone = c.getUser_phone();
		String query = c.getUser_question();
		/*
		 * System.out.println("from dao class output");
		 * System.out.println(name+""+email+""+phone+""+query);
		 */
		Connection con = DBConnection.openConnection();// connection stablished
		String insertQString = "insert into Contacts( Name, Email, Phone, Query, date)values(?,?,?,?,?)";

		int status = 0;
		PreparedStatement ps = null;
		try {

			ps = con.prepareStatement(insertQString);
			// passes query to my sql
			// compiler compiles the query and store the compiled query into buffer and give
			// refference to ps

			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, phone);
			ps.setString(4, query);
			ps.setDate(5, c.getDate());

			System.out.println(ps);
			status = ps.executeUpdate();
		}

		catch (SQLException se) {
			se.printStackTrace();

		}

		finally {
			try {
				if (ps != null)
					;
				ps.close();
				if (con != null) {

				}
				con.close();

			} catch (SQLException se) {
				se.printStackTrace();
			}

		}

		return status;
	}
	// method close

	// feedback wala yaha se
	public int addFeedback(Feedbacks f) {
		// TODO Auto-generated method stub

		String name = f.getName();
		String email = f.getEmail();
		String remark = f.getRemarks();
		String rating = f.getRating();
		/*
		 * System.out.println("from dao class output");
		 * System.out.println(name+""+email+""+remark);
		 */
		Connection con = DBConnection.openConnection();
		String insertQString = "insert into feedback( Name, Email,remark, rating, date)values(?,?,?,?,?)";

		int status = 0;
		PreparedStatement ps = null;
		try {

			ps = con.prepareStatement(insertQString);
			// passes query to my sql
			// compiler compiles the query and store the compiled query into buffer and give
			// refference to ps

			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, remark);
			ps.setString(4, rating);
			ps.setDate(5, f.getDate());

			System.out.println(ps);
			status = ps.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (ps != null)
					;
				ps.close();
				if (con != null) {

				}
				con.close();

			} catch (SQLException se) {
				se.printStackTrace();
			}

		}

		return status;
	}
	// view trainer method start here

	public ArrayList<TrainerAccount> viewtrainer() {

		ArrayList<TrainerAccount> TrainerList = new ArrayList<>();
		TrainerAccount t = null;

		Connection con = DBConnection.openConnection();
		String selectQuery = "select * from trainer ";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement(selectQuery);
			rs = ps.executeQuery();
			while (rs.next()) {

				// fetching data from columns

				String name = rs.getString("name");
				String email = rs.getString("email");
				String experience = rs.getString("experience");
   String gender =rs.getString("gender");
	/*
	 * String discription =rs.getString("discription");
	 */
   
				

				t = new TrainerAccount();
				
				t.setName(name);
				t.setEmail(email);
				t.setExperience(experience);
				t.setGender(gender);
				/*
				 * t.setDricption(discription);
				 */				  
				TrainerList.add(t);

			}

		} catch (SQLException se) {
			se.printStackTrace();

		}

		return TrainerList;
	}

}
