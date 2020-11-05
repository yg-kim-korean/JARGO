package jargo.vo;

import org.springframework.web.multipart.MultipartFile;

public class StoreCommand {
	
	private int store_number;
	private String store_name;
	private String store_phone;
	private String store_addr;
	private String store_desc;
	private String store_subway;
	private String store_img;
	private String store_lat;
	private String store_lng;
	private int master_number;
	private String owner_id;
	MultipartFile file;

	public StoreCommand() {

	}

	public StoreCommand(int store_number) {
		this.store_number = store_number;
	}	

	public StoreCommand(int store_number, String store_name,
			String store_phone, String store_addr, String store_desc,
			String store_subway, String store_lat, String store_lng,
			int master_number, String owner_id, MultipartFile file) {
		this.store_number = store_number;
		this.store_name = store_name;
		this.store_phone = store_phone;
		this.store_addr = store_addr;
		this.store_desc = store_desc;
		this.store_subway = store_subway;
		this.store_lat = store_lat;
		this.store_lng = store_lng;
		this.master_number = master_number;
		this.owner_id = owner_id;
		this.file = file;
	}

	public int getStore_number() {
		return store_number;
	}

	public void setStore_number(int store_number) {
		this.store_number = store_number;
	}

	public String getStore_name() {
		return store_name;
	}

	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}

	public String getStore_phone() {
		return store_phone;
	}

	public void setStore_phone(String store_phone) {
		this.store_phone = store_phone;
	}

	public String getStore_addr() {
		return store_addr;
	}

	public void setStore_addr(String store_addr) {
		this.store_addr = store_addr;
	}

	public String getStore_desc() {
		return store_desc;
	}

	public void setStore_desc(String store_desc) {
		this.store_desc = store_desc;
	}

	public String getStore_subway() {
		return store_subway;
	}

	public void setStore_subway(String store_subway) {
		this.store_subway = store_subway;
	}

	public String getStore_img() {
		return store_img;
	}

	public void setStore_img(String store_img) {
		this.store_img = store_img;
	}

	public String getStore_lat() {
		return store_lat;
	}

	public void setStore_lat(String store_lat) {
		this.store_lat = store_lat;
	}

	public String getStore_lng() {
		return store_lng;
	}

	public void setStore_lng(String store_lng) {
		this.store_lng = store_lng;
	}

	public int getMaster_number() {
		return master_number;
	}

	public void setMaster_number(int master_number) {
		this.master_number = master_number;
	}

	public String getOwner_id() {
		return owner_id;
	}

	public void setOwner_id(String owner_id) {
		this.owner_id = owner_id;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	@Override
	public String toString() {
		return "StoreCommand [store_number=" + store_number + ", store_name="
				+ store_name + ", store_phone=" + store_phone + ", store_addr="
				+ store_addr + ", store_desc=" + store_desc + ", store_subway="
				+ store_subway + ", store_lat=" + store_lat + ", store_lng="
				+ store_lng + ", master_number=" + master_number
				+ ", owner_id=" + owner_id + ", file=" + file + "]";
	}
	
	

}
