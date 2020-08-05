package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;
import com.spring.mapper.AttachMapper;
import com.spring.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardMapper mapper;
	@Autowired
	private AttachMapper attach;
	
	@Override
	public boolean insertBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public boolean updateBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public boolean deleteBoard(int bno) {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public BoardVO getBoard(int bno) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<BoardVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int totalRows(Criteria cri) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
