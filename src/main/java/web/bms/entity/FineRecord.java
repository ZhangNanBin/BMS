package web.bms.entity;

public class FineRecord {
	private String number; // 读者信息
	private String name; // 读者姓名
	private String telephone; // 读者电话
	private double totalArrears; // 总欠款

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public double getTotalArrears() {
		return totalArrears;
	}

	public void setTotalArrears(double totalArrears) {
		this.totalArrears = totalArrears;
	}

}
