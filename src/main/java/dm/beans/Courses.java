package dm.beans;

public class Courses {

	//course_name, cahrge, discription
	private  String course_name, charge, discription,duration;

	
	

	public Courses(String course_name, String charge, String discription ,String duration) {
		super();
		this.course_name = course_name;
		this.charge = charge;
		this.discription = discription;
		this.duration=duration;
	}


	public Courses() {
		super();
		// TODO Auto-generated constructor stub
	}


	public String getCourse_name() {
		return course_name;
	}

	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}

	public String getCharge() {
		return charge;
	}

	public void setCahrge(String charge) {
		this.charge = charge;
	}

	public String getDiscription() {
		return discription;
	}

	public void setDiscription(String discription) {
		this.discription = discription;
	}


	public String getDuration() {
		return duration;
	}


	public void setDuration(String duration) {
		this.duration = duration;
	}
		
	
}
