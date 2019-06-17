package web.bms.mappers;

import org.apache.ibatis.annotations.Param;

import web.bms.entity.User;

public interface ISecurityMapper {
	User login(@Param("number") String number,@Param("passWord") String passWord, @Param("userType") int userType);
}
