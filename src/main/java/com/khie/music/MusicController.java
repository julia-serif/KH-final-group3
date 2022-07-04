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


import com.khie.model.MemberDTO;
import com.khie.model.MusicDAO;
import com.khie.model.MusicDTO;
import com.khie.model.MyMusicDAO;
import com.khie.model.MyMusicDTO;
import com.khie.model.NoticeDAO;
import com.khie.model.NoticeDTO;
import com.khie.model.MusicReplyDAO;
import com.khie.model.MusicReplyDTO;
import com.khie.model.PageDTO;
import com.khie.model.PlaylistDTO;
import com.khie.model.QA_PageDTO;
import com.khie.model.QandADAO;
import com.khie.model.QandADTO;
import com.khie.model.MemberDAO;

@Controller
public class MusicController {
	
	@Autowired
	private MusicDAO dao;
	@Autowired
	private MemberDAO dao2;
	@Autowired
	private MyMusicDAO mm_dao;
	@Autowired
	private MusicReplyDAO dao3;
	@Autowired
	private NoticeDAO dao4;

	@Autowired 
	private QandADAO Qand_dao;

	@Autowired
	private Upload upload;
	
	private final int rowsize = 10;	//한 페이지당 보여질 음원의 수
	private int totalMusic = 0;	//DB 상의 전체 음원의 수
	
	private final int QA_rowsize = 5;     // 한 페이지당 보여질 질문 게시물의 수
	private int QA_totalRecord = 0;       // DB 상의 전체 질문 게시물의 수

	
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
		model.addAttribute("field", field);
		
