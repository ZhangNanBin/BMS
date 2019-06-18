package web.bms.entity;

public class Book {
	private Integer id;
	private String barcode;
	private String basicNumber;
	private boolean state;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getBarcode() {
		return barcode;
	}

	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}

	public String getBasicNumber() {
		return basicNumber;
	}

	public void setBasicNumber(String basicNumber) {
		this.basicNumber = basicNumber;
	}

	public boolean getState() {
		return state;
	}

	public void setState(boolean state) {
		this.state = state;
	}
}
