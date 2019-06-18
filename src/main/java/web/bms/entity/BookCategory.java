package web.bms.entity;

public class BookCategory {
	private Integer id;
	private String number;
	private String name;
	private int borrowableDays; // 可借天数
	private double finesAmount; // 罚款金额

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

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

	public int getBorrowableDays() {
		return borrowableDays;
	}

	public void setBorrowableDays(int borrowableDays) {
		this.borrowableDays = borrowableDays;
	}

	public double getFinesAmount() {
		return finesAmount;
	}

	public void setFinesAmount(double finesAmount) {
		this.finesAmount = finesAmount;
	}
}
