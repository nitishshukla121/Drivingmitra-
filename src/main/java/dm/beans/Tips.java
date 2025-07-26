package dm.beans;

import java.sql.Date;


public class Tips {

	
//	tipsid, trainerid, vehicle_type, tips_content, date
	 private int tipsid;
	private String trainerid, vehicle_type, tips_content;
	Date date;
	public Tips(String trainerid, String vehicle_type, String tips_content, Date date) {
		super();
		this.trainerid = trainerid;
		this.vehicle_type = vehicle_type;
		this.tips_content = tips_content;
		this.date = date;
	}
	
	public Tips() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getTrainerid() {
		return trainerid;
	}
	public void setTrainerid(String trainerid) {
		this.trainerid = trainerid;
	}
	public String getVehicle_type() {
		return vehicle_type;
	}
	public void setVehicle_type(String vehicle_type) {
		this.vehicle_type = vehicle_type;
	}
	public String getTips_content() {
		return tips_content;
	}
	public void setTips_content(String tips_content) {
		this.tips_content = tips_content;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	
}
