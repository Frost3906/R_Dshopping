package com.spring.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.BoardVO;
import com.spring.domain.MemberCriteria;
import com.spring.domain.MemberPageVO;
import com.spring.domain.MemberVO;
import com.spring.domain.MyPageOrderVO;

public interface MemberService {
	//Member
	public int signUp(MemberVO member);
	public int googleSignUp(MemberVO member);
	public MemberVO getMember(String username);
	public MemberVO checkPwd(MemberVO member);
	public int modify(MemberVO member);
	public int modifyNull(MemberVO member);
	public int manageModify(MemberVO member);
	public int forgetPwd(MemberVO member);
	public MemberVO getBySNS(MemberVO snsMember);
	public List<MemberVO> listMember();
	public int leaveMember(String username);	
	
	
	//pagination
	public int totalMember(MemberCriteria memberCri);
	public int getTotalBoard(String username);
	public List<BoardVO> myPageList(String username, MemberCriteria memberCri);
	
	
	//security table 
	public int SmemAuthInsert(MemberVO member);
	public int SmemInsert(MemberVO member);
	public int SmemDelete(String username);
	public int SmemAuthDelete(String username);
	public int SmemUpdateM(MemberVO member);
	public int SmemUpdateA(MemberVO member);
	
	//Admin
	public List<MemberVO> manageList(MemberCriteria memberCri);
	public int createAdmin(MemberVO member);
	public List<MemberVO> searchMember(MemberCriteria memberCri);
	public int searchTotal(MemberCriteria memberCri);
	
	//MyPage
	public List<BoardVO> qnaList(String username);
	public List<MyPageOrderVO> orderList(String username);
}
