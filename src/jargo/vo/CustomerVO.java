package jargo.vo;

public class CustomerVO {
	private String customer_id;
	private String customer_pwd;
	private String customer_name;
	private String customer_phone;
	private String customer_addr;
	private String customer_email;
	private String customer_favor;
	
	public CustomerVO() {
	}

	public CustomerVO(String customer_id) {
		this.customer_id = customer_id;
	}
	
	public CustomerVO(String customer_id, String customer_pwd,
			String customer_name, String customer_phone, String customer_addr,
			String customer_email, String customer_favor) {
		this.customer_id = customer_id;
		this.customer_pwd = customer_pwd;
		this.customer_name = customer_name;
		this.customer_phone = customer_phone;
		this.customer_addr = customer_addr;
		this.customer_email = customer_email;
		this.customer_favor = customer_favor;
	}
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public String getCustomer_pwd() {
		return customer_pwd;
	}
	public void setCustomer_pwd(String customer_pwd) {
		this.customer_pwd = customer_pwd;
	}
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	public String getCustomer_phone() {
		return customer_phone;
	}
	public void setCustomer_phone(String customer_phone) {
		this.customer_phone = customer_phone;
	}
	public String getCustomer_addr() {
		return customer_addr;
	}
	public void setCustomer_addr(String customer_addr) {
		this.customer_addr = customer_addr;
	}
	public String getCustomer_email() {
		return customer_email;
	}
	public void setCustomer_email(String customer_email) {
		this.customer_email = customer_email;
	}
	public String getCustomer_favor() {
		return customer_favor;
	}
	public void setCustomer_favor(String customer_favor) {
		this.customer_favor = customer_favor;
	}

	@Override
	public String toString() {
		return "'CustomerVO'";
	}
	
	
}
