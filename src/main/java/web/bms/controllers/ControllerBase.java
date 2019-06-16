package web.bms.controllers;

import com.alibaba.fastjson.JSONObject;

import web.bms.utility.Success;
import web.bms.utility.Error;

public class ControllerBase {
	public static String Success() {
		return JSONObject.toJSON(new Success()).toString();
	}

	public static String Success(Object data) {
		return JSONObject.toJSON(new Success(data)).toString();
	}

	public static String Success(Object data, int count) {
		return JSONObject.toJSON(new Success(data, count)).toString();
	}

	public static String Error(String msg) {
		return JSONObject.toJSON(new Error(msg)).toString();
	}
}