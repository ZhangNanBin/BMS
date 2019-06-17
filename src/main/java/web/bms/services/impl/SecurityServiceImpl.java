package web.bms.services.impl;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.bms.entity.User;
import web.bms.mappers.ISecurityMapper;
import web.bms.services.ISecurityService;

@Service
public class SecurityServiceImpl implements ISecurityService {
	private ISecurityMapper securityMapper;

	@Autowired
	public SecurityServiceImpl(ISecurityMapper securityMapper) {
		this.securityMapper = securityMapper;
	}

	@Override
	public User login(String number, String passWord, int userType) {
		return securityMapper.login(number, passWord, userType);
	}

	@Override
	public void setSession(HttpServletRequest request, User user) {
		user.setPassWord(null);
		request.getSession().setAttribute("CurrentUser", user);
	}

	@Override
	public User getSession(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("CurrentUser");
		return user;
	}
}
