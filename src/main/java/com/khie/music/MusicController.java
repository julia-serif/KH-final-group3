package com.khie.music;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String mypage() {
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
	
	@RequestMapping("login_Ok.do")
	public String login(MemberDTO dto, HttpServletRequest req) throws Exception{

		
		HttpSession session = req.getSession();
		MemberDTO login = this.dao2.login(dto);
		
		if(login == null) {
			session.setAttribute("member", null);
			
		}else {
			session.setAttribute("member", login);
			
		} 
		
		return "loginmain";
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session) throws Exception{
		
		session.invalidate();
		
		return "redirect:/";
	}
}
