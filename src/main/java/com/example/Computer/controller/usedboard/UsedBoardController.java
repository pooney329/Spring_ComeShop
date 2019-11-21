package com.example.Computer.controller.usedboard;

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
import com.example.Computer.Service.usedboard.UsedboardService;
import com.example.Computer.model.freeboard.dto.FreeReplyDTO;
import com.example.Computer.model.freeboard.dto.FreeboardDTO;
import com.example.Computer.model.member.dto.UserDTO;
import com.example.Computer.model.order.dto.OrderListPage;
import com.example.Computer.model.usedboard.dto.UsedListPage;
import com.example.Computer.model.usedboard.dto.UsedReplyDTO;
import com.example.Computer.model.usedboard.dto.UsedboardDTO;


@RequestMapping("/usedboard/*")
@Controller
public class UsedBoardController {
		@Inject
		UsedboardService usedboardService;
		
		
	
		//자유게시판목록보여주기	
		@RequestMapping("usedboardlist")
		public ModelAndView usedboardlist(@RequestParam(defaultValue="1") int curPage,
				@RequestParam(defaultValue="all") String search_option,
				@RequestParam(defaultValue="") String keyword) throws Exception{
			
			
			int count=usedboardService.count(search_option, keyword); //레코드 개수
			
			
			UsedListPage pager =new UsedListPage(count,curPage);
			int start = pager.getPageBegin();
			int end =pager.getPageEnd();
			
			List<UsedboardDTO> list = usedboardService.usedboardlist(start,end,search_option,keyword); //목록
			 
			
			ModelAndView mav =new ModelAndView();
			mav.setViewName("usedboard/usedboardlist"); //이동할 페이지 지정
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
		public ModelAndView view(@RequestParam int ubno, @RequestParam int curPage , @RequestParam String search_option, @RequestParam String keyword ,HttpSession session)throws Exception{
			usedboardService.increaseViewcnt(ubno);  //조회수 증가 
			ModelAndView mav = new ModelAndView();
			mav.setViewName("usedboard/usedboardview");
			mav.addObject("dto", usedboardService.read(ubno));
			mav.addObject("curPage", curPage);
			mav.addObject("search_option", search_option);
			mav.addObject("keyword", keyword );
			return mav;
			
		}
		
		//자유게시판 글쓰기로 이동 
		 @RequestMapping("usedboardwrite")
		 public String write() {
				
			 return "usedboard/usedboardwrite";
		 } 
		//자유게시글삽입
		 @RequestMapping("usedboardinsert")
			public String usedboardinsert(@ModelAttribute UsedboardDTO dto, HttpSession session) throws Exception{
				//로그인한 사용자의 아이디 
			 	UserDTO user = (UserDTO) session.getAttribute(SessionAttr.LOGINUSER); 
				String writer = user.getUid(); 
				dto.setWriter(writer);
				//레코드가 저장됨
				usedboardService.usedboardinsert(dto);
				//목록갱신
				return "redirect:/usedboard/usedboardlist";
			}
		 
		 @RequestMapping("usedboardupdate")
			public String usedboardupdate(UsedboardDTO dto) throws Exception{
			 	System.out.println(dto);
				usedboardService.usedboardupdate(dto);
				return "redirect:/usedboard/usedboardlist";
			}
		 
		 
		 @RequestMapping("usedboardupdateview")
			public ModelAndView usedboardupdateview(@RequestParam int ubno) throws Exception{
				
				ModelAndView mav = new ModelAndView();
				mav.setViewName("usedboard/usedboardupdateview");
				mav.addObject("dto", usedboardService.read(ubno));
				
				return mav;
			}
		 
		// 댓글이 달려있는경우 등 추가적인 설정필요 예를들면 삭제못하게하던가
		@RequestMapping("usedboarddelete")
		public String usedboarddelete(@RequestParam int ubno) throws Exception {
			usedboardService.usedboarddelete(ubno);
			return "redirect:/usedboard/usedboardlist";
		}
		//중고게시판 부모댓글달기
		
		@ResponseBody
		@RequestMapping("usedreplyinsert")
		public void freereplyinsert(UsedReplyDTO dto, HttpSession session) {
	
			UserDTO user = (UserDTO) session.getAttribute(SessionAttr.LOGINUSER);
			String userid = user.getUid();
			dto.setReplyer(userid);
			usedboardService.usedreplyinsert(dto);
		}
		
		//댓글보여주기
		@RequestMapping(value = "usedreplylist", method = RequestMethod.POST)
	
		public ModelAndView usedreplylist(int ubno, @RequestParam(defaultValue = "1") int curPage, ModelAndView mav,
				HttpSession session) {
	
			int count = usedboardService.usedreplycount(ubno);
			OrderListPage pager = new OrderListPage(count, curPage);
			int start = pager.getPageBegin();
			int end = pager.getPageEnd();
			List<UsedReplyDTO> list = usedboardService.usedreplylist(ubno, start, end, session);
			mav.setViewName("usedboard/usedboardreply_list");
			mav.addObject("list", list);
			mav.addObject("pager", pager);
			return mav;
		}
		
		//자유게시판 자식댓글(대댓글)달기
		  @ResponseBody
		  @RequestMapping("usedreplyadd") 
		  public void usedreplyadd(UsedReplyDTO dto, HttpSession session) {
		  
		  UserDTO user = (UserDTO) session.getAttribute(SessionAttr.LOGINUSER); 
		  String userid = user.getUid();
		  dto.setReplyer(userid);
		  usedboardService.usedreplyadd(dto); 
		  }
		  
		//댓글삭제  
		@ResponseBody
		@RequestMapping(value = "usedreplydel", method = RequestMethod.POST)
		public String usedreplydel(@RequestParam String ubno, String urno) throws Exception {
	
			usedboardService.usedreplydel(ubno, urno);
	
			return "true";
	
		}
		
		
	
}
