package jargo.vo;

public class ReservationVO {
	private int reservation_number;
	private String reservation_status;
	private String customer_id;
	private int store_number;
	private int reservation_totalprice;
	
	public ReservationVO() {
	}

	public ReservationVO(int reservation_number) {
		this.reservation_number = reservation_number;
	}
	
	
	
	public ReservationVO(String reservation_status, int store_number,
			int reservation_totalprice) {
		this.reservation_status = reservation_status;
		this.store_number = store_number;
		this.reservation_totalprice = reservation_totalprice;
	}

	public ReservationVO(String customer_id) {
		this.customer_id = customer_id;
	}
	
	public ReservationVO(int reservation_number, int store_number) {
		this.reservation_number = reservation_number;
		this.store_number = store_number;
	}

	public ReservationVO(String customer_id, int store_number) {
		super();
		this.customer_id = customer_id;
		this.store_number = store_number;
	}

	@Override
	public String toString() {
		return "ReservationVO [reservation_number=" + reservation_number
				+ ", reservation_status=" + reservation_status
				+ ", customer_id=" + customer_id + ", store_number="
				+ store_number + ", reservation_totalprice="
				+ reservation_totalprice + "]";
	}

	public ReservationVO(int reservation_number, String reservation_status,
			String customer_id, int store_number, int reservation_totalprice) {
		this.reservation_number = reservation_number;
		this.reservation_status = reservation_status;
		this.setCustomer_id(customer_id);
		this.setStore_number(store_number);
		this.reservation_totalprice = reservation_totalprice;
	}

	public int getReservation_number() {
		return reservation_number;
	}
	public void setReservation_number(int reservation_number) {
		this.reservation_number = reservation_number;
	}
	public String getReservation_status() {
		return reservation_status;
	}
	public void setReservation_status(String reservation_status) {
		this.reservation_status = reservation_status;
	}
	public int getReservation_totalprice() {
		return reservation_totalprice;
	}
	public void setReservation_totalprice(int reservation_totalprice) {
		this.reservation_totalprice = reservation_totalprice;
	}

	public String getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}

	public int getStore_number() {
		return store_number;
	}

	public void setStore_number(int store_number) {
		this.store_number = store_number;
	}
	
}
