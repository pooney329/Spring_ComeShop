package com.example.Computer.model.usedboard.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.Computer.model.freeboard.dto.FreeReplyDTO;
import com.example.Computer.model.freeboard.dto.FreeboardDTO;
import com.example.Computer.model.usedboard.dto.UsedReplyDTO;
import com.example.Computer.model.usedboard.dto.UsedboardDTO;

@Repository
public class UsedBoardDAOImpl implements UsedBoardDAO {
	
	private static final String NAMESPACE = "usedboard";
	private static final String LIST = NAMESPACE+".list";  //목록보여주기 
	private static final String COUNT = NAMESPACE+".count";  //레코드갯수가하여 페이징
	private static final String INCVIEWCNT = NAMESPACE+".increaseviewcnt"; //조회수증가
	
	private static final String VIEW = NAMESPACE+".view"; //글읽기
	private static final String USEDREPLYINSERT = NAMESPACE+".usedreplyinsert"; //댓글달기
	private static final String USEDREPLYLIST = NAMESPACE+".usedreplylist"; //댓글목록가져오기
	private static final String USEDREPLYCOUNT = NAMESPACE+".usedreplycount"; //댓글목록갯수가져오기
	private static final String USEDREPLYDEL = NAMESPACE+".usedreplydel"; //댓글목록갯수가져오기
	
	
	private static final String USEDBOARDINSERT = NAMESPACE+".usedboardinsert"; //자유게시글 삽입
	private static final String USEDBOARDUPDATE = NAMESPACE+".usedboardupdate"; //자유게시글 수정
	private static final String USEDBOARDDELETE = NAMESPACE+".usedboarddelete"; //자유게시글 삭제
	private static final String DELETEIMG = NAMESPACE+".deleteimg"; //첨부파일삭제
	private static final String ADDIMG = NAMESPACE+".addimg"; //첨부파일추가
	private static final String UPDATEIMG = NAMESPACE+".updateimg"; //첨부파일업데이트
	private static final String GETIMG = NAMESPACE+".getimg"; //첨부파일불러오기

	
	
	
	@Inject
	SqlSession sqlSession; 
	
	@Override
	public List<UsedboardDTO> usedboardlist(int start, int end, String search_option, String keyword) throws Exception {
		
		
		Map<String,Object> map = new HashMap<>();
		map.put("search_option",search_option );
		System.out.println(search_option+"..................::::::");
		if(search_option.equals("writer")) {
			
			keyword = sqlSession.selectOne("Freeboard.nametoid",keyword);
			
			
		}
	
		map.put("keyword", keyword );
		map.put("start", start );
		map.put("end", end);
		
		
		return sqlSession.selectList(LIST, map);
		
		
	}

	@Override
	public int count(String search_option, String keyword) throws Exception {
		
		Map<String,String> map = new HashMap<>();
		map.put("search_option",search_option);
		map.put("keyword",keyword);
		
		return sqlSession.selectOne(COUNT,map);
	}

	@Override
	public void increaseViewcnt(int ubno) throws Exception {
		sqlSession.update(INCVIEWCNT , ubno);
		
	}

	@Override
	public UsedboardDTO read(int ubno) throws Exception {
		return sqlSession.selectOne(VIEW, ubno);
		
	}

	@Override
	public List<UsedReplyDTO> usedreplylist(Integer ubno, int start, int end, HttpSession session) {
		Map<String,Object> map =new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("ubno", ubno);
		return sqlSession.selectList(USEDREPLYLIST, map);
	}

	

	@Override
	public int usedreplycount(int ubno) {
		
		return sqlSession.selectOne(USEDREPLYCOUNT,ubno);
	}

	@Override
	public void usedboardinsert(UsedboardDTO dto) throws Exception {
		sqlSession.insert(USEDBOARDINSERT,dto);
		
	}

	@Override
	public void usedboardupdate(UsedboardDTO dto) throws Exception {
		sqlSession.update(USEDBOARDUPDATE, dto);
		
	}

	@Override
	public void usedboarddelete(int ubno) throws Exception {
		sqlSession.delete(USEDBOARDDELETE,ubno);
		
	}

	@Override
	public void deleteimg(String imgname) {
		sqlSession.delete(DELETEIMG, imgname);
		
	}

	@Override
	public List<String> getimg(int ubno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addimg(String imgname) {
		sqlSession.insert(ADDIMG,imgname);
		
	}

	@Override
	public void updateimg(String imgname, int ubno) {
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("imgname",imgname);
		map.put("ubno",ubno);
		sqlSession.update("usedboard.updateimg",map);
		
	}
	//중고게시판 부모댓글달기
	@Override
	public void usedreplyinsert(UsedReplyDTO dto) {
		sqlSession.insert(USEDREPLYINSERT, dto);
		
	}
	//중고게시판 대댓글달기
	@Override
	public void usedreplyadd(UsedReplyDTO dto) {
		sqlSession.update("usedboard.usedrepleychange",dto);
		
		sqlSession.insert("usedboard.usedrepleyadd",dto);
		
	}

	@Override
	public void usedreplydel(String ubno, String urno) throws Exception {
		Map<String,String> map = new HashMap<String, String>();
		map.put("ubno", ubno);
		map.put("urno", urno);
		
		sqlSession.update(USEDREPLYDEL,map);
		
	}

	@Override
	public String usedimgsearch(String imgname, int ubno) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("imgname", imgname);
		map.put("ubno", ubno);
		
		return sqlSession.selectOne("usedboard.usedimgsearch",map);
	}

	

}
