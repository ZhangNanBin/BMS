package web.bms.utility;

import java.util.HashMap;
import java.util.Map;

public class Error {
	private int code = 1; // 设置错误代码
	private String msg;

	public Error(String msg) {
		this.setMsg(msg);
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
	
	public Map<String, Object> toMap(){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", this.code);
		map.put("msg", this.msg);
		return map;
	}
}
