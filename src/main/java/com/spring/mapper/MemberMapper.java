package com.spring.mapper;

import javax.naming.directory.ModificationItem;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.MemberVO;
import com.spring.domain.ModifyMemberVO;

public interface MemberMapper {
	public int signUp(MemberVO member);
	public MemberVO getMember(String email);
	public MemberVO checkPwd(MemberVO member);
	public int modify(ModifyMemberVO modifyMember);
	public int forgetPwd(MemberVO member);
}
