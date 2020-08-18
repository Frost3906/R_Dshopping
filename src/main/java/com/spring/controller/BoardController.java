package com.spring.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.AttachFileVO;
import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;
import com.spring.domain.BoardPageVO;
import com.spring.service.BoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
//	@PreAuthorize("isAuthenticated()")
//	@GetMapping("/register")
//	public void registerGet() {
//		log.info("register form 요청");
//	}
	
	// 글 등록하기
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/register")
	public String registerPost(BoardVO vo, RedirectAttributes rttr) {
		log.info("글 등록 요청 " + vo);
		
		if (vo.getAttachList() != null) {
			vo.getAttachList().forEach(attach -> log.info(attach + ""));
		}
		if (service.insertBoard(vo)) {
			rttr.addFlashAttribute("result", vo.getBno());
			return "register";
		} else {
			return "register";
		}
	}
	
	// list 요청
	@GetMapping("/list")
	public void list(Model model, @ModelAttribute("cri") Criteria cri) {
		log.info("list 요청");
		
		// 현재 페이지에 보여줄 게시물
		model.addAttribute("list", service.getList(cri));
		// 하단의 페이지 나누기와 관련된 정보
		model.addAttribute("pageVO", new BoardPageVO(cri, service.totalRows(cri)));
	}

	// 내용보기
	@GetMapping(value= {"/read","/modify"})
	public void read(int bno,Model model, @ModelAttribute ("cri") Criteria cri) {
		log.info("게시물 읽기 요청" + bno + "..." + cri);
		BoardVO vo = service.getBoard(bno);
		model.addAttribute("vo",vo);
		// http://localhost:8080/board/read
		// http://localhost:8080/board/modify
	}
	
	// 내용수정
	@PreAuthorize("principal.username == #vo.writer")
	@PostMapping("/modify")
	public String update(BoardVO vo, Criteria cri, RedirectAttributes rttr) {
		log.info("내용 수정..." + vo + "..." + cri);
		
		if (service.updateBoard(vo)) {
			rttr.addAttribute("bno", vo.getBno());
			rttr.addAttribute("pageNum", cri.getPageNum());
			rttr.addAttribute("amount", cri.getAmount());
			rttr.addAttribute("type", cri.getType());
			rttr.addFlashAttribute("keyword", cri.getKeyword());
			
			return "redirect:read";
		} else {
			rttr.addAttribute("bno", vo.getBno());
			rttr.addAttribute("pageNum", cri.getPageNum());
			rttr.addAttribute("amount", cri.getAmount());
			rttr.addAttribute("type", cri.getType());
			rttr.addFlashAttribute("keyword", cri.getKeyword());
			
			return "redirect:modify";
		}
	}
	
	// 내용삭제
	@PreAuthorize("principal.username == #writer")
	@PostMapping("/remove")
	public String deletePost(int bno, String writer, Criteria cri, RedirectAttributes rttr) {
		log.info("게시글 삭제 " + bno);
		
		List<AttachFileVO> attachList = service.attachList(bno);
		
		service.deleteBoard(bno);
		deleteFiles(attachList);
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addFlashAttribute("result", "success");
		
		return "redirect:list";
	}
	
	// 첨부물 가져오기 컨트롤러 작성
	@GetMapping("/getAttachList")
	public ResponseEntity<List<AttachFileVO>> getAttachList(int bno) {
		log.info("첨부물 가져오기 " + bno);
		
		return new ResponseEntity<List<AttachFileVO>>(service.attachList(bno), HttpStatus.OK);
	}
	
	// 게시글 삭제 시 서버 폴더에 첨부물 삭제
	private void deleteFiles(List<AttachFileVO> attachList) {
		if (attachList == null || attachList.size() == 0) {
			return;
		}
		for (AttachFileVO vo : attachList) {
			Path file = Paths.get("d:\\upload\\", vo.getUploadPath() + "\\" + vo.getUuid() + "_" + vo.getFileName());
			
			try {
				// 일반파일, 이미지 원본 파일 삭제
				Files.deleteIfExists(file);
				
				// 썸네일 삭제
				if (Files.probeContentType(file).startsWith("image")) {
					Path thumb = Paths.get("d:\\upload\\", vo.getUploadPath() + "\\s_" + vo.getUuid() + "_" + vo.getFileName());
					Files.delete(thumb);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
}
