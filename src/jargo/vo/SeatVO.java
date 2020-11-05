package jargo.vo;

public class SeatVO {
	private String seat_location;
	private int seat_number;
	private String seat_img;
	private int store_number;
	private int seat_persons;
	private String seat_status;
	
	public SeatVO() {
	}

	public SeatVO(int seat_number) {
		this.seat_number = seat_number;
	}	



	public SeatVO(String seat_location, int store_number) {
		super();
		this.seat_location = seat_location;
		this.store_number = store_number;
	}

	public SeatVO(String seat_location, int seat_number, String seat_img,
			int store_number, int seat_persons, String seat_status) {
		this.seat_location = seat_location;
		this.seat_number = seat_number;
		this.seat_img = seat_img;
		this.store_number = store_number;
		this.seat_persons = seat_persons;
		this.seat_status = seat_status;
	}

	public int getSeat_number() {
		return seat_number;
	}
	public void setSeat_number(int seat_number) {
		this.seat_number = seat_number;
	}

	public int getSeat_persons() {
		return seat_persons;
	}
	public void setSeat_persons(int seat_persons) {
		this.seat_persons = seat_persons;
	}
	public String getSeat_status() {
		return seat_status;
	}
	public void setSeat_status(String seat_status) {
		this.seat_status = seat_status;
	}
	public int getStore_number() {
		return store_number;
	}
	public void setStore_number(int store_number) {
		this.store_number = store_number;
	}

	public String getSeat_img() {
		return seat_img;
	}

	public void setSeat_img(String seat_img) {
		this.seat_img = seat_img;
	}

	public String getSeat_location() {
		return seat_location;
	}

	public void setSeat_location(String seat_location) {
		this.seat_location = seat_location;
	}

	@Override
	public String toString() {
		return "SeatVO [seat_location=" + seat_location + ", seat_number="
				+ seat_number + ", seat_img=" + seat_img + ", store_number="
				+ store_number + ", seat_persons=" + seat_persons
				+ ", seat_status=" + seat_status + "]";
	}
	
	
	
}
