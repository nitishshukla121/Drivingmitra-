package dm.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.cj.x.protobuf.MysqlxCrud.Update;

import dm.dbinfo.DBConnection;
import dm.beans.Admins;
import dm.beans.Ride_log;
import dm.beans.Trainee;
import dm.beans.TrainerAccount;
import dm.beans.Vehicle_Details;

public class Traineedao {
	
	

	//viewRideAdmin
	
	
	
	public ArrayList<Ride_log> viewRideAdmin() {
		//rideId, trainer_id, trainee_id, source, destination, time, ride_status, trainee_performance, date, vehicle_no
				ArrayList<Ride_log> PerformanceList = new ArrayList<>();
				Ride_log r = null;
				Connection con = DBConnection.openConnection();
				 String strsql="select vd.deviceno,vd.vehicle_no,rd.trainer_id,rd.trainee_id,rd.source,rd.destination,rd.trainee_performance,rd.date from vehicle_details vd, ridelog rd";
				//String selectQuery = "select *  from ridelog where trainee_id=?";
				PreparedStatement ps = null;
				ResultSet rs = null;
				Vehicle_Details vd=null;
				
				try {
					ps = con.prepareStatement(strsql);
					
					System.out.println(ps);

					rs = ps.executeQuery();
					while (rs.next()) {
						String performance = rs.getString("trainee_performance");
						java.sql.Date d = rs.getDate("date");		

						r = new Ride_log();
						r.setSource(rs.getString("source"));
						r.setDestination(rs.getString("destination"));
						r.setVehicle_no(rs.getString("vehicle_no"));
						r.setTrainee_performance(performance);
						r.setTrainer_id(rs.getString("trainer_id"));
						r.setTrainee_id(rs.getString("trainee_id"));
						r.setDate(d);
						vd=new Vehicle_Details();
						vd.setVehicle_no(rs.getString("vehicle_no"));
						vd.setDeviceno(rs.getString("deviceno"));
						r.setVd(vd);
						PerformanceList.add(r);

					}

				} catch (SQLException se) {
					se.printStackTrace();

				}

				return PerformanceList;
			}

			
			
	
	
	
	public ArrayList<Ride_log> viewRide(String trainee_id) {
//rideId, trainer_id, trainee_id, source, destination, time, ride_status, trainee_performance, date, vehicle_no
		ArrayList<Ride_log> PerformanceList = new ArrayList<>();
		Ride_log r = null;
		Connection con = DBConnection.openConnection();
		 String strsql="select vd.deviceno,vd.vehicle_no,rd.trainer_id,rd.trainee_id,rd.source,rd.destination,rd.trainee_performance,rd.date from vehicle_details vd, ridelog rd where rd.trainee_id=?";
		//String selectQuery = "select *  from ridelog where trainee_id=?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		Vehicle_Details vd=null;
		
		try {
			ps = con.prepareStatement(strsql);
			ps.setString(1, trainee_id);
			System.out.println(ps);

			rs = ps.executeQuery();
			while (rs.next()) {
				String performance = rs.getString("trainee_performance");
				java.sql.Date d = rs.getDate("date");		

				r = new Ride_log();
				r.setSource(rs.getString("source"));
				r.setDestination(rs.getString("destination"));
				r.setVehicle_no(rs.getString("vehicle_no"));
				r.setTrainee_performance(performance);
				r.setTrainer_id(rs.getString("trainer_id"));
				r.setTrainee_id(trainee_id);
				r.setDate(d);
				vd=new Vehicle_Details();
				vd.setVehicle_no(rs.getString("vehicle_no"));
				vd.setDeviceno(rs.getString("deviceno"));
				r.setVd(vd);
				PerformanceList.add(r);

			}

		} catch (SQLException se) {
			se.printStackTrace();

		}

		return PerformanceList;
	}
	
	
	// View Performance
	public ArrayList<Ride_log> viewPerformance(String trainee_id) {

		ArrayList<Ride_log> PerformanceList = new ArrayList<>();
		Ride_log r = null;
		Connection con = DBConnection.openConnection();
		String selectQuery = "select *  from ridelog where trainee_id=?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement(selectQuery);
			ps.setString(1, trainee_id);
			System.out.println(ps);

			rs = ps.executeQuery();
			while (rs.next()) {
				String performance = rs.getString("trainee_performance");
				java.sql.Date d = rs.getDate("date");		

				r = new Ride_log();
				r.setTrainee_performance(performance);
				r.setDate(d);

				PerformanceList.add(r);

			}

		} catch (SQLException se) {
			se.printStackTrace();

		}

