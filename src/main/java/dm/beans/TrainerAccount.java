package dm.beans;

import java.sql.Date;

public class TrainerAccount {
	
	private String trainer_id, password, name, email, phone, gender, address, dricption,experience;

	
	Date date;


	public TrainerAccount() {
		super();
		// TODO Auto-generated constructor stub
	}


	public TrainerAccount(String trainer_id, String password, String name, String email, String phone, String gender,
			String address, String dricption, String experience, Date date) {
		super();
		this.trainer_id = trainer_id;
		this.password = password;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.gender = gender;
		this.address = address;
		this.dricption = dricption;
		this.experience = experience;
		this.date = date;
	}


	public String getTrainer_id() {
		return trainer_id;
	}


	public void setTrainer_id(String trainer_id) {
		this.trainer_id = trainer_id;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
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


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getDricption() {
		return dricption;
	}


	public void setDricption(String dricption) {
		this.dricption = dricption;
	}


	public String getExperience() {
		return experience;
	}


	public void setExperience(String experience) {
		this.experience = experience;
	}


	public Date getDate() {
		return date;
	}


	public void setDate(Date date) {
		this.date = date;
	}
	
	
	
	
	
	
}
