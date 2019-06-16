package web.bms.utility;

public class Success {
	private int code = 0; // 设置成功代码
	private int count;
	private Object data;
	
	public Success() {
		
	}
	
	public Success(Object data) {
		this.setData(data);
	}

	public Success(Object data, int count) {
		this.setCount(count);
		this.setData(data);
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}
}
