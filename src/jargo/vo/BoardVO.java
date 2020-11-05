package jargo.vo;

public class BoardVO {
	private int board_number;
	private String customer_id;
	private String board_title;
	private String board_memo;
	private String board_time;
	private int store_number;
	public BoardVO() {
		
	}
	public BoardVO(int board_number) {
		this.board_number = board_number;
	}
	public BoardVO(int board_number, String customer_id, String board_title,
			String board_memo, String board_time, int store_number) {
		this.board_number = board_number;
		this.customer_id = customer_id;
		this.board_title = board_title;
		this.board_memo = board_memo;
		this.board_time = board_time;
		this.store_number = store_number;
	}
	public int getBoard_number() {
		return board_number;
	}
	public void setBoard_number(int board_number) {
		this.board_number = board_number;
	}
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_memo() {
		return board_memo;
	}
	public void setBoard_memo(String board_memo) {
		this.board_memo = board_memo;
	}
	public String getBoard_time() {
		return board_time;
	}
	public void setBoard_time(String board_time) {
		this.board_time = board_time;
	}
	public int getStore_number() {
		return store_number;
	}
	public void setStore_number(int store_number) {
		this.store_number = store_number;
	}
	@Override
	public String toString() {
		return "BoardVO [board_number=" + board_number + ", customer_id="
				+ customer_id + ", board_title=" + board_title
				+ ", board_memo=" + board_memo + ", board_time=" + board_time
				+ ", store_number=" + store_number + "]";
	}
	
}
