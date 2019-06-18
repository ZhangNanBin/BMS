package web.bms.entity;

import java.util.Date;

public class BookBorrowing {
	private int id;
	private String bookBarcode;
	private String readerNumber;
	private Date borrowingDate;
	private Date returnDate;
	private String OperatorNumber;
	private double arrears;
	private boolean paid;
	private boolean sendBack;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBookBarcode() {
		return bookBarcode;
	}

	public void setBookBarcode(String bookBarcode) {
		this.bookBarcode = bookBarcode;
	}

	public String getReaderNumber() {
		return readerNumber;
	}

	public void setReaderNumber(String readerNumber) {
		this.readerNumber = readerNumber;
	}

	public Date getBorrowingDate() {
		return borrowingDate;
	}

	public void setBorrowingDate(Date borrowingDate) {
		this.borrowingDate = borrowingDate;
	}

	public Date getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}

	public String getOperatorNumber() {
		return OperatorNumber;
	}

	public void setOperatorNumber(String operatorNumber) {
		OperatorNumber = operatorNumber;
	}

	public boolean getPaid() {
		return paid;
	}

	public void setPaid(boolean paid) {
		this.paid = paid;
	}

	public boolean getSendBack() {
		return sendBack;
	}

	public void setSendBack(boolean sendBack) {
		this.sendBack = sendBack;
	}

	public double getArrears() {
		return arrears;
	}

	public void setArrears(double arrears) {
		this.arrears = arrears;
	}
}