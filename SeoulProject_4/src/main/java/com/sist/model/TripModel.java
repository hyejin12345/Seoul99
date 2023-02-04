//여행지, 축제 Model

package com.sist.model;

import java.util.*;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;
import javax.servlet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class TripModel {

	// 전체여행지 페이지
	@RequestMapping("trip/trip_all.do")
	public String trip_all(HttpServletRequest request, HttpServletResponse response) {

		
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page); String tcno=request.getParameter("tcno");
		request.setAttribute("tcno",tcno);
		 
		String[] tripCategory_name={"","명소","자연","즐길거리","쇼핑"};
		request.setAttribute("tripCategory_name",
		tripCategory_name[Integer.parseInt(tcno)]);
		 
		String[] content_title={"서울 구석구석 모든 여행지","서울 인기명소부터 숨은 명소까지",
		"서울 도심 속 자연을 느낄 수 있는 곳","서울의 다양한 즐길거리","서울 쇼핑의 시작과 끝"};
		request.setAttribute("content_title", content_title[Integer.parseInt(tcno)]);
		
		TripDAO dao=new TripDAO(); List<TripVO>
		list=dao.tripAllListData(Integer.parseInt(tcno),curpage);
		int totalpage=dao.tripTotalPage(Integer.parseInt(tcno));
		 
		final int BLOCK=7; int startpage=((curpage-1)/BLOCK*BLOCK)+1;
		int endpage=((curpage-1)/BLOCK*BLOCK)+BLOCK; if(endpage>totalpage)
		endpage=totalpage;
		 
		request.setAttribute("list", list); request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startpage", startpage); request.setAttribute("endpage",endpage);
		
		request.setAttribute("main_jsp", "../trip/trip_all.jsp");
		return "../main/main.jsp";
	}

	// 여행지 쿠키
	@RequestMapping("trip/trip_before_detail.do")
	public String trip_before_detail(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		String user = "";

		if (id == null)
			user = "guest";
		else
			user = id;

		String tno = request.getParameter("tno");
		try {
			Cookie cookie = new Cookie(user + "_trip" + tno, tno); // 쿠키 이름, 쿠키값
			cookie.setPath("/");
			cookie.setMaxAge(60 * 60 * 24); // 쿠키저장시간 24시간
			response.addCookie(cookie);
		} catch (Exception ex) {
		}
		return "redirect:../trip/trip_detail.do?tno=" + tno;
	}

	// 여행지 상세페이지
	@RequestMapping("trip/trip_detail.do")
	public String trip_detail(HttpServletRequest request, HttpServletResponse response) {
		String tno = request.getParameter("tno");
		request.setAttribute("tno", tno);

		TripDAO dao = new TripDAO();
		TripVO vo = dao.tripDetail(Integer.parseInt(tno));

		// 주소에서 지역구만 자르기
		String gu = vo.getAddr();
		String[] addrSplit = gu.split(" ");
		gu = addrSplit[1];

		request.setAttribute("vo", vo);
		request.setAttribute("gu", gu);

		// 주변 맛집리스트 출력
		List<FoodVO> flist = dao.tripNearbyFood(gu);
		request.setAttribute("flist", flist);

		// 댓글 관련 : 리스트, 댓글개수
		AllReplyDAO adao = new AllReplyDAO();
		List<AllReplyVO> rList = adao.allReplyListData(Integer.parseInt(tno), 1);
		request.setAttribute("rList", rList);
		request.setAttribute("count", rList.size());

		//최근 댓글리뷰 리스트
		List<AllReplyVO> rcList=dao.tripRecentReply(1, Integer.parseInt(tno));
		request.setAttribute("rcList", rcList);
		
		request.setAttribute("main_jsp", "../trip/trip_detail.jsp");
		return "../main/main.jsp";
	}

	// ajax 연습
	@RequestMapping("trip/trip_cateChange.do")
	public String trip_listChange(HttpServletRequest request, HttpServletResponse response) {

		String page = request.getParameter("page");
		if (page == null)
			page = "1";
		int curpage = Integer.parseInt(page);

		String tcno = request.getParameter("tcno");
		if (tcno == null)
			tcno = "1";
		request.setAttribute("tcno", tcno);

		String[] tripCategory_name = { "", "명소", "자연", "즐길거리", "쇼핑" };
		request.setAttribute("tripCategory_name", tripCategory_name[Integer.parseInt(tcno)]);

		String[] content_title = { "서울 구석구석 모든 여행지", "서울 인기명소부터 숨은 명소까지", "서울 도심 속 자연을 느낄 수 있는 곳", "서울의 다양한 즐길거리",
				"서울 쇼핑의 시작과 끝" };
		request.setAttribute("content_title", content_title[Integer.parseInt(tcno)]);

		TripDAO dao = new TripDAO();
		List<TripVO> tclist = dao.tripAllListData(Integer.parseInt(tcno), curpage);
		int totalpage = dao.tripTotalPage(Integer.parseInt(tcno));

		final int BLOCK = 7;
		int startpage = ((curpage - 1) / BLOCK * BLOCK) + 1;
		int endpage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
		if (endpage > totalpage)
			endpage = totalpage;

		request.setAttribute("tclist", tclist);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);

		// request.setAttribute("tripAll_jsp", "../trip/trip_listChange.jsp");
		// request.setAttribute("main_jsp", "../trip/trip_all.jsp");
		// return "../main/main.jsp";
		return "../trip/trip_cateChange.jsp";
	}
}