		if(field.equals("All")) {
			//모든 검색분류에 대하여 검색어에 해당하는 쿼리를 DB에서 실행하는 작업.
			PageDTO[] pdto = new PageDTO[5];
			String[] fields = {"Song", "Album", "Artist", "Video", "Lyrics"};
			int[] rowsizes = {rowsize, 5, 5, 3, 5};
			ArrayList<List<MusicDTO>> list = new ArrayList<List<MusicDTO>>();	//해당 검색분류에서 한 페이지에 보여질 튜플의 수를 저장하는 List
			int[] results = new int[5];

			for(int i=0; i<5; i++) {
				totalMusic = this.dao.searchMusicCount(fields[i], keyword);
				pdto[i] = new PageDTO(1, rowsizes[i], totalMusic, fields[i], keyword);
				
				System.out.println(fields[i]+"으로 검색 건 수: " + pdto[i].getTotalMusic());
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
		
		List<MusicDTO> topList = this.dao.selectTop();
		model.addAttribute("topList", topList);
		
		return "search" + field;
	}
	
	@RequestMapping("top10.do")
	public String top10(Model model) {
		//top10페이지 이동
		
		List<MusicDTO> list = this.dao.selectTop();
	
		model.addAttribute("list", list);
		
		return "top10";
	}
	
	@RequestMapping("newMusic.do")
	public String newMusic(HttpServletRequest request,Model model) {
		//새 음원 페이지로 이동
		int page;
		if(request.getParameter("page") != null  ) {
			page = Integer.parseInt(request.getParameter("page").trim());
		}else {
			page = 1;
		}
		
		int totalcont = dao.selectTotalCont();
		int rowpage = 10;
		
		PageDTO pageDTO = new PageDTO(page, rowpage, totalcont);
		
		List<MusicDTO> list = this.dao.selectNewMusic(pageDTO);
		
		model.addAttribute("list" , list);
		model.addAttribute("pageDTO", pageDTO);
		
		return "music_new";
	}
	
	@RequestMapping("events.do")
	public String events() {
		return "events";
	}
	
	@RequestMapping("event2.do")
	public String event2() {
		return "event2";
	}
	
	@RequestMapping("event3.do")
	public String event3() {
		return "event3";
	}
	
	@RequestMapping("login.do")
	public String login(HttpServletRequest request) {
		HttpSession session = request.getSession();
		return "login";
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
	

	@RequestMapping("music_cont.do")
	public String music_cont(@RequestParam("m_no") int m_no, MusicDTO dto, Model model) {
		
		dto = this.dao.musicCont(m_no);
		
		model.addAttribute("cont", dto);
		
		return "music_cont";

	}
	
	@RequestMapping("video.do")
	public String video_cont(@RequestParam("no") int no, Model model) {
		
		MusicDTO dto = this.dao.musicCont(no);
		model.addAttribute("music", dto);
		
		return "video_content";
	}
	
	@RequestMapping("reply_write.do")
	private String insertReply(HttpServletResponse response, MusicReplyDTO dto) {
		
		this.dao3.insertBoard(dto);
		
		return null;
		
	}
	
	
	
	@RequestMapping("mymusic.do")
	public String mymusic(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		if(member == null) {
			session.setAttribute("page_check", "mymusic.do");
			return "login";
		} else {
			int user_no = member.getUser_no();
			List<PlaylistDTO> playlist = this.mm_dao.getPlaylist(user_no);
			int count = playlist.size();

			model.addAttribute("Member", member);
			model.addAttribute("Count", count);
			model.addAttribute("List", playlist);
			return "mymusic";
		}
	}
	
	@RequestMapping("select_like.do")
	public String select_like(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		int user_no = member.getUser_no();

		int page;
		if(request.getParameter("page") != null  ) {
			page = Integer.parseInt(request.getParameter("page").trim());
		}else {
			page = 1;
		}
		int totalcont = dao.selectTotalCont();
		int rowpage = 10;
		
		PageDTO pageDTO = new PageDTO(page, rowpage, totalcont, user_no);
		List<MusicDTO> likelist = this.mm_dao.selectLike(pageDTO);

		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("List", likelist);
		return "music_likelist";
	}
	
	@RequestMapping("select_recent.do")
	public String recent_watch(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		int user_no = member.getUser_no();
		int page;
		
		if(request.getParameter("page") != null  ) {
			page = Integer.parseInt(request.getParameter("page").trim());
		}else {
			page = 1;
		}
		int totalcont = dao.selectTotalCont();
		int rowpage = 10;
		
		PageDTO pageDTO = new PageDTO(page, rowpage, totalcont, user_no);
		List<MusicDTO> recentlist = this.mm_dao.selectRecent(pageDTO);

		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("List", recentlist);
		return "music_recentlist";
	}
	
	@RequestMapping("select_much.do")
	public String much_watch(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		int user_no = member.getUser_no();
		int page;
		
		if(request.getParameter("page") != null  ) {
			page = Integer.parseInt(request.getParameter("page").trim());
		}else {
			page = 1;
		}
		int totalcont = dao.selectTotalCont();
		int rowpage = 10;
		
		PageDTO pageDTO = new PageDTO(page, rowpage, totalcont, user_no);
		List<MusicDTO> muchlist = this.mm_dao.selectMuch(pageDTO);

		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("List", muchlist);
		return "music_muchlist";
	}
	
	@RequestMapping("add_to_playlist.do") // 미구현
	public String add_to_playlist(@RequestParam("m_no") int m_no, MusicDTO dto, HttpServletRequest request, Model model) throws IOException {
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		dto = this.dao.musicCont(m_no);
		if(member == null) {
			return "login";
		} else {
			model.addAttribute("cont", dto);
			return "add_to_playlist";
		}
	}
	
	@RequestMapping("add_to_playlist_ok.do")
	public void add_to_playlist_ok(PlaylistDTO dto, HttpServletResponse response, HttpServletRequest request) throws IOException {
		int check = this.mm_dao.musicToPlaylist(dto);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('추가 성공')");
			out.println("history.go(-2)");
			out.println("</script>");
			this.mm_dao.updatePlaylistCount(dto);
		} else {
			out.println("<script>");
			out.println("alert('추가 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
	
	@RequestMapping("playlist_insert.do")
	public void playlist_insert(PlaylistDTO dto, HttpServletResponse response) throws IOException {
		int check = this.mm_dao.addPlaylist(dto);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('추가 성공')");
			out.println("location.href='mymusic.do'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('추가 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
	
	@RequestMapping("playlist_modify.do")
	public void playlist_modify(PlaylistDTO dto, @RequestParam("playlist_no") int playlist_no, HttpServletResponse response, HttpServletRequest request) throws IOException {
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		int user_no = member.getUser_no();
		
		dto.setUser_no(user_no);
		dto.setPlaylist_no(playlist_no);
		
		int check = this.mm_dao.modifyPlaylist(dto);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		if(check > 0) {
				out.println("<script>");
				out.println("alert('수정 성공')");
				out.println("location.href='select_musiclist.do?playlist_no=" + dto.getPlaylist_no() + "'");
				out.println("</script>");
			} else {
				out.println("<script>");
				out.println("alert('수정 실패')");
				out.println("history.back()");
				out.println("</script>");
			}
	}
	
	@RequestMapping("playlist_delete.do")
	public void playlist_delete(PlaylistDTO dto, HttpServletResponse response, HttpServletRequest request) throws IOException {
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		int user_no = member.getUser_no();
		dto.setUser_no(user_no);
		
		int check = this.mm_dao.deletePlaylist(dto);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		if(check > 0) {
				this.mm_dao.updatePlaylistSequence(dto);
				
				out.println("<script>");
				out.println("alert('삭제 성공')");
				out.println("location.href='mymusic.do'");
				out.println("</script>");
			} else {
				out.println("<script>");
				out.println("alert('삭제 실패')");
				out.println("history.back()");
				out.println("</script>");
			}
	}
	
	@RequestMapping("image_register.do") // 미구현
	public void image_register(PlaylistDTO dto, HttpServletResponse response) throws IOException {
		int check = this.mm_dao.imageRegister(dto);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		if(check > 0) {
				out.println("<script>");
				out.println("alert('수정 성공')");
				out.println("location.href='mymusic.do'");
				out.println("</script>");
			} else {
				out.println("<script>");
				out.println("alert('수정 실패')");
				out.println("history.back()");
				out.println("</script>");
			}
	}
	
	@RequestMapping("select_musiclist.do")
	public String select_musiclist(@RequestParam("playlist_no") int playlist_no, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		int user_no = member.getUser_no();
		
		PlaylistDTO playlist = new PlaylistDTO();
		playlist.setPlaylist_no(playlist_no);
		playlist.setUser_no(user_no);
		
		List<MusicDTO> musiclist = this.mm_dao.getMusiclist(playlist);
		String name = this.mm_dao.getPlaylistName(playlist);
		
		model.addAttribute("Member", member);
		model.addAttribute("Name", name);
		model.addAttribute("Playlist", playlist_no);
		model.addAttribute("List", musiclist);
		return "music_playlist";
	}
	
	@RequestMapping("empty.do")
	public String empty() {
		return "empty1";
	}
	
/*
*  ====================여기부터 관리자 영역입니다. =================
*/
	
	// 로그인 작업입니다.

	@RequestMapping("login_Ok.do")
	public String login(MemberDTO dto, HttpServletRequest req, HttpServletResponse response, Model model) throws Exception{

		HttpSession session = req.getSession();
		MemberDTO login = this.dao2.login(dto);
		
	// 	회원 정보가 틀리면 로그인 화면으로 다시 돌아갑니다.
		if(login == null) {
			model.addAttribute("fail_check", 1);
			session.setAttribute("member", null);
			return "login";
   // 로그인 성공시  회원 로그인 화면으로 넘어갑니다.
		} else {
			session.setAttribute("member", login); 
			
			String page = (String)session.getAttribute("page_check");
			session.setAttribute("page_check", null);
			
			PrintWriter out = response.getWriter();
			if(page != null && dto.getUser_rank() != "1") {
				return "redirect:/"+page;
			} else {
				return "redirect:/";
			}
		}
	}

// 로그아웃 
	@RequestMapping("logout.do")
	public String logout(HttpSession session) throws Exception{
		
		session.invalidate();
		
		return "redirect:/";

	}
	
//마이 페이지	
	@RequestMapping("mypage.do")
	public String login(@RequestParam("user_no")int user_no, Model model ) {
		MemberDTO dto = this.dao2.getMember(user_no);
		model.addAttribute("Cont", dto);		
		return "mypage";
	}

	/* =========================이용권 결제 파트입니다.========================================= */
	
	@RequestMapping("mypass.do")
	public String mypass(@RequestParam("user_no") int user_no, Model model) {
		MemberDTO dto = this.dao2.getMember(user_no);
		model.addAttribute("member2", dto);
		
		return "mypass";
	}
	

	@RequestMapping("mypay.do")
	public String mypay() {
		return "mypay";
	}
	
	@RequestMapping("mypass1.do")
	public String mypass1() {
		
		return "pass_change";
	}
	
	
	@RequestMapping("mypay2.do")
	public String mypay2() {
		return "mypay2";
	}
	
	@RequestMapping("mypass2.do")
	public String mypass2() {
		
		return "pass_change2";
	}
	
	
	@RequestMapping("mypay3.do")
	public String mypay3() {
		return "mypay3";
	}
	
	@RequestMapping("mypass3.do")
	public String mypass3() {
		
		return "pass_change3";
	}
	
	@RequestMapping("mypay4.do")
	public String mypay4() {
		return "mypay4";
	}
	
	@RequestMapping("mypass4.do")
	public String mypass4() {
		
		return "pass_change4";
	}
	
	
	@RequestMapping("mypay5.do")
	public String mypay5() {
		return "mypay5";
	}
	
	@RequestMapping("mypass5.do")
	public String mypass5() {
		
		return "pass_change5";
	}
	
	@RequestMapping("mypass_cancel.do")
	public String mypass_cancel() {
		return "mypass_cancel";
	}
	
	@RequestMapping("mypass_cancel_Ok.do")
	public void mypass_cancel_ok(MemberDTO dto,
			                     @RequestParam("db_pwd") String db_pwd,
			                     @RequestParam("user_no") int user_no, 
			                     HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(dto.getUser_pwd().equals(db_pwd)) {
			int check = this.dao2.cancelMypass(user_no);
			if(check > 0) {
				out.println("<script>");
				out.println("alert('취소 성공!!!')");
				out.println("location.href='mypage.do?user_no="+dto.getUser_no()+"'");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('취소 실패~~~')");
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
	
	@RequestMapping("pass_change_Ok.do")
	public void mypass_change_ok(MemberDTO dto, 
			@RequestParam("db_pwd") String db_pwd,
			@RequestParam("user_no") int user_no,
			HttpServletResponse response) throws IOException{
	
	response.setContentType("text/html; charset=UTF-8");
	
	PrintWriter out = response.getWriter();
	
	if(dto.getUser_pwd().equals(db_pwd)) {
		int check = this.dao2.updateMypass(user_no);
		if(check > 0) {
			out.println("<script>");
			out.println("alert('결제 성공!!!')");
			out.println("location.href='mypage.do?user_no="+dto.getUser_no()+"'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('결제 실패~~~')");
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
	
	@RequestMapping("pass_change_Ok2.do")
	public void mypass_change_ok2(MemberDTO dto, 
			@RequestParam("db_pwd") String db_pwd,
			@RequestParam("user_no") int user_no,
			HttpServletResponse response) throws IOException{
	
	response.setContentType("text/html; charset=UTF-8");
	
	PrintWriter out = response.getWriter();
	
	if(dto.getUser_pwd().equals(db_pwd)) {
		int check = this.dao2.updateMypass2(user_no);
		if(check > 0) {
			out.println("<script>");
			out.println("alert('결제 성공!!!')");
			out.println("location.href='mypage.do?user_no="+dto.getUser_no()+"'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('결제 실패~~~')");
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
	
	@RequestMapping("pass_change_Ok3.do")
	public void mypass_change_ok3(MemberDTO dto, 
			@RequestParam("db_pwd") String db_pwd,
			@RequestParam("user_no") int user_no,
			HttpServletResponse response) throws IOException{
	
	response.setContentType("text/html; charset=UTF-8");
	
	PrintWriter out = response.getWriter();
	
	if(dto.getUser_pwd().equals(db_pwd)) {
		int check = this.dao2.updateMypass3(user_no);
		if(check > 0) {
			out.println("<script>");
			out.println("alert('결제 성공!!!')");
			out.println("location.href='mypage.do?user_no="+dto.getUser_no()+"'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('결제 실패~~~')");
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
	
	@RequestMapping("pass_change_Ok4.do")
	public void mypass_change_ok4(MemberDTO dto, 
			@RequestParam("db_pwd") String db_pwd,
			@RequestParam("user_no") int user_no,
			HttpServletResponse response) throws IOException{
	
	response.setContentType("text/html; charset=UTF-8");
	
	PrintWriter out = response.getWriter();
	
	if(dto.getUser_pwd().equals(db_pwd)) {
		int check = this.dao2.updateMypass4(user_no);
		if(check > 0) {
			out.println("<script>");
			out.println("alert('결제 성공!!!')");
			out.println("location.href='mypage.do?user_no="+dto.getUser_no()+"'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('결제 실패~~~')");
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
	
	@RequestMapping("pass_change_Ok5.do")
	public void mypass_change_ok5(MemberDTO dto, 
			@RequestParam("db_pwd") String db_pwd,
			@RequestParam("user_no") int user_no,
			HttpServletResponse response) throws IOException{
	
	response.setContentType("text/html; charset=UTF-8");
	
	PrintWriter out = response.getWriter();
	
	if(dto.getUser_pwd().equals(db_pwd)) {
		int check = this.dao2.updateMypass5(user_no);
		if(check > 0) {
			out.println("<script>");
			out.println("alert('결제 성공!!!')");
			out.println("location.href='mypage.do?user_no="+dto.getUser_no()+"'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('결제 실패~~~')");
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
	
	/* =========================회원 관리 파트입니다.========================================= */	
	
	// 회원 목록//
	@RequestMapping("member.do")
	public String memberlist(Model model) {
		
		List<MemberDTO> list = this.dao2.getMemberList();
		
		model.addAttribute("List", list);
		
		return "member_list";
	}
	
	// 회원 가입 //
	@RequestMapping("user_insert.do")
	public String insert() {
		
		return "member_insert";
	}
	
	// 회원 가입 완료//
	@RequestMapping("user_insert_ok.do")
	public void insertOk(MemberDTO dto,
			HttpServletResponse response) throws IOException {
		
		int check = this.dao2.insertMember(dto);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('회원 등록 성공')");
			out.println("location.href='member.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('회원 등록 실패')");
			out.println("history.back()");
			out.println("</script>");
			
		}
	}
	
	

	//관리자 회원 수정 요구//
	@RequestMapping("user_modify.do")
	public String user_modify(@RequestParam("user_no") int user_no, Model model) {
		MemberDTO dto = this.dao2.getMember(user_no);
		
		model.addAttribute("member_update", dto);
		
		return "member_modify";
	}
	
	//관리자 회원 수정 완료//
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
				out.println("alert('정보 수정 성공!!!')");
				out.println("location.href='mypage.do?user_no="+dto.getUser_no()+"'");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('정보 수정 실패~~~')");
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
	
	
	//관리자 회원 수정 완료//
	@RequestMapping("user_change_ok.do")
	public void userChange(MemberDTO dto,
			@RequestParam("db_pwd")String db_pwd,
			HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(dto.getUser_pwd().equals(db_pwd)) {
			
			int check = this.dao2.updateBoard(dto);
			
			if(check > 0) {
				out.println("<script>");
				out.println("alert('정보 수정 성공!!!')");
				out.println("location.href='member.do'");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('정보 수정 실패~~~')");
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
	
	//관리자 회원 상세내역//
	
	@RequestMapping("user_content.do")
	public String content(@RequestParam("user_no")int user_no, Model model ) {
		MemberDTO dto = this.dao2.getMember(user_no);
		model.addAttribute("Cont", dto);
		
		return "user_content";
	}
	
	@RequestMapping("user_delete.do")
	public void user_delete(@RequestParam("user_no") int user_no,
	HttpServletResponse response)throws IOException{
		

   int check = this.dao2.deleteMember(user_no);

   response.setContentType("text/html; charset=UTF-8");
   
   PrintWriter out = response.getWriter();

   if(check > 0) {
	   this.dao2.updateSequence(user_no);
	  
	    out.println("<script>");
		out.println("alert('회원 삭제 성공!!!')");
		out.println("location.href='member.do'");
		out.println("</script>");
	}else {
		out.println("<script>");
		out.println("alert('회원 삭제 실패')");
		out.println("history.back()");
		out.println("</script>");
	}
}
	

	@RequestMapping("event1.do")
	public String event1() {
		return "event1";
	}
	
	/* =========================공지사항 관리 파트입니다.========================================= */	
	
	//관리자 공지사항 게시판 전체 목록//
	
	@RequestMapping("notice_list.do")
	public String list(Model model) {
		
		   List<NoticeDTO> list = this.dao4.getNoticeList();
	     	
		   model.addAttribute("List", list);
		   
	     	return "notice_list";
	}
	
	//관리자 공지사항 게시판 삽입//
	
	@RequestMapping("notice_write.do")
	public String write() {
		
		return "notice_write";
	}
	
	//관리자 공지사항 게시판 삽입 확인//
	
	@RequestMapping("notice_write_ok.do")
	public void writeOk(NoticeDTO dto,
			HttpServletResponse response) throws IOException {
		
		int check = this.dao4.insertNotice(dto);
		
        response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('공지사항 등록 성공')");
			out.println("location.href='notice_list.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('공지사항 등록 실패')");
			out.println("history.back()");
			out.println("</script>");
			
		}
	}
	
	//관리자 공지사항 게시판 상세내역//
	
	@RequestMapping("notice_content.do")
	public String notice_content(@RequestParam("music_no") int music_no, Model model ) {
		this.dao4.readCount(music_no);
		NoticeDTO dto = this.dao4.getNotice(music_no);
		
		
		model.addAttribute("content1", dto);
		
		return "notice_content";
	}

	//관리자 공지사항 게시판 수정//
	
	@RequestMapping("notice_modify.do")
	public String modify(@RequestParam("music_no")int music_no, Model model) {
		
	  NoticeDTO dto = 	this.dao4.getNotice(music_no);
	  
	  model.addAttribute("notice_modify", dto);
	  
	  return "notice_update";
	  
	}
	
	//관리자 공지사항 게시판 수정 완료//
	
	@RequestMapping("notice_modify_Ok.do")
	public void notice_modifyOk(NoticeDTO dto,
			             @RequestParam("db_pwd")String db_pwd,
			             HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(dto.getMusic_pwd().equals(db_pwd)) {
			
			int check = this.dao4.updateNotice(dto);
			
			if(check > 0) {
				out.println("<script>");
				out.println("alert('게시판 수정 성공!!!')");
				out.println("location.href='notice_list.do'");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('게시판 수정 실패~~~')");
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
	
	//관리자 공지사항 게시판 삭제 요청//
	
	@RequestMapping("notice_delete.do")
	public String notice_delete(@RequestParam("music_no") int music_no,
			Model model) {
		
		NoticeDTO dto = this.dao4.getNotice(music_no);
		
		model.addAttribute("delete", dto);
		
		return "notice_delete";
	}
	
	//관리자 공지사항 게시판 삭제 확인//
	
	@RequestMapping("notice_delete_Ok.do")
	 public void notice_deleteOk(NoticeDTO dto,
			 @RequestParam("db_pwd") String db_pwd,
			 HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
	   
	   if(dto.getMusic_pwd().equals(db_pwd)) {
		   
		   int check = this.dao4.deleteNotice(dto.getMusic_no());
	
		   if(check > 0) {
			   this.dao4.updateSequence(dto.getMusic_no());
		   
			   out.println("<script>");
			   out.println("alert('게시물 삭제 성공!!!')");
			   out.println("location.href='notice_list.do'");
			   out.println("</script>");
		   
		   }else {
			    out.println("<script>");
				out.println("alert('게시물 삭제 실패~~~')");
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

	/* =========================Q/A 관리 파트입니다.========================================= */		
	
	
	//관리자 Q/A 게시판 조회
	@RequestMapping("qanda_list.do")
	public String list(HttpServletRequest request, Model model) {
		
		int qa_page;   // 현재 페이지
	
	   if(request.getParameter("qa_page") != null) {
		   qa_page = Integer.parseInt(request.getParameter("qa_page"));
	   } else {
		   qa_page = 1;
	   }
	   
	   
	   
		   QA_totalRecord = this.Qand_dao.getQandAListCount();
		   int QA_rowsize = 5;
		   
		   QA_PageDTO qa_dto = new QA_PageDTO(qa_page, QA_rowsize, QA_totalRecord);
	       
		   List<QandADTO> qa_list = this.Qand_dao.getQandAList(qa_dto);
		   
		   model.addAttribute("QA_List", qa_list);
		   model.addAttribute("QA_Paging", qa_dto);
		   
	   return "QA_board_list";
	   
	   
	}
	
	//관리자 Q/A 게시판 삽입
	@RequestMapping("qa_insert.do")
     public String qa_insert() {
		
		return "qa_board_insert";
	}
	
	@RequestMapping("qa_notice_write_ok.do")
	public void writeOk(QandADTO dto,
			HttpServletResponse response) throws IOException {
		
		int check = this.Qand_dao.insertQandA(dto);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('게시글 추가 성공!!!')");
			out.println("location.href='qanda_list.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('게시글 추가 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}
	
	//관리자 Q/A 게시판 상세내역
	@RequestMapping("qanda_content.do")
	public String qa_content(@RequestParam("qa_no") int qa_no, Model model) {
		this.Qand_dao.readCount(qa_no);
		
		QandADTO dto = this.Qand_dao.boardCont(qa_no);
		
		model.addAttribute("content2", dto);

		return "qa_board_content";
	}
	
	//관리자 Q/A 게시판 답변
	@RequestMapping("qanda_reply.do")
	public String qa_reply(@RequestParam("qa_no") int qa_no, Model model) {
		
		QandADTO dto = this.Qand_dao.boardCont(qa_no);
		
		model.addAttribute("content2", dto);
		
		return "qa_board_reply";
	}
	
	//관리자 Q/A 게시판 수정 폼 페이지
	@RequestMapping("qa_modify.do")
	public String qa_modify(@RequestParam("qa_no") int qa_no, Model model) {
		
		QandADTO dto = this.Qand_dao.boardCont(qa_no);
		
        model.addAttribute("content2", dto);
		
		return "qa_modify";
	}
	
	//관리자 Q/A 게시판 수정완료
	@RequestMapping("qa_update_ok.do")
	public void qa_modifyOk(QandADTO dto,
            @RequestParam("db_pwd")String db_pwd,
            HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(dto.getQa_pwd().equals(db_pwd)) {
		
		int check = this.Qand_dao.updateBoard(dto);
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('게시판 수정 성공!!!')");
			out.println("location.href='qanda_list.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('게시판 수정 실패~~~')");
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
	
	    //관리자 Q/A 게시판 삭제 요청 페이지 
	     @RequestMapping("qa_delete.do")    
	 	public String qa_delete(@RequestParam("qa_no") int qa_no,
	 			Model model) {
	 		
	    	 QandADTO dto = this.Qand_dao.boardCont(qa_no);
	 		
	 		model.addAttribute("qa_delete", dto);
	 		
	 		return "qa_delete";
	 	}
	
	   //관리자 Q/A 게시판 삭제 완료 페이지 
	    @RequestMapping("qa_delete_Ok.do")
		 public void qa_deleteOk(QandADTO dto,
				 @RequestParam("db_pwd") String db_pwd,
				 HttpServletResponse response) throws IOException {
			
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
		   
		   if(dto.getQa_pwd().equals(db_pwd)) {
			   
			   int check = this.Qand_dao.deleteBoard(dto.getQa_no());
		
			   if(check > 0) {
				   this.Qand_dao.updateSequence(dto.getQa_no());
			   
				   out.println("<script>");
				   out.println("alert('게시물 삭제 성공!!!')");
				   out.println("location.href='qanda_list.do'");
				   out.println("</script>");
			   
			   }else {
				    out.println("<script>");
					out.println("alert('게시물 삭제 실패~~~')");
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
	
	  //관리자 Q/A 게시판 찾기 기능
		@RequestMapping("QA_board_search.do")
		public String qa_search(
		@RequestParam("qa_field") String qa_field,
		@RequestParam("qa_keyword") String qa_keyword,
		@RequestParam("qa_page") int qa_nowPage, Model model) {
		
		QA_totalRecord = this.Qand_dao.searchBoardCount(qa_field, qa_keyword);
		
		QA_PageDTO qdto = new QA_PageDTO(qa_nowPage, QA_rowsize, QA_totalRecord, qa_field, qa_keyword);
		
        System.out.println("검색 게시물 수 >>> " + qdto.getQa_totalRecord());
		
		System.out.println("검색 전체 페이지 수 >>> " + qdto.getQa_allPage());
		
	     List<QandADTO> list = this.Qand_dao.searchBoardList(qdto);
	     
	     model.addAttribute("qa_searchPageList", list);
	     
	     
	     model.addAttribute("qa_Paging", qdto);
	     
	     return "qa_searchList";
	     
	}
	
		
/* =========================음원 관리 파트입니다.========================================= */	
		
	//관리자 음원 조회
	@RequestMapping("admin_Music.do")
	public String adminSelectMusic(HttpServletRequest request,Model model) {
		//새 음원 페이지로 이동
		int page;
		if(request.getParameter("page") != null  ) {
			page = Integer.parseInt(request.getParameter("page").trim());
		}else {
			page = 1;
		}
		
		int totalcont = dao.selectTotalCont();
		int rowpage = 10;
		
		PageDTO pageDTO = new PageDTO(page, rowpage, totalcont);
		
		List<MusicDTO> list = this.dao.selectNewMusic(pageDTO);
		
		model.addAttribute("list" , list);
		model.addAttribute("pageDTO", pageDTO);
		
		return "admin_music";
	}		 
	
	//관리자 음원 추가 페이지로 이동
	@RequestMapping("admin_insert_music.do")
	public String adminInertMusic() {
		return"admin_insert_music";
	}
	
	//관리자 음원 추가 완료
	@RequestMapping("admin_insert_music_ok.do")
	public void adminInsertMusicOk(MusicDTO musicDTO ,HttpServletRequest requst, HttpServletResponse response) throws IOException {
		
		//재생시간 
		int minute = Integer.parseInt(requst.getParameter("minute").trim());
		int second = Integer.parseInt(requst.getParameter("second").trim());
		
		musicDTO.setM_ptime((minute*60) + second);
		
		//파일 업로드
		boolean uploadAudio = upload.UploadAudio(musicDTO.getM_audio());
		
		if(uploadAudio) {
			System.out.println("오디오 파일 업로드 성공");
		}
		
		int check = this.dao.insertMusic(musicDTO);
		
		 response.setContentType("text/html; charset=UTF-8");
			
		 PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('음원 추가 성공')");
			out.println("location.href='admin_Music.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('음원 추가 실패')");
			out.println("history.back()");
			out.println("</script>");
			
		}
	}
	
	//관리자 음원 삭제
	@RequestMapping("admin_music_delete.do")
	public void adminDeleteMusic(HttpServletResponse response, @RequestParam("no") int m_no) throws IOException {
		
		int check = this.dao.deleteMusic(m_no);

		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		if (check > 0) {
			out.println("<script>");
			out.println("alert('음원 삭제 성공')");
			out.println("location.href='admin_Music.do'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('음원 삭제 실패')");
			out.println("history.back()");
			out.println("</script>");

		}
	}
	
	//관리자 아티스트 페이지
	@RequestMapping("admin_artist.do")
	public String adminArtist(Model model, HttpServletRequest request) {
		
		//새 음원 페이지로 이동
		int page;
		if(request.getParameter("page") != null  ) {
			page = Integer.parseInt(request.getParameter("page").trim());
		}else {
			page = 1;
		}
				
		int totalcont = dao.selectTotalCont();
		int rowpage = 10;
				
		PageDTO pageDTO = new PageDTO(page, rowpage, totalcont);
				
		List<MusicDTO> list = this.dao.selectNewMusic(pageDTO);
				
		model.addAttribute("list" , list);
		model.addAttribute("pageDTO", pageDTO);
		
		return "admin_artist";
	}
	
	//관리자 아티스트 추가 페이지 이동
	@RequestMapping("admin_insert_artist.do")
	public String adminInsertArtist() {
		return"admin_insert_artist";
	}
	
	//관리자 아티스트 추가
	@RequestMapping("admin_insert_artist_ok.do")
	private void adminInsertArtistOk() {
	

	}
	
	//관리자 아티스트 삭제
	@RequestMapping("admin_delete_artist.do")
	public void adminDeleteArtist() {
		
	}
		
	
}
	

