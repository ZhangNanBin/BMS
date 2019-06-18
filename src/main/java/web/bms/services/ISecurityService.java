package web.bms.services;

import javax.servlet.http.HttpServletRequest;

import web.bms.entity.User;

public interface ISecurityService {
	public User login(String number, String passWord, int userType);

	public void setSession(HttpServletRequest request, User user,int userType);

	public User getSession(HttpServletRequest request);
}