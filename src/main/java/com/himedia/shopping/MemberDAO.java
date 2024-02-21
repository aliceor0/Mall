package com.himedia.shopping;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDAO {
	int doSignup(String userid,String passwd,String name,String email,String mobile);
	int doLogin(String userid,String passwd);
	int manager(String userid,String passwd);
	int checkId(String userid);
	String getMember_id(String userid);
}
