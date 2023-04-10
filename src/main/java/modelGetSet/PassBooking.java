package modelGetSet;

public class PassBooking {
	private int id;
	private String AirlineCode;
	private String bdate;
	private int NoBooking;
	private int bookedseat;
	private int booked;
	
	
	
	public int getBooked() {
		return booked;
	}
	public void setBooked(int booked) {
		this.booked = booked;
	}
	public int getBookedseat() {
		return bookedseat;
	}
	public void setBookedseat(int bookedseat) {
		this.bookedseat = bookedseat;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAirlineCode() {
		return AirlineCode;
	}
	public void setAirlineCode(String airlineCode) {
		AirlineCode = airlineCode;
	}
	public String getBdate() {
		return bdate;
	}
	public void setBdate(String bdate) {
		this.bdate = bdate;
	}
	public int getNoBooking() {
		return NoBooking;
	}
	public void setNoBooking(int noBooking) {
		NoBooking = noBooking;
	}
}
