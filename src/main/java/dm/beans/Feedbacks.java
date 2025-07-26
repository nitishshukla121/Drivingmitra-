package dm.beans;

import java.sql.Date;

public class Feedbacks {
/*//Table: feedbacks
	Columns:
		feedback_id int AI PK 
		name varchar(45) 
		email varchar(45) 
		remarks varchar(551) 
		rating int 
		date date*/
	private  int feedback_id ;
	private String name,email,remarks,rating;
	private Date date;
	
	
	
	public Feedbacks() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Feedbacks(String name, String email, String remarks, String rating, Date date) {
		super();
		this.name = name;
		this.email = email;
		this.remarks = remarks;
		this.rating = rating;
		this.date = date;
	}
	public int getFeedback_id() {
		return feedback_id;
	}
	public void setFeedback_id(int feedback_id) {
		this.feedback_id = feedback_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	
}
