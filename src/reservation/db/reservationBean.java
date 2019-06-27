package reservation.db;

public class reservationBean {
	
	private int r_num;	
	private String mem_id;
	private String r_date;
	private int ticNum;
	private int show_num;
	private int ticRelease;

	
	public int getR_num() {
		return r_num;
	}
	public void setR_num(int r_num) {
		this.r_num = r_num;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getR_date() {
		return r_date;
	}
	public void setR_date(String r_date) {
		this.r_date = r_date;
	}
	public int getTicNum() {
		return ticNum;
	}
	public void setTicNum(int ticNum) {
		this.ticNum = ticNum;
	}
	public int getShow_num() {
		return show_num;
	}
	public void setShow_num(int show_num) {
		this.show_num = show_num;
	}
	public int getTicRelease() {
		return ticRelease;
	}
	public void setTicRelease(int ticRelease) {
		this.ticRelease = ticRelease;
	}
}
