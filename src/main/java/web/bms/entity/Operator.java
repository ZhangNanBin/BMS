package web.bms.entity;

import java.util.Date;

public class Operator extends User {
	private Date workDate;

	public Date getWorkDate() {
		return workDate;
	}

	public void setWorkDate(Date workDate) {
		this.workDate = workDate;
	}
}