package com.dailycooking.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dailycooking.domain.Criteria;
import com.dailycooking.domain.RecipeReplyVO;
import com.dailycooking.service.RecipeRelpyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/reply/*")
@RestController
@Log4j
@AllArgsConstructor
public class RecipeReplyController {

	private RecipeRelpyService service;
	
	@PostMapping(value = "/new", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody RecipeReplyVO vo){
		log.info("RecipeReplyVO : " + vo);
		
		int insertCount = service.register(vo);
		
		log.info("Reply 등록 결과 - 컨트롤러 : " + insertCount);
		
		return insertCount == 1 ? new ResponseEntity<>("insertOk", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value = "/pages/{recipenum}/{page}",
			produces = {MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<RecipeReplyVO>> getList(
			@PathVariable("page") int page,
			@PathVariable("recipenum") Long recipenum) {
		
		log.info("getList............");
		Criteria cri = new Criteria(page, 10);
		log.info(cri);
		
		return new ResponseEntity<>(service.getList(cri, recipenum), HttpStatus.OK);
	}
	
	@GetMapping(value = "/{replynum}",
			produces = {MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<RecipeReplyVO> get(@PathVariable("replynum") Long replynum) {
		log.info("get reply - 컨트롤러 : " + replynum);
		
		return new ResponseEntity<>(service.get(replynum), HttpStatus.OK);
	}
	
	@DeleteMapping(value = "/{replynum}", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> remove(@PathVariable("replynum") Long replynum) {
		log.info("delete reply - 컨트롤러 : " + replynum);
		
		return service.remove(replynum) == 1 ? new ResponseEntity<>("deleteOk",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
			value = "/{replynum}", consumes = "application/json",
			produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> modify(@RequestBody RecipeReplyVO vo,
			@PathVariable("replynum") Long replynum){
		
		vo.setReplynum(replynum);
		
		log.info("replynum : " + replynum);
		log.info("modify reply - 컨트롤러 : " + vo);
		
		return service.modify(vo) == 1 ? new ResponseEntity<>("updateOk", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
