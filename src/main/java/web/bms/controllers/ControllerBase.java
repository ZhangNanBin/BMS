package web.bms.controllers;

import java.util.Map;

import web.bms.utility.Success;
import web.bms.entity.User;
import web.bms.utility.Error;
import web.bms.utility.Helper;

public class ControllerBase {
	public static Map<String, Object> Success() {
		return new Success().toMap();
	}

	public static Map<String, Object> Success(Object data) {
		return new Success(data).toMap();
	}

	public static Map<String, Object> Success(Object data, int count) {
		return new Success(data, count).toMap();
	}

	public static Map<String, Object> Error(String msg) {
		return new Error(msg).toMap();
	}

	public static Map<String, Object> userValid(User user) {
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