		return PerformanceList;
	}

	// view trainer assigne to the trainee
	public TrainerAccount viewTrainer(String id) {

		TrainerAccount t = null;

		Connection con = DBConnection.openConnection();
		String selectQuery = "Select tr.name,tr.email,tr.phone,tr.gender,tr.trainer_id from trainer tr,assignment a where a.trainer_id=tr.trainer_id and a.trainee_id=?;";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement(selectQuery);
			ps.setString(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {

				String name = rs.getString("name");
				String email = rs.getString("email");
				String phone = rs.getString("phone");
				String gender = rs.getString("gender");
				String trainer_id = rs.getString("trainer_id");

				t = new TrainerAccount();

				t.setName(name);
				t.setEmail(email);
				t.setPhone(phone);
				t.setGender(gender);
				t.setTrainer_id(trainer_id);

			}

		} catch (SQLException se) {
			se.printStackTrace();

		}

		return t;
	}

	// View trainees
	public ArrayList<Trainee> viewTrainee() {

		ArrayList<Trainee> TraineeList = new ArrayList<>();
		Trainee t = null;
		Connection con = DBConnection.openConnection();
		String selectQuery = "select * from admission  where status is null and transaction_id is not null";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement(selectQuery);
			rs = ps.executeQuery();
			while (rs.next()) {
				/*
				 * snumber, id, password, selectcourse, name, age, phone, email, occupation,
				 * address, city, learninglicence, status, fee, feestatus, gender, altnumber,
				 * mothername, fathername, transaction_id, date
				 */
				String course = rs.getString("selectcourse");// fetching data from columns
				String name = rs.getString("name");
				String age = rs.getString("age");
				int a = Integer.parseInt(age);

				String phone = rs.getString("phone");
				String email = rs.getString("email");
				String occupation = rs.getString("occupation");
				String address = rs.getString("address");
				String city = rs.getString("city");
				String learninglicence = rs.getString("learninglicence");
				String gender = rs.getString("gender");
				String altnumber = rs.getString("altnumber");
				String mothername = rs.getString("mothername");
				String fathername = rs.getString("fathername");
				Date date = rs.getDate("date");
				t = new Trainee(a, course, name, phone, email, occupation, address, city, learninglicence, gender,
						altnumber, mothername, fathername, date);
				t.setSnumber(rs.getInt("snumber"));
				TraineeList.add(t);

			}

		} catch (SQLException se) {
			se.printStackTrace();

		}

		return TraineeList;
	}

	// admission pending method end's here

//Add trainer start here
	public int addTrainee(Trainee t) {
		Connection connection = DBConnection.openConnection();

		// snumber, id, password, selectcourse, name, age, phone, email, occupation,
		// address, city, learning_licence, status, fee, feestatus, gender, altnumber,
		// mothername, fathername, transaction_id, date
		String strinsert = "insert into admission(Selectcourse,name,age,phone,email,occupation,address,city,learninglicence,gender,altnumber,mothername,fathername,date)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		PreparedStatement ps = null;

		int status = 0;
		try {
			ps = connection.prepareStatement(strinsert);
			ps.setString(1, t.getSelectcourse());
			ps.setString(2, t.getName());
			ps.setInt(3, t.getAge());
			ps.setString(4, t.getPhone());
			ps.setString(5, t.getEmail());
			ps.setString(6, t.getOccupation());
			ps.setString(7, t.getAddress());
			ps.setString(8, t.getCity());
			ps.setString(9, t.getLearning_licence());
			ps.setString(10, t.getGender());
			ps.setString(12, t.getMothername());
			ps.setString(13, t.getFathername());
			ps.setString(11, t.getAltnumber());
			ps.setDate(14, t.getDate());
			status = ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			status = 0;

		}

		return status;
	}
	// viewFees()

	public String viewFees(String selectcourse) {
		Connection con = DBConnection.openConnection();

		String sql = "Select charge from courses where course_name=?";

		String charge = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {

			ps = con.prepareStatement(sql);
			ps.setString(1, selectcourse);
			rs = ps.executeQuery();
			if (rs.next())

			{
				charge = rs.getString("charge");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return charge;
	}

	public int payment(String fee, String licence, String transactionId) {
		Connection connection = DBConnection.openConnection();
		PreparedStatement ps = null;
		String UpdateQuery = "update admission set fee=?,transaction_Id=? where learninglicence=?";
		int status = 0;
		try {
			ps = connection.prepareStatement(UpdateQuery);
			ps.setString(1, fee);
			ps.setString(2, transactionId);
			ps.setString(3, licence);

			status = ps.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();
		}

		return status;
	}

	public boolean trainee_login(String id, String password) {

		Connection con = DBConnection.openConnection();
		String selectQuery = "select * from admission where id=? and password=?";

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

	/*
	 * Trainee profile method atart's here
	 */
	public Trainee viewProfile(String id) {

		Connection con = DBConnection.openConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String selectQuery = "select*from admission where id =?";
		Trainee t = null;
		try {

			ps = con.prepareStatement(selectQuery);
			ps.setString(1, id);
			rs = ps.executeQuery();
			rs.next();
			/*
			 * snumber, id, password, selectcourse, name, age, phone, email, occupation,
			 * address, city, learninglicence, status, fee, feestatus, gender, altnumber,
			 * mothername, fathername, transaction_id, date
			 */
			String yourid = rs.getString("id");
			String password = rs.getString("password");
			String selectcourse = rs.getString("selectcourse");
			String name = rs.getString("name");
			String age = rs.getString("age");
			int a = Integer.parseInt(age);

			String phone = rs.getString("phone");
			String email = rs.getString("email");
			String occupation = rs.getString("occupation");
			String address = rs.getString("address");
			String city = rs.getString("city");
			String gender = rs.getString("gender");
			String altnumber = rs.getString("altnumber");
			String mothername = rs.getString("mothername");
			String fathername = rs.getString("fathername");
			String feestatus = rs.getString("feestatus");
			String fee = rs.getString("fee");

			t = new Trainee();

			t.setName(name);
			t.setAge(a);
			t.setPhone(phone);
			t.setPassword(password);
			t.setAddress(address);
			t.setCity(city);
			t.setEmail(email);
			t.setGender(gender);
			t.setAltnumber(altnumber);
			t.setMothername(mothername);
			t.setFathername(fathername);
			t.setFee(fee);
			t.setFeestatus(feestatus);
			t.setPhone(phone);

		} catch (SQLException e) {
			e.addSuppressed(e);
		} finally {

		}
		return t;

	}

}
/*
 * public Trainee viewProfile(String id) { select * from admission where id=?
 * 
 * 
 * 
 * }
 */
