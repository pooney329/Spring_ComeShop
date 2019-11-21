package com.example.Computer.controller.freeboard;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.Computer.Interceptor.SessionAttr;
import com.example.Computer.Service.Freeboard.FreeboardService;
import com.example.Computer.model.freeboard.dto.FreeReplyDTO;
import com.example.Computer.model.freeboard.dto.FreeboardDTO;
import com.example.Computer.model.member.dto.UserDTO;
import com.example.Computer.model.order.dto.OrderListPage;






@Controller
@RequestMapping("/freboard/*")
public class FreeboardController {
	
	 
	
	@Inject
	FreeboardService freeboardService;
	
	//자유게시판목록보여주기
	@RequestMapping("freboardlist")
	public ModelAndView freboardlist(@RequestParam(defaultValue="1") int curPage,
			@RequestParam(defaultValue="all") String search_option,
			@RequestParam(defaultValue="") String keyword) throws Exception{
		
		
		int count=freeboardService.count(search_option, keyword); //레코드 개수
		
		
		OrderListPage pager =new OrderListPage(count,curPage);
		int start = pager.getPageBegin();
		int end =pager.getPageEnd();
		
		List<FreeboardDTO> list = freeboardService.freboardlist(start,end,search_option,keyword); //목록
		
		
		
		ModelAndView mav =new ModelAndView();
		mav.setViewName("freeboard/freeboardlist"); //이동할 페이지 지정
		Map<String,Object> map = new HashMap<>();
		map.put("list",list); //맵에 자료 저장
		map.put("count",count);
		map.put("search_option",search_option);
		map.put("keyword",keyword);
		map.put("pager",pager);
		mav.addObject("map",map); //데이터 저장
		return mav ; //페이지 이동(출력)
		
	}
	
	//자유게시글보여주기
	@RequestMapping(value="view" ,method=RequestMethod.GET)
	public ModelAndView view(@RequestParam int fbno, @RequestParam int curPage , @RequestParam String search_option, @RequestParam String keyword ,HttpSession session)throws Exception{
		freeboardService.increaseViewcnt(fbno);  //조회수 증가 
		ModelAndView mav = new ModelAndView();
		mav.setViewName("freeboard/freeboardview");
		mav.addObject("dto", freeboardService.read(fbno));
		mav.addObject("curPage", curPage);
		mav.addObject("search_option", search_option);
		mav.addObject("keyword", keyword );
		return mav;
		
	}
	
	//자유게시판 부모댓글달기
	
	  @ResponseBody
	  @RequestMapping("freereplyinsert") public void freereplyinsert(FreeReplyDTO dto, HttpSession session) {
	  
	  UserDTO user = (UserDTO) session.getAttribute(SessionAttr.LOGINUSER); 
	  String userid = user.getUid();
	  dto.setReplyer(userid);
	  freeboardService.frereplyinsert(dto); 
	  }
	  //자유게시판 자식댓글(대댓글)달기
	  @ResponseBody
	  @RequestMapping("freereplyadd") 
	  public void freereplyadd(FreeReplyDTO dto, HttpSession session) {
	  
	  UserDTO user = (UserDTO) session.getAttribute(SessionAttr.LOGINUSER); 
	  String userid = user.getUid();
	  dto.setReplyer(userid);
	  freeboardService.freereplyadd(dto); 
	  }
	  
	  
	  
	 
	
	
	  @RequestMapping(value = "freereplylist", method = RequestMethod.POST)
	  
	  public ModelAndView freereplylist(int fbno,@RequestParam(defaultValue ="1") int curPage, ModelAndView mav,HttpSession session) {
		  
		  
	  int count =freeboardService.freereplycount(fbno);
	  OrderListPage pager = new OrderListPage(count,curPage); 
	  int start=pager.getPageBegin(); 
	  int end = pager.getPageEnd(); 
	  List<FreeReplyDTO> list = freeboardService.freereplylist(fbno, start, end, session);
	  mav.setViewName("freeboard/freeboardreply_list"); 
	  mav.addObject("list", list);
	  mav.addObject("pager", pager); return mav; }
	 
	  //자유게시판 글쓰기로 이동 
	 @RequestMapping("freboardwrite")
	 public String write() {
			
		 return "freeboard/freeboardwrite";
	 } 
	 //자유게시글삽입
	 @RequestMapping("freboardinsert")
		public String freboardinsert(@ModelAttribute FreeboardDTO dto, HttpSession session) throws Exception{
			//로그인한 사용자의 아이디 
		 	UserDTO user = (UserDTO) session.getAttribute(SessionAttr.LOGINUSER); 
			String writer = user.getUid(); 
			dto.setWriter(writer);
			//레코드가 저장됨
			freeboardService.freboardinsert(dto);
			//목록갱신
			return "redirect:/freboard/freboardlist";
		}
	 
	 @RequestMapping("freboardupdate")
		public String freboardupdate(FreeboardDTO dto) throws Exception{
			freeboardService.freeboardupdate(dto);
			return "redirect:/freboard/freboardlist";
		}
	 
	 
	 @RequestMapping("freboardupdateview")
		public ModelAndView freboardupdateview(@RequestParam int fbno) throws Exception{
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName("freeboard/freeboardupdateview");
			mav.addObject("dto", freeboardService.read(fbno));
			
			return mav;
		}
	 
		//댓글이 달려있는경우 등 추가적인 설정필요 예를들면 삭제못하게하던가
		@RequestMapping("freboarddelete") 
		public String freboarddelete(@RequestParam int fbno) throws Exception{
			freeboardService.freeboarddelete(fbno);
			return "redirect:/freboard/freboardlist";
		}
		
		
		
		@ResponseBody
		@RequestMapping(value = "freereplydel", method = RequestMethod.POST)
		public String freereplydel(@RequestParam String fbno , String frno ) throws Exception {
			
			
			freeboardService.freereplydel(fbno, frno);
			
			return "true";
			
			
		}
	
	 

}














