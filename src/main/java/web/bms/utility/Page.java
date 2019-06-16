package web.bms.utility;

public class Page {

	int pageNo = 1;
	int pageSize = 10;

	public int getPageNo() {
		return pageNo;
	}

	public void settPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
}
