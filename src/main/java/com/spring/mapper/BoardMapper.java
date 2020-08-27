package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;
import com.spring.domain.MemberCriteria;

public interface BoardMapper {
	public List<BoardVO> list(Criteria cri);
	public int insert(BoardVO vo);
	public int update(BoardVO vo);
	public int delete(int bno);
	
	public int total(Criteria cri);
	public BoardVO read(int bno);
	public int updateReplyCnt(@Param("bno") int bno, @Param("amount") int amount);
	
	public int totalMember(MemberCriteria memberCri);
	
	//게시판 answer 값 변경 쿼리
	public int modifyAnswer(@Param("answer") String answer, @Param("bno") int bno);
}
