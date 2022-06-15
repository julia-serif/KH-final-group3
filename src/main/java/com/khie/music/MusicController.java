package com.khie.music;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.khie.model.MusicDAO;
import com.khie.model.MusicDTO;
import com.khie.model.PageDTO;

@Controller
public class MusicController {
	
	@Autowired
	private MusicDAO dao;
	
	private final int rowsize = 10;	//한 페이지당 보여질 음원의 수
	private int totalMusic = 0;	//DB 상의 전체 음원의 수

	@RequestMapping("about.do")
	public String about() {
		return "about";
	}
	
	@RequestMapping("search.do")
	public String search() {
		return "search";
	}
	
	@RequestMapping("search_perform.do")
	public String searchPerform(@RequestParam("field") String field,
			@RequestParam("keyword") String keyword,
			Model model) {
		
		//검색분류와 검색어에 해당하는 음원의 수를 DB에서 확인하는 작업
		totalMusic = this.dao.searchMusicCount(field, keyword);
		
		PageDTO pdto = new PageDTO(1, rowsize, totalMusic, field, keyword);
		
		System.out.println("검색 음원 수: " + pdto.getTotalMusic());
		System.out.println("검색 전체 블럭 수: " + pdto.getTotalBlock());
		
		//검색 시 한페이지당 보여질 음원의 수만큼 검색한 음원을 List로 가져오는 메서드
		List<MusicDTO> list = this.dao.searchMusicList(pdto);
		
		model.addAttribute("searchMusicList", list);
		model.addAttribute("Paging", pdto);
		
		return "music_searchList";
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
}
