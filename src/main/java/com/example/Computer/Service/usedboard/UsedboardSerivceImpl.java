package com.example.Computer.Service.usedboard;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.Computer.model.freeboard.dto.FreeReplyDTO;
import com.example.Computer.model.freeboard.dto.FreeboardDTO;
import com.example.Computer.model.usedboard.dao.UsedBoardDAO;
import com.example.Computer.model.usedboard.dto.UsedReplyDTO;
import com.example.Computer.model.usedboard.dto.UsedboardDTO;



@Service
public class UsedboardSerivceImpl implements UsedboardService {
	@Inject
	UsedBoardDAO usedboardDao;
	
	
	@Override
	public List<UsedboardDTO> usedboardlist(int start, int end, String search_option, String keyword) throws Exception {
		
		return usedboardDao.usedboardlist(start, end, search_option, keyword);
	}

	@Override
	public int count(String search_option, String keyword) throws Exception {

		return usedboardDao.count(search_option, keyword);
	}

	@Override
	public void increaseViewcnt(int ubno) throws Exception {
		usedboardDao.increaseViewcnt(ubno);

	}

	@Override
	public UsedboardDTO read(int ubno) throws Exception {
		
		return usedboardDao.read(ubno);
	}

	@Override
	public List<UsedReplyDTO> usedreplylist(Integer ubno, int start, int end, HttpSession session) {
		
		return usedboardDao.usedreplylist(ubno, start, end, session);
	}

	

	@Override
	public int usedreplycount(int fbno) {
		
		return usedboardDao.usedreplycount(fbno);
	}
	@Transactional
	@Override
	public void usedboardinsert(UsedboardDTO dto) throws Exception {
		usedboardDao.usedboardinsert(dto);
		//첨부파일 정보 저장 
		String [] files = dto.getFile();
		if(files ==null)return;
		for(String name : files) {
			usedboardDao.addimg(name);
		}

	}

	@Transactional   //필수 레코드 수정과 첨푸아일 업로드는 트랜잭셕이니깐
	@Override
	public void usedboardupdate(UsedboardDTO dto) throws Exception {
		usedboardDao.usedboardupdate(dto);
		String [] files= dto.getFile();
		System.out.println("첨부파일 : "+ files);
		if(files ==null) return;
		for(String name : files) {
			String imgname = usedboardDao.usedimgsearch(name,dto.getUbno());
			if(imgname == null) {
				usedboardDao.updateimg(name, dto.getUbno());
			}
			
		}

	}

	@Override
	public void usedboarddelete(int ubno) throws Exception {
		usedboardDao.usedboarddelete(ubno);

	}

	@Override
	public void deleteimg(String imgname) {
		usedboardDao.deleteimg(imgname);
		
	}

	@Override
	public List<String> getimg(int ubno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addimg(String imgname) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateimg(String imgname, int ubno) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void usedreplyinsert(UsedReplyDTO dto) {
			usedboardDao.usedreplyinsert(dto);
		
	}

	@Override
	public void usedreplyadd(UsedReplyDTO dto) {
			usedboardDao.usedreplyadd(dto);
		
	}

	@Override
	public void usedreplydel(String ubno, String urno) throws Exception {
			usedboardDao.usedreplydel(ubno, urno);
		
	}

}
