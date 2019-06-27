package payInfo.db;

public class payInfoBean {
	
	private int payCode;
	private String paidmon; // 결제 금액 o
	private String paidpoi; // 사용 포인트 o 
	private String paidTot; // 최종 결제 금액 o
	private String isPaid; // 티켓이 발권되었는가 여부, 기본적으로 0(미발권)으로 셋팅. 나의 티켓확인에서 인터넷결제는 티켓발행해주기. 1로 값 변경, 티켓 보여주기.
	private String payMeth; // 지불방법(인터넷,현장) o
	private String paidDate; // 결제 일시 o
	private String mem_id;
	private String rCode;
	
	
	public String getrCode() {
		return rCode;
	}
	public void setrCode(String rCode) {
		this.rCode = rCode;
	}
	public int getPayCode() {
		return payCode;
	}
	public void setPayCode(int payCode) {
		this.payCode = payCode;
	}
	public String getPaidmon() {
		return paidmon;
	}
	public void setPaidmon(String paidmon) {
		this.paidmon = paidmon;
	}
	public String getPaidpoi() {
		return paidpoi;
	}
	public void setPaidpoi(String paidpoi) {
		this.paidpoi = paidpoi;
	}
	public String getPaidTot() {
		return paidTot;
	}
	public void setPaidTot(String paidTot) {
		this.paidTot = paidTot;
	}
	public String getIsPaid() {
		return isPaid;
	}
	public void setIsPaid(String isPaid) {
		this.isPaid = isPaid;
	}
	public String getPayMeth() {
		return payMeth;
	}
	public void setPayMeth(String payMeth) {
		this.payMeth = payMeth;
	}
	public String getPaidDate() {
		return paidDate;
	}
	public void setPaidDate(String paidDate) {
		this.paidDate = paidDate;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	

}
