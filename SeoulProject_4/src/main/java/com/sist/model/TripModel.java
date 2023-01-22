//여행지, 축제 Model

package com.sist.model;
import java.util.*;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.event.TableColumnModelListener;

@Controller
public class TripModel {
	@RequestMapping("trip/trip_main.do") //여행지 메인페이지
	public String trip_main(HttpServletRequest request,HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../trip/trip_main.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("trip/trip_all.do") //전체여행지 페이지
	public String trip_all(HttpServletRequest request,HttpServletResponse response)
	{
		
		
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		String tcno=request.getParameter("tcno");
		
		String[] content_title={"","서울 구석구석 인기명소","서울 도심 속 자연을 느낄 수 있는 곳",
				"서울의 다양한 즐길거리","서울 쇼핑의 시작과 끝"};
		request.setAttribute("content_title", content_title[Integer.parseInt(tcno)]);
		
		TripDAO dao=new TripDAO();
		List<TripVO> list=dao.tripAllListData(Integer.parseInt(page),Integer.parseInt(tcno));
		request.setAttribute("list", list);
		int totalpage=dao.tripTotalPage(Integer.parseInt(tcno));
		
		final int BLOCK=7;
		int startpage=((curpage-1)/BLOCK*BLOCK)+1;
		int endpage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		
		
		request.setAttribute("main_jsp","../trip/trip_all.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("trip/trip_detail.do") //여행지 상세페이지
	public String trip_detail(HttpServletRequest request,HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../trip/trip_detail.jsp");
		return "../main/main.jsp";
	}
}
