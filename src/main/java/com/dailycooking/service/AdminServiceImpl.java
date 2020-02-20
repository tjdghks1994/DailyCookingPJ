package com.dailycooking.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dailycooking.domain.Criteria;
import com.dailycooking.domain.JoinMemberVO;
import com.dailycooking.mapper.AdminMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AdminServiceImpl implements AdminService {

	@Setter(onMethod_ = @Autowired)
	private AdminMapper mapper;
	
	@Override
	public List<JoinMemberVO> getMemberList(Criteria cri) {
		log.info("getMemberList .... Admin Service");
		return mapper.memberList(cri);
	}

	@Override
	public int getTotalCount() {
		log.info("getTotalCount....");
		return mapper.getTotalCount();
	}

}
