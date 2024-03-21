package com.bswill.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.bswill.domain.SalaryCriteria;
import com.bswill.domain.SalaryListVO;
import com.bswill.domain.SalaryVO;
import com.bswill.persistence.SalaryDAO;

@Service
public class SalaryServiceImpl implements SalaryService{

	// DAO 객체 주입
	@Inject
	private SalaryDAO sdao;
	
	private static final Logger logger = LoggerFactory.getLogger(SalaryServiceImpl.class);
	
	@Override
	public List<SalaryVO> getSalaryList() throws Exception {
		logger.debug(" getSalaryList() 실행! ");
		
		return sdao.salaryListSelect();
	}

	@Override
	public List<Map<String, Object>> getSalarySearch(SalaryCriteria cri) throws Exception {
		logger.debug(" getSalarySearch() 실행! ");
		
		return sdao.salarySearchSelect(cri);
	}
	
	
}
