package jargo.vo;

import org.springframework.web.multipart.MultipartFile;

public class MenuCommand {
	private int menu_number;
	private String menu_name;
	private int menu_price;
	private String menu_desc;
	private String menu_category;
	private String menu_img;
	MultipartFile file;
	
	
	
	public MenuCommand(String menu_name, int menu_price, String menu_desc,
			String menu_category, MultipartFile file) {
		this.menu_name = menu_name;
		this.menu_price = menu_price;
		this.menu_desc = menu_desc;
		this.menu_category = menu_category;
		this.file = file;
	}


	public MenuCommand(int menu_number, String menu_name, int menu_price,
			String menu_desc, String menu_category, MultipartFile file) {
		this.menu_number = menu_number;
		this.menu_name = menu_name;
		this.menu_price = menu_price;
		this.menu_desc = menu_desc;
		this.menu_category = menu_category;
		this.file = file;
	}
	
	


	public MenuCommand(String menu_name, int menu_price, String menu_desc,
			String menu_category, String menu_img, MultipartFile file) {
		this.menu_name = menu_name;
		this.menu_price = menu_price;
		this.menu_desc = menu_desc;
		this.menu_category = menu_category;
		this.menu_img = menu_img;
		this.file = file;
	}


	public MenuCommand(int menu_number, String menu_name, int menu_price,
			String menu_desc, String menu_category, String menu_img,
			MultipartFile file) {
		this.menu_number = menu_number;
		this.menu_name = menu_name;
		this.menu_price = menu_price;
		this.menu_desc = menu_desc;
		this.menu_category = menu_category;
		this.menu_img = menu_img;
		this.file = file;
	}


	public MenuCommand(int menu_number) {
		this.menu_number = menu_number;
	}
	
	public MenuCommand(int menu_number, String menu_name, int menu_price,
			String menu_desc, String menu_category, String menu_img) {
		this.menu_number = menu_number;
		this.menu_name = menu_name;
		this.menu_price = menu_price;
		this.menu_desc = menu_desc;
		this.menu_category = menu_category;
		this.menu_img = menu_img;
	}
	
	


	public MenuCommand(String menu_name, int menu_price, String menu_desc,
			String menu_category, String menu_img) {
		this.menu_name = menu_name;
		this.menu_price = menu_price;
		this.menu_desc = menu_desc;
		this.menu_category = menu_category;
		this.menu_img = menu_img;
	}


	public MenuCommand() {
	}


	public int getMenu_number() {
		return menu_number;
	}


	public void setMenu_number(int menu_number) {
		this.menu_number = menu_number;
	}


	public String getMenu_name() {
		return menu_name;
	}


	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}


	public int getMenu_price() {
		return menu_price;
	}


	public void setMenu_price(int menu_price) {
		this.menu_price = menu_price;
	}


	public String getMenu_desc() {
		return menu_desc;
	}


	public void setMenu_desc(String menu_desc) {
		this.menu_desc = menu_desc;
	}


	public String getMenu_category() {
		return menu_category;
	}


	public void setMenu_category(String menu_category) {
		this.menu_category = menu_category;
	}


	public MultipartFile getFile() {
		return file;
	}


	public void setFile(MultipartFile file) {
		this.file = file;
	}

	

	public String getMenu_img() {
		return menu_img;
	}


	public void setMenu_img(String menu_img) {
		this.menu_img = menu_img;
	}


	@Override
	public String toString() {
		return "MenuCommand [menu_number=" + menu_number + ", menu_name="
				+ menu_name + ", menu_price=" + menu_price + ", menu_desc="
				+ menu_desc + ", menu_category=" + menu_category + ", file="
				+ file + "]";
	}
	
	
	
	
}
