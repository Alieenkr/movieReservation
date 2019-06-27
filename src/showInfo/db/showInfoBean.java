package showInfo.db;

public class showInfoBean {
	
	private int show_num; //상영정보 번호
	private String screenNO; //상영관 번호(이름)
	private String m_title; //영화 이름
	private String runTime; //상영 시간
	private String showSDate; //시작 날짜
	private String showEDate; //상영 종료 날짜
	private String c_name; //영화관 이름
	private String showTime; //상영시각

	
	public int getShow_num() {
		return show_num;
	}
	public void setShow_num(int show_num) {
		this.show_num = show_num;
	}
	public String getScreenNO() {
		return screenNO;
	}
	public void setScreenNO(String screenNO) {
		this.screenNO = screenNO;
	}
	public String getM_title() {
		return m_title;
	}
	public void setM_title(String m_title) {
		this.m_title = m_title;
	}
	public String getRunTime() {
		return runTime;
	}
	public void setRunTime(String runTime) {
		this.runTime = runTime;
	}
	public String getShowSDate() {
		return showSDate;
	}
	public void setShowSDate(String showSDate) {
		this.showSDate = showSDate;
	}
	public String getShowEDate() {
		return showEDate;
	}
	public void setShowEDate(String showEDate) {
		this.showEDate = showEDate;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getShowTime() {
		return showTime;
	}
	public void setShowTime(String showTime) {
		this.showTime = showTime;
	}
}
