package web.bms.utility;

public class Error {
	private int code = 0; // 设置错误代码
	private String msg;
	private int count = 0;
	private Object data = null;

	public Error(String msg) {
		this.setMsg(msg);
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
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

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}
}
