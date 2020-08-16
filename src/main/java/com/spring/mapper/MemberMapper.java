package com.spring.mapper;

import java.util.List;

import com.spring.domain.BoardVO;
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
	
	//MyPage 
	public List<BoardVO> qnaList(String email);
	
}
