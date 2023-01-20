package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;
import com.sist.vo.*;
import com.sist.dao.*;
@Controller
public class FoodModel {
	@RequestMapping("food/food_location.do")
	public String food_location(HttpServletRequest request,HttpServletResponse response)
	{
		try
		{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		String ss=request.getParameter("ss");
		if(ss==null)
			ss="마곡";
		
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		
		// 현재페이지
		int curpage=Integer.parseInt(page);
		// dao에서 데이터 읽기
		FoodDAO dao=new FoodDAO();
		ArrayList<FoodVO> list=dao.foodLocationFindData(curpage, ss);
		int totalpage=dao.foodLocationTotalPage(ss);
		
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("ss", ss);
		request.setAttribute("main_jsp", "../food/food_location.jsp");
		return "../main/main.jsp";
				
	}
	
}
