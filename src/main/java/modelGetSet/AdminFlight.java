package modelGetSet;

public class AdminFlight {
	private int FlightID;
	private String FlightCode;
	private String FlightSource;
	private String FlightDest;
	private int FlightPrice;
	private int FlightSeats;
	private String bdate;
	
	

	public String getBdate() {
		return bdate;
	}
	public void setBdate(String bdate) {
		this.bdate = bdate;
	}
	public int getFlightSeats() {
		return FlightSeats;
	}
	public void setFlightSeats(int flightSeats) {
		FlightSeats = flightSeats;
	}
	public int getFlightID() {
		return FlightID;
	}
	public void setFlightID(int flightID) {
		FlightID = flightID;
	}
	public String getFlightCode() {
		return FlightCode;
	}
	public void setFlightCode(String flightCode) {
		FlightCode = flightCode;
	}
	public String getFlightSource() {
		return FlightSource;
	}
	public void setFlightSource(String flightSource) {
		FlightSource = flightSource;
	}
	public String getFlightDest() {
		return FlightDest;
	}
	public void setFlightDest(String flightDest) {
		FlightDest = flightDest;
	}
	public int getFlightPrice() {
		return FlightPrice;
	}
	public void setFlightPrice(int flightPrice) {
		FlightPrice = flightPrice;
	}
	
	
}
