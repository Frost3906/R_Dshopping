package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.BoardVO;
import com.spring.domain.MemberCriteria;
import com.spring.domain.MemberPageVO;
import com.spring.domain.MemberVO;
import com.spring.domain.MyPageOrderVO;
import com.spring.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;
	
	@Override
	public int signUp(MemberVO member) {
		return mapper.signUp(member);
	}	
	@Override
	public int googleSignUp(MemberVO member) {
		return mapper.googleSignUp(member);
	}
	@Override
	public MemberVO getMember(String username) {
		return mapper.getMember(username);
	}
	@Override
	public MemberVO checkPwd(MemberVO member) {
		return mapper.checkPwd(member);
	}
	@Override
	public int modify(MemberVO member) {
		return mapper.modify(member);
	}
	@Override
	public int modifyNull(MemberVO member) {
		return mapper.modifyNull(member);
	}
	@Override
	public int manageModify(MemberVO member) {
		return mapper.manageModify(member);
	}
	@Override
	public int forgetPwd(MemberVO member) {
		return mapper.forgetPwd(member);
	}
	@Override
	public MemberVO getBySNS(MemberVO snsMember) {
		MemberVO member=null;
		if(snsMember.getGoogleID() != null) {
			member=mapper.getBySnsGoogle(snsMember);			
		}
		return member;
	}	
	@Override
	public List<MemberVO> listMember() {
		return mapper.listMember();
	}	
	@Override
	public int leaveMember(String username) {
		return mapper.leaveMember(username);
	}
	
	//pagination
	@Override
	public int totalMember(MemberCriteria memberCri) {
		return mapper.totalMember(memberCri);
	}
	@Override
	public int getTotalBoard(String username) {
		return mapper.getTotalBoard(username);
	}
	@Override
	public List<BoardVO> myPageList(String username, MemberCriteria memberCri) {
		return mapper.myPageList(username, memberCri);
	}
	
	//Admin
	@Override
	public List<MemberVO> manageList(MemberCriteria memberCri){
		return mapper.manageList(memberCri);
	}
	@Override
	public int createAdmin(MemberVO member) {
		return mapper.createAdmin(member);
	}
	@Override
	public List<MemberVO> searchMember(MemberCriteria memberCri) {
		return mapper.searchMember(memberCri);
	}
	@Override
	public int searchTotal(MemberCriteria memberCri) {
		return mapper.searchTotal(memberCri);
	}
	@Override
	public List<MemberVO> getNotAdmin(MemberCriteria memberCri, String role) {
		return mapper.getNotAdmin(memberCri, role);
	}
	@Override
	public int getNotAdminTotal(MemberCriteria memberCri, String role) {
		return mapper.getNotAdminTotal(memberCri, role);
	}
	@Override
	public List<MemberVO> getNotAdminSearch(MemberCriteria memberCri, String role) {
		return mapper.getNotAdminSearch(memberCri, role);
	}
	@Override
	public int getNotAdminSearchTotal(MemberCriteria memberCri, String role) {
		return mapper.getNotAdminSearchTotal(memberCri, role);
	}
	
	
	//MyPage
	@Override
	public List<BoardVO> qnaList(String username) {
		return mapper.qnaList(username);
	}
	@Override
	public List<MyPageOrderVO> orderList(String username) {
		return mapper.orderList(username);
	}
	
	
	
	//Security
	@Override
	public int SmemAuthInsert(MemberVO member) {
		return mapper.SmemAuthInsert(member);
	}

	@Override
	public int SmemInsert(MemberVO member) {
		return mapper.SmemInsert(member);
	}
	
	@Override
	public int SmemDelete(String username) {
		return mapper.SmemDelete(username);
	}

	@Override
	public int SmemAuthDelete(String username) {
		return mapper.SmemAuthDelete(username);
	}

	@Override
	public int SmemUpdateM(MemberVO member) {
		return mapper.SmemUpdateM(member);
	}

	@Override
	public int SmemUpdateA(MemberVO member) {
		return mapper.SmemUpdateA(member);
	}
}
