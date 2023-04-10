package modelGetSet;

public class PassPayment {
	private int P_id;
	private float amt;
	private String TranType;
	private String TranDate;
	
	public int getP_id() {
		return P_id;
	}
	public void setP_id(int p_id) {
		P_id = p_id;
	}
	public float getAmt() {
		return amt;
	}
	public void setAmt(float amt) {
		this.amt = amt;
	}
	public String getTranType() {
		return TranType;
	}
	public void setTranType(String tranType) {
		TranType = tranType;
	}
	public String getTranDate() {
		return TranDate;
	}
	public void setTranDate(String tranDate) {
		TranDate = tranDate;
	}
	
}
