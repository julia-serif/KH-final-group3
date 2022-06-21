package com.khie.music;

import java.io.IOException;
import java.io.PrintWriter;

import java.util.ArrayList;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.khie.model.MemberDTO;
import com.khie.model.MusicDAO;
import com.khie.model.MusicDTO;
import com.khie.model.PageDTO;
import com.khie.model.MemberDAO;

@Controller
public class MusicController {
	
	@Autowired
	private MusicDAO dao;
	@Autowired
	private MemberDAO dao2;
	
	private final int rowsize = 10;	//한 페이지당 보여질 음원의 수
	private int totalMusic = 0;	//DB 상의 전체 음원의 수


	@RequestMapping("index.do")
	public String index() {
		return "index";
	}
	
	@RequestMapping("about.do")
	public String about() {
		return "about";
	}
	
	@RequestMapping("search.do")
	public String search(@RequestParam("field") String field,
			@RequestParam("keyword") String keyword,
			Model model) {
		
		model.addAttribute("keyword", keyword);
		
		if(field.equals("All")) {
			//모든 검색분류에 대하여 검색어에 해당하는 쿼리를 DB에서 실행하는 작업.
			PageDTO[] pdto = new PageDTO[5];
			String[] fields = {"Song", "Album", "Artist", "Video", "Lyrics"};
			ArrayList<List<MusicDTO>> list = new ArrayList<List<MusicDTO>>();	//해당 검색분류에서 한 페이지에 보여질 튜플의 수를 저장하는 List
			int[] results = new int[5];

			for(int i=0; i<1; i++) {	//이후 5까지 돌아가도록 고칠것
				totalMusic = this.dao.searchMusicCount(fields[i], keyword);
				pdto[i] = new PageDTO(1, rowsize, totalMusic, fields[i], keyword);
				
				System.out.println(fields[i]+"으로 검색 음원 수: " + pdto[i].getTotalMusic());
				System.out.println(fields[i]+"으로 검색 전체 블럭 수: " + pdto[i].getTotalBlock());
				
				list.add(this.dao.searchMusicList(pdto[i]));
				results[i] = pdto[i].getTotalMusic();
			}
			
			model.addAttribute("resultNums", results);
			model.addAttribute("searchLists", list);
			model.addAttribute("Pagings", pdto);

			
		} else {
			//특정 검색분류의 검색어에 해당하는 음원의 수를 DB에서 확인하는 작업
			totalMusic = this.dao.searchMusicCount(field, keyword);
			
			PageDTO pdto = new PageDTO(1, rowsize, totalMusic, field, keyword);
			
			System.out.println("검색 음원 수: " + pdto.getTotalMusic());
			System.out.println("검색 전체 블럭 수: " + pdto.getTotalBlock());
			
			//검색 시 한페이지당 보여질 음원의 수만큼 검색한 음원을 List로 가져오는 메서드
			List<MusicDTO> list = this.dao.searchMusicList(pdto);
			
			model.addAttribute("resultNum", pdto.getTotalMusic());
			model.addAttribute("searchMusicList", list);
			model.addAttribute("Paging", pdto);
		}
		
		return "search" + field;
	}
	
	
	@RequestMapping("events.do")
	public String events() {
		return "events";
	}
	
	@RequestMapping("login.do")
	public String login() {
		return "login";
	}
	
	@RequestMapping("mypage.do")
	public String login(MemberDTO dto, HttpServletRequest req) throws Exception{
		return "mypage";
	}
	
	@RequestMapping("news.do")
	public String news() {
		return "news";
	}
	
	@RequestMapping("service.do")
	public String service() {
		return "service";
	}
	
	@RequestMapping("sitemap.do")
	public String sitemap() {
		return "sitemap";
	}
	
	@RequestMapping("mymusic.do")
	public String mymusic() {
		return "mymusic";
	}
	
	
	@RequestMapping("empty.do")
	public String empty() {
		return "empty1";
	}
	
	/*
	 *  여기부터 관리자 영역입니다. 
	 */
	
	// 로그인 작업입니다.
	@RequestMapping("login_Ok.do")
	public String login(MemberDTO dto, HttpServletRequest req, HttpServletResponse response) throws Exception{

		HttpSession session = req.getSession();
		MemberDTO login = this.dao2.login(dto);
		
	// 	회원 정보가 틀리면 로그인 화면으로 다시 돌아갑니다.
		if(login == null) {
			session.setAttribute("member", null);
			return "login_back";
   // 로그인 성공시  회원 로그인 화면으로 넘어갑니다.
		}else {
			session.setAttribute("member", login);
	
		} 
		
		return "loginmain";
	}

// 로그아웃 
	@RequestMapping("logout.do")
	public String logout(HttpSession session) throws Exception{
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping("mypass.do")
	public String mypass() {
		return "mypass";
	}
	
	@RequestMapping("mypay.do")
	public String mypay() {
		return "mypay";
	}
	
	
	@RequestMapping("mypay2.do")
	public String mypass2() {
		return "mypay2";
	}
	
	@RequestMapping("mypay3.do")
	public String mypass3() {
		return "mypay3";
	}
	
	@RequestMapping("mypay4.do")
	public String mypass4() {
		return "mypay4";
	}
	
	@RequestMapping("mypay5.do")
	public String mypass5() {
		return "mypay5";
	}
	
	@RequestMapping("user_modify_ok.do")
	public void modifyOk(MemberDTO dto,
			@RequestParam("db_pwd")String db_pwd,
			HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(dto.getUser_pwd().equals(db_pwd)) {
			
			int check = this.dao2.updateBoard(dto);
			
			if(check > 0) {
				out.println("<script>");
				out.println("alert('게시물 수정 성공!!!')");
				out.println("location.href='mypage.do'");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('게시물 수정 실패~~~')");
				out.println("history.back()");
				out.println("</script>");
			}
			}else {
				out.println("<script>");
				out.println("alert('비밀번호가 틀립니다. 확인해 주세요~~~')");
				out.println("history.back()");
				out.println("</script>");
			}
		}
	
	@RequestMapping("member.do")
	public String memberlist(Model model) {
		
		List<MemberDTO> list = this.dao2.getMemberList();
		
		model.addAttribute("List", list);
		
		return "member_list";
	}
	
	@RequestMapping("user_content.do")
	public String content(@RequestParam("user_no")int user_no, Model model ) {
		MemberDTO dto = this.dao2.getMember(user_no);
		model.addAttribute("Cont", dto);
		
		return "user_content";
	}
		
	}
	
	

