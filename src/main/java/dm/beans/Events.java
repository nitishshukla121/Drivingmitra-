package dm.beans;

public class Events {

	//event_id, event_name, venue, organizer, description, event_date
	private Integer event_id;
	 private String event_name, venue, organizer, description, event_date;

	public Events(String event_name, String venue, String organizer, String description, String event_date) {
		super();
		this.event_name = event_name;
		this.venue = venue;
		this.organizer = organizer;
		this.description = description;
		this.event_date = event_date;
	}
	

	public Events() {
		super();
		// TODO Auto-generated constructor stub
	}


	public String getEvent_name() {
		return event_name;
	}

	public void setEvent_name(String event_name) {
		this.event_name = event_name;
	}

	public String getVenue() {
		return venue;
	}

	public void setVenue(String venue) {
		this.venue = venue;
	}

	public String getOrganizer() {
		return organizer;
	}

	public void setOrganizer(String organizer) {
		this.organizer = organizer;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getEvent_date() {
		return event_date;
	}

	public void setEvent_date(String event_date) {
		this.event_date = event_date;
	}

	 
	 
}
