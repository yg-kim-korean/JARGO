package jargo.vo;

public class MasterVO {
	private int master_number;
	private String master_name;
	
	public MasterVO() {
	}
	public MasterVO(int master_number) {
		this.master_number = master_number;
	}
	public MasterVO(int master_number, String master_name) {
		this.master_number = master_number;
		this.master_name = master_name;
	}
	public int getMaster_number() {
		return master_number;
	}
	public void setMaster_number(int master_number) {
		this.master_number = master_number;
	}
	public String getMaster_name() {
		return master_name;
	}
	public void setMaster_name(String master_name) {
		this.master_name = master_name;
	}
	
}
