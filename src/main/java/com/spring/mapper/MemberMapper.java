package com.spring.mapper;

import java.util.List;

import com.spring.domain.BoardVO;
import com.spring.domain.MemberCriteria;
import com.spring.domain.MemberPageVO;
import com.spring.domain.MemberVO;
import com.spring.domain.ModifyMemberVO;

public interface MemberMapper {
	//Member
	public MemberVO read			(String userid);
	public int		signUp			(MemberVO member);
	public MemberVO getMember		(String email);
	public MemberVO checkPwd		(MemberVO member);
	public int		modify			(ModifyMemberVO modifyMember);
	public int		forgetPwd		(MemberVO member);
	public MemberVO getBySnsNaver	(MemberVO snsMember);
	public MemberVO getBySnsGoogle	(MemberVO snsMember);
	public List<MemberVO> listMember();
	
	public int totalMember(MemberCriteria memberCri);
	
	//Admin
	public List<MemberVO> manageList(MemberCriteria memberCri);
	
	
	//MyPage 
	public List<BoardVO> qnaList(String email);
	
}
