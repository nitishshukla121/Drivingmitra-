package dm.beans;

import java.sql.Date;

public class Ride_log {

	private String trainer_id, trainee_id, source, destination, time,ride_status,trainee_performance;
	private Date date;
	private int rideId;
	private String vehicle_no;
	private Vehicle_Details vd;
	public Vehicle_Details getVd() {
		return vd;
	}

	public void setVd(Vehicle_Details vd) {
		this.vd = vd;
	}

	public String getVehicle_no() {
		return vehicle_no;
	}

	public void setVehicle_no(String vehicle_no) {
		this.vehicle_no = vehicle_no;
	}

	public int getRideId() {
		return rideId;
	}

	public void setRideId(int rideId) {
		this.rideId = rideId;
	}

	public Ride_log() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Ride_log(String trainer_id, String trainee_id, String source, String destination, String time, Date date) {
		super();
		this.trainer_id = trainer_id;
		this.trainee_id = trainee_id;
		this.source = source;
		this.destination = destination;
		this.time = time;
		this.date = date;
	}

	public String getTrainer_id() {
		return trainer_id;
	}

	public void setTrainer_id(String trainer_id) {
		this.trainer_id = trainer_id;
	}

	public String getTrainee_id() {
		return trainee_id;
	}

	public void setTrainee_id(String trainee_id) {
		this.trainee_id = trainee_id;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getRide_status() {
		return ride_status;
	}

	public void setRide_status(String ride_status) {
		this.ride_status = ride_status;
	}


	public String getTrainee_performance() {
		return trainee_performance;
	}

	public void setTrainee_performance(String trainee_performance) {
		this.trainee_performance = trainee_performance;
	}

}
