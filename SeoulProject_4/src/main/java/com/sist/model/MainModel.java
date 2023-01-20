package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.dao.*;
import com.sist.vo.*;
@Controller
public class MainModel {
   @RequestMapping("main/main.do")
   public String main_page(HttpServletRequest request,HttpServletResponse response)
   {
	   //메인 여행지리스트
	   String tcno=request.getParameter("tcno");
	   if(tcno==null)
		   tcno="1";

	   String[] category={"","명소","자연","즐길거리","쇼핑"};
	   request.setAttribute("tcno1", category[1]);
	   request.setAttribute("tcno2", category[2]);
	   request.setAttribute("tcno3", category[3]);
	   request.setAttribute("tcno4", category[4]);
	   
	   TripDAO tdao=new TripDAO();
	   ArrayList<TripVO> tlist=tdao.tripListData(Integer.parseInt(tcno));
	   request.setAttribute("tlist", tlist);
	   

	   //메인 맛집리스트
	   FoodDAO fdao=new FoodDAO();
	   ArrayList<FoodCategoryVO> flist=fdao.mainpageFoodListData();
	   request.setAttribute("flist", flist);
	   
	   //메인 축제리스트
	   ArrayList<FestivalVO> fslist=tdao.festivalListData();
	   request.setAttribute("fslist", fslist);
	   
	   //include할 jsp
	   request.setAttribute("main_jsp","../main/home.jsp");//main.jsp
	   return "../main/main.jsp";
	   
   }
 
}