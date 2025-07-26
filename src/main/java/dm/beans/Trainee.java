package dm.beans;

import java.sql.Date;

public class Trainee {

	private int snumber,age;
	
	private String id, password, 
	selectcourse, name, phone, email, occupation, address, city, learning_licence, status, fee, feestatus,
	gender, altnumber, mothername, fathername, transaction_id; 
	private Date date;
	
	
	public Trainee() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Trainee(int age, String selectcourse, String name, String phone, String email, String occupation,
			String address, String city, String learning_licence, String gender, String altnumber, String mothername,
			String fathername, Date date) {
		super();
		this.age = age;
		this.selectcourse = selectcourse;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.occupation = occupation;
		this.address = address;
		this.city = city;
		this.learning_licence = learning_licence;
		this.gender = gender;
		this.altnumber = altnumber;
		this.mothername = mothername;
		this.fathername = fathername;
		this.date = date;
	}
	public int getSnumber() {
		return snumber;
	}
	public void setSnumber(int snumber) {
		this.snumber = snumber;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getFee() {
		return fee;
	}
	public void setFee(String fee) {
		this.fee = fee;
	}
	public String getFeestatus() {
		return feestatus;
	}
	public void setFeestatus(String feestatus) {
		this.feestatus = feestatus;
	}
	public String getTransaction_id() {
		return transaction_id;
	}
	public void setTransaction_id(String transaction_id) {
		this.transaction_id = transaction_id;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getSelectcourse() {
		return selectcourse;
	}
	public void setSelectcourse(String selectcourse) {
		this.selectcourse = selectcourse;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getOccupation() {
		return occupation;
	}
	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getLearning_licence() {
		return learning_licence;
	}
	public void setLearning_licence(String learning_licence) {
		this.learning_licence = learning_licence;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAltnumber() {
		return altnumber;
	}
	public void setAltnumber(String altnumber) {
		this.altnumber = altnumber;
	}
	public String getMothername() {
		return mothername;
	}
	public void setMothername(String mothername) {
		this.mothername = mothername;
	}
	public String getFathername() {
		return fathername;
	}
	public void setFathername(String fathername) {
		this.fathername = fathername;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	
	
	
	
}
