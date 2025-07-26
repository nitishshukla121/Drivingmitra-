package dm.beans;

public class Assignment {

	 private String   trainer_id, trainee_id, status;
private Trainee tr;

	public Trainee getTr() {
	return tr;
}

public void setTr(Trainee tr) {
	this.tr = tr;
}

	public Assignment(String trainer_id, String trainee_id, String status) {
		super();
		this.trainer_id = trainer_id;
		this.trainee_id = trainee_id;
		this.status = status;
	}

	public Assignment() {
		super();
		// TODO Auto-generated constructor stub
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
