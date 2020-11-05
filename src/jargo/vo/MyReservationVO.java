package jargo.vo;

public class MyReservationVO {
	private String store_name;
	private String store_phone;
	private String store_addr;
	private	String store_subway;
	private String reservation_date;
	private String reservation_time;
	private String seat_location;
	public MyReservationVO() {

	}
	public MyReservationVO(String store_name, String store_phone,
			String store_addr, String store_subway, String reservation_date,
			String reservation_time, String seat_location) {
		this.store_name = store_name;
		this.store_phone = store_phone;
		this.store_addr = store_addr;
		this.store_subway = store_subway;
		this.reservation_date = reservation_date;
		this.reservation_time = reservation_time;
		this.seat_location = seat_location;
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
	public String getStore_subway() {
		return store_subway;
	}
	public void setStore_subway(String store_subway) {
		this.store_subway = store_subway;
	}
	public String getReservation_date() {
		return reservation_date;
	}
	public void setReservation_date(String reservation_date) {
		this.reservation_date = reservation_date;
	}
	public String getReservation_time() {
		return reservation_time;
	}
	public void setReservation_time(String reservation_time) {
		this.reservation_time = reservation_time;
	}
	public String getSeat_location() {
		return seat_location;
	}
	public void setSeat_location(String seat_location) {
		this.seat_location = seat_location;
	}
	@Override
	public String toString() {
		return "MyReservationVO [store_name=" + store_name + ", store_phone="
				+ store_phone + ", store_addr=" + store_addr
				+ ", store_subway=" + store_subway + ", reservation_date="
				+ reservation_date + ", reservation_time=" + reservation_time
				+ ", seat_location=" + seat_location + "]";
	}
	
	
}
