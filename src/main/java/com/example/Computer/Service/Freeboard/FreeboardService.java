package com.example.Computer.Service.Freeboard;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.example.Computer.model.freeboard.dto.FreeReplyDTO;
import com.example.Computer.model.freeboard.dto.FreeboardDTO;








public interface FreeboardService {
	
	
	
	//목록(페이지 나누기 , 검색 기능 포함)
	public List<FreeboardDTO> freboardlist(int start, int end, String search_option,String keyword)  throws Exception;
	//레코드 갯수 계산
	public int count(String search_option, String keyword) throws Exception;
	//조회수 증가 처리
	public void increaseViewcnt(int fbno) throws Exception;
	
	//글읽기 
	public FreeboardDTO read(int fbno) throws Exception; 
	
	//자유게시판 댓글 가져오기 
	public List<FreeReplyDTO> freereplylist(Integer fbno, int start, int end, HttpSession session);
	//부모댓글달기
	public void frereplyinsert(FreeReplyDTO dto);
	//자식댓글달기(대댓글)
	public void freereplyadd(FreeReplyDTO dto);
	//댓글수 가져오기 페이징을 위하여 
	public int freereplycount (int fbno);
	
	//자유게시글삽입
	public void freboardinsert(FreeboardDTO dto ) throws Exception ;
	//자유게시글수정
	public void freeboardupdate(FreeboardDTO dto) throws Exception; 
	//자유게시글삭제
	public void freeboarddelete(int fbno) throws Exception;
	
	//댓글삭제
	public void freereplydel(String fbno, String frno)throws Exception;
	
	
	
}











