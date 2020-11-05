package view;

public class View {
	String left;
	String foot;

	public View(String left, String foot) {
		this.left = left;
		this.foot = foot;
	}
	public View() {
		left="left.jsp";
		foot="login.jsp";
	}

	public String getLeft() {
		return left;
	}
	public void setLeft(String left) {
		this.left = left+".jsp";
	}
	public String getFoot() {
		return foot;
	}
	public void setFoot(String foot) {
		this.foot = foot+".jsp";
	}
	
}
