package jargo.vo;

import org.springframework.web.multipart.MultipartFile;

public class CouponCommand {
	
	private int coupon_number;
	private String coupon_id;
	private String coupon_expired;
	private int coupon_usable;
	private int store_number;
	private String coupon_img;
	MultipartFile file;
	
	public CouponCommand() {
	}

	public CouponCommand(int coupon_number) {
		this.coupon_number = coupon_number;
	}

	public CouponCommand(int coupon_number, String coupon_id,
			String coupon_expired, int coupon_usable, int store_number,
			String coupon_img, MultipartFile file) {
		this.coupon_number = coupon_number;
		this.coupon_id = coupon_id;
		this.coupon_expired = coupon_expired;
		this.coupon_usable = coupon_usable;
		this.store_number = store_number;
		this.coupon_img = coupon_img;
		this.file = file;
	}

	public int getCoupon_number() {
		return coupon_number;
	}

	public void setCoupon_number(int coupon_number) {
		this.coupon_number = coupon_number;
	}

	public String getCoupon_id() {
		return coupon_id;
	}

	public void setCoupon_id(String coupon_id) {
		this.coupon_id = coupon_id;
	}

	public String getCoupon_expired() {
		return coupon_expired;
	}

	public void setCoupon_expired(String coupon_expired) {
		this.coupon_expired = coupon_expired;
	}

	public int getCoupon_usable() {
		return coupon_usable;
	}

	public void setCoupon_usable(int coupon_usable) {
		this.coupon_usable = coupon_usable;
	}

	public int getStore_number() {
		return store_number;
	}

	public void setStore_number(int store_number) {
		this.store_number = store_number;
	}

	public String getCoupon_img() {
		return coupon_img;
	}

	public void setCoupon_img(String coupon_img) {
		this.coupon_img = coupon_img;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	@Override
	public String toString() {
		return "CouponCommand [coupon_number=" + coupon_number + ", coupon_id="
				+ coupon_id + ", coupon_expired=" + coupon_expired
				+ ", coupon_usable=" + coupon_usable + ", store_number="
				+ store_number + ", coupon_img=" + coupon_img + ", file="
				+ file + "]";
	}
	
	

}
