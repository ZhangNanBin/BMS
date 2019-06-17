package web.bms.controllers;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;

import web.bms.utility.Success;
import web.bms.entity.User;
import web.bms.utility.Error;
import web.bms.utility.Helper;

public class ControllerBase {
	public static String Success() {
		return JSONObject.toJSONString(new Success(),SerializerFeature.WriteMapNullValue);
	}

	public static String Success(Object data) {
		return JSONObject.toJSONString(new Success(data),SerializerFeature.WriteMapNullValue);
	}

	public static String Success(Object data, int count) {
		return JSONObject.toJSONString(new Success(data, count),SerializerFeature.WriteMapNullValue);
	}

	public static String Error(String msg) {
		return JSONObject.toJSONString(new Error(msg),SerializerFeature.WriteMapNullValue);
	}
	
	public static String userValid(User user) {
		if (Helper.isNullOrEmpty(user.getIdNumber())) {
			return Error("编号不能为空");
		}

		if (Helper.isNullOrEmpty(user.getIdNumber())) {
			return Error("身份证号不能为空");
		}

		if (Helper.isNullOrEmpty(user.getName())) {
			return Error("姓名不能为空");
		}

		if (Helper.isNullOrEmpty(user.getPassWord())) {
			return Error("密码不能为空");
		}
		
		return null;
	}
}