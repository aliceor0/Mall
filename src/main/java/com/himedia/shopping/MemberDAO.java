package com.himedia.shopping;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDAO {
	int doSignup(String userid,String passwd,String name,String email,String mobile);
	int doLogin(String userid,String passwd);
	int manager(String userid,String passwd);
	int checkId(String userid);
	String getMember_id(String userid);
	int eqmobile(int mobile,int member_id);
	
	//결제내역불러오기
		ArrayList<SalesDTO> findTotal_basic(int member_id);
		ArrayList<SalesDTO> findTotal_card(int member_id);
		ArrayList<SalesDTO> findTotal_toss(int member_id);
		
		//결제 내역 삭제하기
		int delList(int member_id,String order_dt);
		int delList_basic(int member_id,String order_dt);
		int delList_card(int member_id,String order_dt);
		int delList_toss(int member_id,String order_dt);
}
