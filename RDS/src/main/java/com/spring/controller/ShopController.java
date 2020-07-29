package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/shop/*")
public class ShopController {

	@GetMapping("/searchList")
	public void getSearchList() {
		log.info("검색 리스트 호출");
	}
}
