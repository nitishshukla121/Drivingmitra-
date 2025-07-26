package dm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dm.beans.Assignment;
import dm.beans.Trainee;
import dm.beans.TrainerAccount;
import dm.dbinfo.DBConnection;
import dm.beans.Ride_log;

public class Trainerdao {

	// Performance method

	public ArrayList<Ride_log> viewTrainee( String trainer_id) {

		ArrayList<Ride_log> traineeList = new ArrayList<>();
		Ride_log r = null;
		Connection con = DBConnection.openConnection();
		String selectQuery = "select * from ridelog where trainer_id=? and trainee_performance is null";

		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement(selectQuery);
			ps.setString(1, trainer_id);
			System.out.println(ps);
			rs = ps.executeQuery();
			while (rs.next()) {
			
			String trainee_id = rs.getString("trainee_id");

			r = new Ride_log( );
			r.setTrainee_id(trainee_id);
			r.setRideId(rs.getInt("rideId"));
			traineeList.add(r);
			}
			
		} catch (SQLException se) {

			se.printStackTrace();
		}
		return traineeList;
	}

	// view assign Trainees

	public ArrayList<Assignment> viewTrainees(String Trainer_id) {

		ArrayList<Assignment> traineeList = new ArrayList<>();
		Assignment assign = null;
		Connection con = DBConnection.openConnection();
		String selectQuery = "select ad.name,ad.phone,ad.email,ad.city,ad.address,ad.id,ad.learninglicence,a.trainer_id,a.trainee_id,a.status from admission ad,assignment a  where ad.id=a.trainee_id and a.trainer_id=?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement(selectQuery);
			ps.setString(1, Trainer_id);
			rs = ps.executeQuery();
			while (rs.next()) {

				String name = rs.getString("name");
				String phone = rs.getString("phone");
				String email = rs.getString("email");
				String city = rs.getString("city");
				String address = rs.getString("address");
				String id = rs.getString("id");
				String learninglicence = rs.getString("learninglicence");
				String trainer_id = rs.getString("trainer_id");
				String trainee_id = rs.getString("trainee_id");
				String status = rs.getString("status");
				Trainee t = new Trainee();
				t.setName(name);
				t.setCity(city);
				t.setAddress(address);
				t.setEmail(email);
				t.setPhone(phone);
				t.setId(trainee_id);
				t.setLearning_licence(learninglicence);

				assign = new Assignment();
				assign.setTr(t);// HAS A Relationship
				assign.setTrainer_id(trainer_id);
				assign.setStatus(status);
				traineeList.add(assign);
			}

		} catch (SQLException se) {

			se.printStackTrace();
		}
		return traineeList;
	}

	// view profile
	public TrainerAccount viewProfile(String id) {

		Connection con = DBConnection.openConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String selectQuery = "select*from trainer where trainer_id =?";
		TrainerAccount t = null;
		try {

			ps = con.prepareStatement(selectQuery);
			ps.setString(1, id);
			System.out.println(ps);
			rs = ps.executeQuery();
			rs.next();
			/*
			 * trainer_id, password, name, email, phone, gender, address, dricption, date,
			 * experience
			 */
			String trainer_id = rs.getString("trainer_id");
			String name = rs.getString("name");
			String gender = rs.getString("gender");
			String address = rs.getString("address");
			String dricption = rs.getString("dricption");
			String experience = rs.getString("experience");
			String email = rs.getString("email");
			String phone = rs.getString("phone");
			String password = rs.getString("password");

			t = new TrainerAccount(); /*
										 * a = new Admins(); a.setName(name); a.setEmail(email); a.setPhone(phone);
										 * a.setAdmin_pass(password);
										 */
			t.setTrainer_id(trainer_id);
			t.setName(name);
			t.setGender(gender);
			t.setAddress(address);
			t.setDricption(dricption);
			t.setEmail(email);
			t.setExperience(experience);
			t.setPassword(password);
			t.setPhone(phone);

		} catch (SQLException e) {
			e.addSuppressed(e);
		} finally {

		}
		return t;

	}

//edit profile
	public int editProfile(TrainerAccount t) {

		Connection connection = DBConnection.openConnection();
		PreparedStatement ps = null;
		// trainer_id, password, name, email, phone, gender, address, dricption, date,
		// experience
		String UpdateQuery = "update trainer set name=?,email=?,phone=?,gender=?,address=?,dricption=?,experience=? where trainer_id=?";
		int status = 0;
		try {
			ps = connection.prepareStatement(UpdateQuery);
			ps.setString(1, t.getName());
			ps.setString(2, t.getEmail());
			ps.setString(3, t.getPhone());
			ps.setString(4, t.getGender());
			ps.setString(5, t.getAddress());
			ps.setString(6, t.getDricption());
			ps.setString(7, t.getExperience());
			ps.setString(8, t.getTrainer_id());

			status = ps.executeUpdate();
			System.out.println(ps);

		} catch (Exception e) {

			e.printStackTrace();
		}

		return status;
	}
	// Ride log management

	public int ridelog(Ride_log r) {
		Connection con = DBConnection.openConnection();
		String strinsert = "insert into ridelog(trainer_id,trainee_id,source,destination,time,date)values(?,?,?,?,?,?)";

		PreparedStatement ps = null;

		int status = 0;

		try {
			ps = con.prepareStatement(strinsert);
			ps.setString(1, r.getTrainer_id());
			ps.setString(2, r.getTrainee_id());
			ps.setString(3, r.getSource());
			ps.setString(4, r.getDestination());
			ps.setString(5, r.getTime());
			ps.setDate(6, r.getDate());

			System.out.println(ps);

			status = ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

	public int updateRide( String ride_id,String trainer_id,String performance) {

		Connection connection = DBConnection.openConnection();
		PreparedStatement ps = null;
		String UpdateQuery = "update  ridelog set trainer_id=?, trainee_performance=?,ride_status='completed' where rideId=?";
		int status = 0;
		try {
			ps = connection.prepareStatement(UpdateQuery);
			ps.setString(1, trainer_id);
			ps.setString(2, performance);
			ps.setInt(3, Integer.parseInt(ride_id));

			System.out.println(ps);
			status = ps.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();
		}

		return status;
	}

}
