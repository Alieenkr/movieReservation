package seat.db;

public class seatBean {
	
	private String c_name;
	private String screenNO;
	private int seatNO;
	private int isSold;
	private int show_num;
	private String showdate;
	private String rCode;
	
	public String getrCode() {
		return rCode;
	}
	public void setrCode(String rCode) {
		this.rCode = rCode;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getScreenNO() {
		return screenNO;
	}
	public void setScreenNO(String screenNO) {
		this.screenNO = screenNO;
	}
	public int getSeatNO() {
		return seatNO;
	}
	public void setSeatNO(int seatNO) {
		this.seatNO = seatNO;
	}
	public int getIsSold() {
		return isSold;
	}
	public void setIsSold(int isSold) {
		this.isSold = isSold;
	}
	public int getShow_num() {
		return show_num;
	}
	public void setShow_num(int show_num) {
		this.show_num = show_num;
	}
	public String getShowdate() {
		return showdate;
	}
	public void setShowdate(String showdate) {
		this.showdate = showdate;
	}

}
