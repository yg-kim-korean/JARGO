package jargo.vo;

public class TimeVO {
private int reservation_number;
private String reservation_date;
private String reservation_time;
private String time_status;
private int seat_number;


public TimeVO(){
	
}


public TimeVO(int reservation_number) {
	this.reservation_number = reservation_number;
}


public TimeVO(String reservation_date, String reservation_time) {
	this.reservation_date = reservation_date;
	this.reservation_time = reservation_time;
}


public TimeVO(int reservation_number, String reservation_date,
		String reservation_time, int seat_number) {
	super();
	this.reservation_number = reservation_number;
	this.reservation_date = reservation_date;
	this.reservation_time = reservation_time;
	this.seat_number = seat_number;
}


public TimeVO(int reservation_number, String reservation_date,
		String reservation_time, String time_status, int seat_number) {
	this.reservation_number = reservation_number;
	this.reservation_date = reservation_date;
	this.reservation_time = reservation_time;
	this.time_status = time_status;
	this.seat_number = seat_number;
}




public int getReservation_number() {
	return reservation_number;
}


public void setReservation_number(int reservation_number) {
	this.reservation_number = reservation_number;
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


public String getTime_status() {
	return time_status;
}


public void setTime_status(String time_status) {
	this.time_status = time_status;
}


public int getSeat_number() {
	return seat_number;
}


public void setSeat_number(int seat_number) {
	this.seat_number = seat_number;
}




@Override
public String toString() {
	return "TimeVO [reservation_number=" + reservation_number
			+ ", reservation_date=" + reservation_date + ", reservation_time="
			+ reservation_time + ", time_status=" + time_status
			+ ", seat_number=" + seat_number + "]";
}




}