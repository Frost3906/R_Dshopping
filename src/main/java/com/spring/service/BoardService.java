package com.spring.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.AttachFileVO;
import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;

public interface BoardService {
	// 게시판과 관련된 기능 목록
	boolean insertBoard(BoardVO vo);
	boolean updateBoard(BoardVO vo);
	boolean deleteBoard(int bno);
	BoardVO getBoard(int bno);
	List<BoardVO> getList(Criteria cri);
	int totalRows(Criteria cri);
	
	// 첨부물 기능
	List<AttachFileVO> attachList(int bno);
	
	//게시판 answer 값 변경 쿼리
	public int modifyAnswer(String answer, int bno);
}
