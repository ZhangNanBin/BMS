package web.bms.entity;

import java.util.Date;

import javax.xml.crypto.Data;

public class BookBorrowing {
	private int id;
	private String bookBarCodeString;
	private String readerNumber;
	private Date borrowingDate;
	private Data returnDateData;
	private String OperatorNumber;
	private boolean paid;
	private boolean sendBack;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBookBarCodeString() {
		return bookBarCodeString;
	}

	public void setBookBarCodeString(String bookBarCodeString) {
		this.bookBarCodeString = bookBarCodeString;
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

	public Data getReturnDateData() {
		return returnDateData;
	}

	public void setReturnDateData(Data returnDateData) {
		this.returnDateData = returnDateData;
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
}