package payInfo.db;

public class payInfoBean {
	
	private int payCode;
	private String paidmon; // ���� �ݾ� o
	private String paidpoi; // ��� ����Ʈ o 
	private String paidTot; // ���� ���� �ݾ� o
	private String isPaid; // Ƽ���� �߱ǵǾ��°� ����, �⺻������ 0(�̹߱�)���� ����. ���� Ƽ��Ȯ�ο��� ���ͳݰ����� Ƽ�Ϲ������ֱ�. 1�� �� ����, Ƽ�� �����ֱ�.
	private String payMeth; // ���ҹ��(���ͳ�,����) o
	private String paidDate; // ���� �Ͻ� o
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
