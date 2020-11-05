package jargo.vo;

public class OwnerVO {
	private String owner_id;
	private String owner_pwd;
	private String owner_name;
	private String owner_phone;
	private String owner_position;
	
	public OwnerVO() {
	}
	public OwnerVO(String owner_id) {
		this.owner_id = owner_id;
	}
	public OwnerVO(String owner_id, String owner_pwd, String owner_name,
			String owner_phone, String owner_position) {
		this.owner_id = owner_id;
		this.owner_pwd = owner_pwd;
		this.owner_name = owner_name;
		this.owner_phone = owner_phone;
		this.owner_position = owner_position;
	}
	public String getOwner_id() {
		return owner_id;
	}
	public void setOwner_id(String owner_id) {
		this.owner_id = owner_id;
	}
	public String getOwner_pwd() {
		return owner_pwd;
	}
	public void setOwner_pwd(String owner_pwd) {
		this.owner_pwd = owner_pwd;
	}
	public String getOwner_name() {
		return owner_name;
	}
	public void setOwner_name(String owner_name) {
		this.owner_name = owner_name;
	}
	public String getOwner_phone() {
		return owner_phone;
	}
	public void setOwner_phone(String owner_phone) {
		this.owner_phone = owner_phone;
	}
	public String getOwner_position() {
		return owner_position;
	}
	public void setOwner_position(String owner_position) {
		this.owner_position = owner_position;
	}
	@Override
	public String toString() {
		return "OwnerVO [owner_id=" + owner_id + ", owner_pwd=" + owner_pwd
				+ ", owner_name=" + owner_name + ", owner_phone=" + owner_phone
				+ ", owner_position=" + owner_position + "]";
	}
	
}
