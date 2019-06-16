package web.bms.utility;

public class Success {
	private int code = 0; // 设置成功代码
	private String msg = "";
	private int count;
	private Object data;
	
	public Success() {
		
	}
	
	public Success(Object data) {
		this.setData(data);
	}

	public Success(Object data, int count) {
		this.setData(data);
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
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
