package dm.beans;

import java.sql.Date;

//contact_id, user_name, user_email, user_phone, user_question, date
	
public class Contacts {
	
	private int contact_id;
	private String user_name, user_email, user_phone, user_question;
	private Date date;
	
	
	
	
	
	public Contacts() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Contacts(String user_name, String user_email, String user_phone, String user_question, Date date) {
		super();
		this.user_name = user_name;
		this.user_email = user_email;
		this.user_phone = user_phone;
		this.user_question = user_question;
		this.date = date;
	}
	public int getContact_id() {
		return contact_id;
	}
	public void setContact_id(int contact_id) {
		this.contact_id = contact_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_question() {
		return user_question;
	}
	public void setUser_question(String user_question) {
		this.user_question = user_question;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	
}
