package web.bms.utility;

public class Page {
	private int pageNo;
	private int pageSize;

	public Page(int pageNo, int pageSize) {
		this.setPageNo(pageNo);
		this.setPageSize(pageSize);
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
}
