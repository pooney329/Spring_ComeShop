package com.example.Computer.Service.Freeboard;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.example.Computer.model.freeboard.dao.FreeboardDAO;
import com.example.Computer.model.freeboard.dto.FreeReplyDTO;
import com.example.Computer.model.freeboard.dto.FreeboardDTO;


@Service
public class FreeboardServiceImpl implements FreeboardService {
	
	
	@Inject
	FreeboardDAO freeboardDao;
	@Override
	public List<FreeboardDTO> freboardlist(int start, int end, String search_option, String keyword)
			throws Exception {
			
		
		return freeboardDao.freboardlist(start, end, search_option, keyword);
	}
	@Override
	public int count(String search_option, String keyword) throws Exception {

		return freeboardDao.count(search_option, keyword);
	}
	@Override
	public void increaseViewcnt(int fbno) throws Exception {
		freeboardDao.increaseViewcnt(fbno);
		
	}
	@Override
	public FreeboardDTO read(int fbno) throws Exception {

		return freeboardDao.read(fbno);
	}
	@Override
	public List<FreeReplyDTO> freereplylist(Integer fbno, int start, int end, HttpSession session) {
		
		return freeboardDao.freereplylist(fbno, start, end, session);
	}
	@Override
	public void frereplyinsert(FreeReplyDTO dto) {
		freeboardDao.frereplyinsert(dto);
		
	}
	@Override
	public int freereplycount(int fbno) {

		return freeboardDao.freereplycount(fbno);
	}
	@Override
	public void freboardinsert(FreeboardDTO dto) throws Exception {
		 freeboardDao.freboardinsert(dto);
		
	}
	@Override
	public void freeboardupdate(FreeboardDTO dto) throws Exception {
		freeboardDao.freeboardupdate(dto);
		
	}
	@Override
	public void freeboarddelete(int bno) throws Exception {
		freeboardDao.freeboarddelete(bno);;
		
	}
	@Override
	public void freereplydel(String fbno, String frno) throws Exception {
		freeboardDao.freereplydel(fbno, frno);
		
	}
	@Override
	public void freereplyadd(FreeReplyDTO dto) {
		freeboardDao.freereplyadd(dto);
		
	}
	

}
