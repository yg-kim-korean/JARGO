package jargo.vo;

public class StoreReservationVO {
	private String customer_name;
	private String customer_phone;
	private String reservation_date;
	private String reservation_time;
	private String seat_location;
	public StoreReservationVO() {
	}
	public StoreReservationVO(String customer_name, String customer_phone,
			String reservation_date, String reservation_time,
			String seat_location) {
		this.customer_name = customer_name;
		this.customer_phone = customer_phone;
		this.reservation_date = reservation_date;
		this.reservation_time = reservation_time;
		this.seat_location = seat_location;
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
	@Override
	public String toString() {
		return "StoreReservationVO [customer_name=" + customer_name
				+ ", customer_phone=" + customer_phone + ", reservation_date="
				+ reservation_date + ", reservation_time=" + reservation_time
				+ ", seat_location=" + seat_location + "]";
	}
	public void setSeat_location(String seat_location) {
		this.seat_location = seat_location;
	}
	
	
	
}
