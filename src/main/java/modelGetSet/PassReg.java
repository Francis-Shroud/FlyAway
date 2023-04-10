package modelGetSet;

/*
 
 Create table PassengerReg(
P_id int  primary key auto_increment, 
airline_code varchar(3),
Pname varchar(40) not null, 
gender  varchar(6), 
age int, 
passportno  varchar(20),
FOREIGN KEY (airline_code) REFERENCES airlines(code));
 */

public class PassReg {
	private int P_id;
	private String airline_code;
	private String Pname;
	private String gender;
	private int age;
	private String passportno;
	public int getP_id() {
		return P_id;
	}
	public void setP_id(int p_id) {
		P_id = p_id;
	}
	public String getAirline_code() {
		return airline_code;
	}
	public void setAirline_code(String airline_code) {
		this.airline_code = airline_code;
	}
	public String getPname() {
		return Pname;
	}
	public void setPname(String pname) {
		Pname = pname;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getPassportno() {
		return passportno;
	}
	public void setPassportno(String passportno) {
		this.passportno = passportno;
	}
	
	
	
}
