package com.spring.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.BoardVO;
import com.spring.domain.MemberCriteria;
import com.spring.domain.MemberVO;

public interface MemberService {
	//Member
	public int signUp(MemberVO member);
	public MemberVO getMember(String username);
	public MemberVO checkPwd(MemberVO member);
	public int modify(MemberVO member);
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
	
	//MyPage
	public List<BoardVO> qnaList(String username);
}
