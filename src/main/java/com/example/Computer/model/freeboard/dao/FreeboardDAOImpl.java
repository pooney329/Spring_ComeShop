package com.example.Computer.model.freeboard.dao;

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
@Repository
public class FreeboardDAOImpl implements FreeboardDAO{
	private static final String NAMESPACE = "Freeboard";
	private static final String LIST = NAMESPACE+".list";  //목록보여주기 
	private static final String COUNT = NAMESPACE+".count";  //레코드갯수가하여 페이징
	private static final String INCVIEWCNT = NAMESPACE+".increaseviewcnt"; //조회수증가
	
	private static final String VIEW = NAMESPACE+".view"; //글읽기
	private static final String FREREPLYINSERT = NAMESPACE+".freereplyinsert"; //댓글달기
	private static final String FREREPLYLIST = NAMESPACE+".freereplylist"; //댓글목록가져오기
	private static final String FREREPLYCOUNT = NAMESPACE+".freereplycount"; //댓글목록갯수가져오기
	private static final String FREBOARDINSERT = NAMESPACE+".freeboardinsert"; //자유게시글 삽입
	private static final String FREBOARDUPDATE = NAMESPACE+".freeboardupdate"; //자유게시글 수정
	private static final String FREBOARDDELETE = NAMESPACE+".freeboarddelete"; //자유게시글 삭제
	private static final String FREREPLYDEL = NAMESPACE+".freereplydel"; //자유게시글 댓글삭제
	
	
	
	
	
	
	
		
	@Inject
	SqlSession sqlSession;
	@Override
	public List<FreeboardDTO> freboardlist(int start, int end, String search_option, String keyword)
			throws Exception {
		
		
		
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
	public void increaseViewcnt(int fbno) throws Exception {
		
		sqlSession.update(INCVIEWCNT , fbno);
		
	}

	@Override
	public FreeboardDTO read(int fbno) throws Exception {

		return sqlSession.selectOne(VIEW, fbno);
	}

	@Override
	public List<FreeReplyDTO> freereplylist(Integer fbno, int start, int end, HttpSession session) {
		
		Map<String,Object> map =new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("fbno", fbno);
		return sqlSession.selectList(FREREPLYLIST, map);
	}

	@Override
	public void frereplyinsert(FreeReplyDTO dto) {
		sqlSession.insert(FREREPLYINSERT, dto);
		
	}

	@Override
	public int freereplycount(int fbno) {

		return sqlSession.selectOne(FREREPLYCOUNT,fbno);
	}



	@Override
	public void freboardinsert(FreeboardDTO dto) throws Exception {
		
		sqlSession.insert(FREBOARDINSERT,dto);
	}



	@Override
	public void freeboardupdate(FreeboardDTO dto) throws Exception {
		sqlSession.update(FREBOARDUPDATE, dto);
		
	}



	@Override
	public void freeboarddelete(int fbno) throws Exception {
		sqlSession.delete(FREBOARDDELETE,fbno);
		
	}



	@Override
	public void freereplydel(String fbno, String frno) throws Exception {
		Map<String,String> map = new HashMap<String, String>();
		map.put("fbno", fbno);
		map.put("frno", frno);
		
		sqlSession.delete(FREREPLYDEL,map);
	}


	//대댓글달기
	@Override
	public void freereplyadd(FreeReplyDTO dto) {
		
		sqlSession.update("Freeboard.repleychange",dto);
		
		sqlSession.insert("Freeboard.repleyadd",dto);
		
		
		
		
		
	}

	

}	

