package re.db;

public class reBean {
		
	private String rCode;
	private String m_title;	
	private String c_name;
	private String showdate;
	private String screenNO;
	private String showtime;
	private String people;
	private String reSeat;
	private String mem_id;
	private String reserDate; // 결제 일시 o
	
	public String getrCode() {
		return rCode;
	}
	public void setrCode(String rCode) {
		this.rCode = rCode;
	}
	public String getM_title() {
		return m_title;
	}
	public void setM_title(String m_title) {
		this.m_title = m_title;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getShowdate() {
		return showdate;
	}
	public void setShowdate(String showdate) {
		this.showdate = showdate;
	}
	public String getScreenNO() {
		return screenNO;
	}
	public void setScreenNO(String screenNO) {
		this.screenNO = screenNO;
	}
	public String getShowtime() {
		return showtime;
	}
	public void setShowtime(String showtime) {
		this.showtime = showtime;
	}
	public String getPeople() {
		return people;
	}
	public void setPeople(String people) {
		this.people = people;
	}
	public String getReSeat() {
		return reSeat;
	}
	public void setReSeat(String reSeat) {
		this.reSeat = reSeat;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getReserDate() {
		return reserDate;
	}
	public void setReserDate(String reserDate) {
		this.reserDate = reserDate;
	}
	
}
