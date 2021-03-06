package com.spring.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.domain.Criteria;
import com.spring.domain.ReplyPageVO;
import com.spring.domain.ReplyVO;
import com.spring.service.BoardService;
import com.spring.service.MemberService;
import com.spring.service.ReplyService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/replies/*")
public class ReplyController {
	
	@Autowired
	private ReplyService service;
	@Autowired
	private MemberService memberService;
	@Autowired
	private BoardService boardService;
	
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/new") // http://localhost:8080/replies/new + post
	public ResponseEntity<String> create(@RequestBody ReplyVO vo) {
		log.info("댓글 등록..." + vo);
		
		//게시판 answer 값 변경을 위한 코딩
		int bno=vo.getBno();
		if(memberService.getMember(vo.getReplyer()).getAuth().equals("ROLE_ADMIN") ||
				memberService.getMember(vo.getReplyer()).getAuth().equals("ROLE_MANAGER")) {			
			boardService.modifyAnswer("답변완료", bno);
		}
		
		
		return service.replyInsert(vo)?
				new ResponseEntity<String>("success",HttpStatus.OK):
					new ResponseEntity<String>("fail",HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 댓글 하나 가져오기 http://localhost:8080/replies/1
	@GetMapping("/{rno}")
	public ResponseEntity<ReplyVO> get(@PathVariable("rno") int rno) {
		log.info("댓글 가져오기" + rno);
		return new ResponseEntity<>(service.replyRead(rno),HttpStatus.OK);
	}
	
	// 댓글 수정하기 http://localhost:8080/replies/1
	@PreAuthorize("principal.username == #vo.replyer")
	@PutMapping("/{rno}")
	public ResponseEntity<String> modify(@PathVariable("rno") int rno,@RequestBody ReplyVO vo) {
		log.info("댓글 수정 " + rno + " 내용 : " + vo.getReply() + " 댓글 작성자 : " + vo.getReplyer());
		vo.setRno(rno);
		 return service.replyUpdate(vo)?
					new ResponseEntity<String>("success",HttpStatus.OK):
						new ResponseEntity<String>("fail",HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 댓글 삭제 http://localhost:8080/replies/1 + delete
	@PreAuthorize("principal.username == #vo.replyer")
	@DeleteMapping("/{rno}")
	public ResponseEntity<String> delete(@PathVariable int rno, @RequestBody ReplyVO vo) {
		log.info("댓글 삭제" + rno + " 댓글 작성자 " + vo.getReplyer());
		 return service.replyDelete(rno)?
					new ResponseEntity<String>("success",HttpStatus.OK):
						new ResponseEntity<String>("fail",HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 글 번호에 해당하는 댓글 리스트 가져오기
	// http://localhost:8080/replies/pages/{bno}/{pageNum}
	// http://localhost:8080/replies/pages/364/1
	// 364번 게시물에 해당하는 댓글 중 첫번째 댓글 페이지 가져오기
	@GetMapping("/pages/{bno}/{pageNum}")
	public ResponseEntity<ReplyPageVO> getList(@PathVariable("bno") int bno,@PathVariable("pageNum") int pageNum) {
		log.info("댓글 가져오기 " + bno + " pageNum = " + pageNum);
		
		Criteria cri = new Criteria(pageNum, 10);
		
		return new ResponseEntity<ReplyPageVO>(service.replyList(cri, bno),HttpStatus.OK);
	}
}
