package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.BoardVO;
import com.spring.domain.MemberCriteria;
import com.spring.domain.MemberPageVO;
import com.spring.domain.MemberVO;
import com.spring.domain.MyPageOrderVO;
import com.spring.domain.ReplyVO;

import lombok.experimental.PackagePrivate;

public interface MemberMapper {
	//Member
	public MemberVO read(String userid);
	public int signUp(MemberVO member);
	public int googleSignUp(MemberVO member);
	public MemberVO getMember(String username);
	public MemberVO checkPwd(MemberVO member);
	public int modify(MemberVO member);
	public int modifyNull(MemberVO member);
	public int manageModify(MemberVO member);
	public int forgetPwd(MemberVO member);
	public MemberVO getBySnsNaver(MemberVO snsMember);
	public MemberVO getBySnsGoogle(MemberVO snsMember);
	public List<MemberVO> listMember();
	public int leaveMember(String username);
		
	//pagination
	public int totalMember(MemberCriteria memberCri);
	public List<BoardVO> myPageList(@Param("username") String username, @Param("memberCri") MemberCriteria memberCri);
	public int getTotalBoard(String username);
	
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
	public List<MemberVO> getNotAdmin(@Param("memberCri") MemberCriteria memberCri, @Param("role") String role);
	public int getNotAdminTotal(@Param("memberCri") MemberCriteria memberCri, @Param("role") String role);
	public List<MemberVO> getNotAdminSearch(@Param("memberCri") MemberCriteria memberCri, @Param("role") String role);
	public int getNotAdminSearchTotal(@Param("memberCri") MemberCriteria memberCri, @Param("role") String role);
	
	//MyPage 
	public List<BoardVO> qnaList(String username);
	public List<MyPageOrderVO> orderList(String username);
	public List<ReplyVO> getReplyList(int bno);
	
}
