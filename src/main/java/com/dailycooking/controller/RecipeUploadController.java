package com.dailycooking.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
public class RecipeUploadController {
	
	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		log.info("upload ajax");
	}
	
	@PostMapping("/uploadAjaxAction")
	public void uploadAjaxPost(MultipartFile[] uploadFile) {
		log.info("update ajax post.....");
		
		String uploadFolder = "C:\\uploadP";
		
		File uploadPath = new File(uploadFolder, getFolder());
		log.info("upload Path : " + uploadPath);
		
		if(uploadPath.exists() == false) { // 현재 년 월 일 날짜의 폴더가 존재하지않으면
			uploadPath.mkdirs(); // 폴더 생성
		}
		
		for(MultipartFile mf : uploadFile) {
			log.info("..........................");
			log.info("Upload File Name : " + mf.getOriginalFilename());
			log.info("Upload File Size : " + mf.getSize());
			
			String uploadFileName = mf.getOriginalFilename();
			
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") +1);
			log.info("only file name : " + uploadFileName);
			
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName; // 파일명 앞에 랜덤 uuid값과 _ 를 붙임
			
			File saveFile = new File(uploadPath, uploadFileName);
			
			try {
				mf.transferTo(saveFile);
				if(checkImageType(saveFile)) { // 이미지 파일이면 썸네일 만들기
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_"+uploadFileName));
					
					Thumbnailator.createThumbnail(mf.getInputStream(), thumbnail, 100, 100);
					
					thumbnail.close();
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				log.error(e.getMessage());
			}
		}
	}
	
	private String getFolder() { // 년 월 일 폴더생성
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
	}
	
	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			
			return contentType.startsWith("image");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
}
