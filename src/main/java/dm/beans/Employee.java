package dm.beans;

public class Employee {
	
private String emp_id, pass, name, email, phone;

public Employee(String emp_id, String pass, String name, String email, String phone) {
	super();
	this.emp_id = emp_id;
	this.pass = pass;
	this.name = name;
	this.email = email;
	this.phone = phone;
}

public String getEmp_id() {
	return emp_id;
}

public void setEmp_id(String emp_id) {
	this.emp_id = emp_id;
}

public String getPass() {
	return pass;
}

public void setPass(String pass) {
	this.pass = pass;
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
	
	
}
