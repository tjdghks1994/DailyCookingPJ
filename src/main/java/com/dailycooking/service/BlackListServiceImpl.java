package com.dailycooking.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dailycooking.domain.BlackListVO;
import com.dailycooking.domain.Criteria;
import com.dailycooking.mapper.BlackListMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class BlackListServiceImpl implements BlackListService{

	@Setter(onMethod_ = @Autowired)
	private BlackListMapper mapper;
	
	@Override
	public int insertSus(String userid, String reason) {
		log.info("insert Sus" + userid + " - " + reason);
		return mapper.susMember(userid, reason);
	}

	@Override
	public int updateSus(String userid) {
		log.info("update Sus " + userid);
		return mapper.susUpdate(userid);
	}

	@Override
	public BlackListVO readMember(String userid) {
		log.info("readMember..." + userid);
		return mapper.readMember(userid);
	}

	@Override
	public List<BlackListVO> readAll(Criteria cri) {
		log.info("readAll..." + cri);
		return mapper.readAll(cri);
	}

	@Override
	public int getTotal() {
		log.info("get Total ");
		return mapper.getTotal();
	}

	@Override
	public int susFreeze(String userid) {
		log.info("susFreeze : " + userid);
		return mapper.susFreeze(userid);
	}

	@Override
	public int susRemove(String userid) {
		log.info("susRemove : " + userid);
		return mapper.susDelete(userid);
	}

}
