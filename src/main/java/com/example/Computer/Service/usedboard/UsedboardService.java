package com.example.Computer.Service.usedboard;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.example.Computer.model.freeboard.dto.FreeReplyDTO;
import com.example.Computer.model.freeboard.dto.FreeboardDTO;
import com.example.Computer.model.usedboard.dto.UsedReplyDTO;
import com.example.Computer.model.usedboard.dto.UsedboardDTO;


public interface UsedboardService {
	
	
	
	//목록(페이지 나누기 , 검색 기능 포함)
	public List<UsedboardDTO> usedboardlist(int start, int end, String search_option,String keyword)  throws Exception;
	//레코드 갯수 계산
	public int count(String search_option, String keyword) throws Exception;
	//조회수 증가 처리
	public void increaseViewcnt(int ubno) throws Exception;
	
	//글읽기 
	public UsedboardDTO read(int ubno) throws Exception; 
	
	//중고게시판 댓글 가져오기 
	public List<UsedReplyDTO> usedreplylist(Integer ubno, int start, int end, HttpSession session);
	
	//댓글수 가져오기 페이징을 위하여 
	public int usedreplycount (int ubno);
	
	//중고게시글삽입
	public void usedboardinsert(UsedboardDTO dto ) throws Exception ;
	//중고게시글수정
	public void usedboardupdate(UsedboardDTO dto) throws Exception; 
	//중고게시글삭제
	public void usedboarddelete(int ubno) throws Exception;
	//첨부파일삭제
	public void deleteimg(String imgname);
	
	
	public List<String> getimg(int ubno); //첨부파일 목록
	public void addimg(String imgname);//첨부파일 저장
	public void updateimg(String imgname ,int ubno); //첨부파일 수정
	
	
	//부모댓글달기
	public void usedreplyinsert(UsedReplyDTO dto);
	//자식댓글달기(대댓글)
	public void usedreplyadd(UsedReplyDTO dto);

	//댓글삭제
	public void usedreplydel(String ubno, String urno)throws Exception;

	 
	
	
	
}











