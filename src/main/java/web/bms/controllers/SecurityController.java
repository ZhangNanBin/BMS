package web.bms.controllers;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import web.bms.entity.User;
import web.bms.services.ISecurityService;

@Controller
@RequestMapping("Security")
public class SecurityController extends ControllerBase {
	static final List<Integer> UserType = Arrays.asList(0, 1); // 0代表操作员 1代表读者
	private ISecurityService securityService;

	@Autowired
	public SecurityController(ISecurityService securityService) {
		this.securityService = securityService;
	}

	@ResponseBody
	@RequestMapping("login")
	public Map<String, Object> login(HttpServletRequest request, @RequestParam("number") String number,
			@RequestParam("passWord") String passWord, @RequestParam("userType") int userType) {
		if (!UserType.contains(userType)) {
			return Error("类型代码不存在");
		}

		User user = securityService.login(number, passWord, userType);
		if (user == null) {
			return Error("用户或密码不正确");
		}
		securityService.setSession(request, user,userType);
		return Success(user);
	}

	@ResponseBody
	@RequestMapping("getSession")
	public Map<String, Object> getSession(HttpServletRequest request) {
		User user = securityService.getSession(request);
		return Success(user);
	}

	@ResponseBody
	@RequestMapping("closeSession")
	public Map<String, Object> closeSession(HttpServletRequest request) {
		request.getSession().removeAttribute("CurrentUser");
		return Success();
	}
}
