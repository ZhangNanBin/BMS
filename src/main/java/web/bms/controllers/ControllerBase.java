package web.bms.controllers;


import com.alibaba.fastjson.JSONObject;

import web.bms.utility.Success;
import web.bms.utility.Error;

public class ControllerBase {
	public static String Success(Object data) {
		Success s = new Success(data);
		String result =  JSONObject.toJSON(s).toString();
		return result;
	}

	public static String Error(String msg) {
		String result = JSONObject.toJSON(new Error(msg)).toString();
		return result;
	}
}
