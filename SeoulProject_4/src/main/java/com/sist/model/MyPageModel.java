package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.JjimDAO;
import com.sist.dao.LikeDAO;
import com.sist.dao.MemberDAO;

import java.io.PrintWriter;
//import com.sist.dao.JjimDAO;
import java.util.*;
import com.sist.vo.*;
@Controller
public class MyPageModel {
   @RequestMapping("mypage/mypage_main.do")
   public String mypage_main(HttpServletRequest request,HttpServletResponse response)
   {
	   request.setAttribute("mypage_jsp", "../mypage/mypage_home.jsp");
	   request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
	  
	   return "../main/main.jsp";
   }
   @RequestMapping("mypage/jjim_list.do")
   public String mypage_jjim(HttpServletRequest request,HttpServletResponse response)
   {
	   HttpSession session=request.getSession();
	   String id=(String)session.getAttribute("id");
	   JjimDAO dao=new JjimDAO();
	   List<AllJjimVO> tlist=dao.tripJjimListData(id);
	   List<AllJjimVO> flist=dao.foodJjimListData(id);
	   request.setAttribute("tlist", tlist);
	   request.setAttribute("flist", flist);
	   request.setAttribute("mypage_jsp", "../jjim/jjim_list.jsp");
	   request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
	   
	   return "../main/main.jsp";
   }
   @RequestMapping("mypage/jjim_delete.do")
   public String mypage_jjim_delete(HttpServletRequest request,HttpServletResponse response)
   {
	   String ajno=request.getParameter("ajno");
	   JjimDAO dao=new JjimDAO();
	   dao.JjimDelete(Integer.parseInt(ajno));
	   return "redirect:jjim_list.do";
   }
   
   @RequestMapping("mypage/member_update.do")
   public String member_update(HttpServletRequest request,HttpServletResponse response) {
	   String id=request.getParameter("id");
	   
	   MemberDAO dao=new MemberDAO();
	   MemberVO vo=dao.member_info(id);
	   boolean result=false;
	   if(id.equals(vo.getId())) {
		   result=true;
	   }else {
		   
	   }
	   System.out.println(result);
	   
	   request.setAttribute("id", id);
	   request.setAttribute("vo", vo);
	   request.setAttribute("mypage_jsp", "../mypage/member_update.jsp");
	   request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
	   return "../main/main.jsp";
   }
   @RequestMapping("mypage/join_update.do")
   public String member_join_update(HttpServletRequest request,HttpServletResponse response)
   {
 	  HttpSession session=request.getSession();
 	  String id=(String)session.getAttribute("id");
 	   MemberDAO dao=new MemberDAO();
	   MemberVO vo=dao.member_info(id);
 	  
 	  request.setAttribute("vo", vo);
 	  request.setAttribute("mypage_jsp", "../mypage/member_update.jsp");
 	  request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
 	  return "../main/main.jsp";
   }
   @RequestMapping("mypage/join_update_ok.do")
   public void member_join_update_ok(HttpServletRequest request,HttpServletResponse response)
   {
 	   // ajax 
	   try
		  {
			  request.setCharacterEncoding("UTF-8");
		  }catch(Exception ex) {}
		  String id=request.getParameter("id");
		  String pwd=request.getParameter("pwd");
		  String name=request.getParameter("name");
		  String sex=request.getParameter("sex");
		  String nick=request.getParameter("nick");
		  String day=request.getParameter("day");
		  String email=request.getParameter("email");
		  String phone1=request.getParameter("phone1");
		  String phone2=request.getParameter("phone2");
		  String phone3=request.getParameter("phone3");
		  String tos=request.getParameter("tos");
		  
		  System.out.println(id);
		  System.out.println(pwd);
		  System.out.println(name);
		  System.out.println(sex);
		  
		  MemberVO vo=new MemberVO();
		  vo.setId(id);
		  vo.setPwd(pwd);
		  vo.setName(name);
		  vo.setSex(sex);
		  vo.setNick(nick);
		  vo.setBirth(day);
		  vo.setEmail(email);
		  vo.setPhone(phone1+"-"+phone2+"-"+phone3);
		  vo.setTos("y");
 	  
 	  MemberDAO dao=new MemberDAO();
 	  boolean bCheck=dao.memberJoinUpdate(vo);
 	  try
 	  {
 	      PrintWriter out=response.getWriter();
 	      if(bCheck==true)
 	      {
 	    	  out.println("yes");
 	    	  HttpSession session=request.getSession();
 	    	  session.setAttribute("name", vo.getName());
 	      }
 	      else 
 	      {
 	    	  out.println("no");
 	      }
 	  }catch(Exception ex) {}
   }
   
   @RequestMapping("mypage/join_delete.do")
   public String member_delete(HttpServletRequest request,HttpServletResponse response)
   {
 	  
 	  request.setAttribute("mypage_jsp", "../mypage/join_delete.jsp");
 	  request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
 	
 	  return "../main/main.jsp";
   }
   
   @RequestMapping("mypage/join_delete_ok.do")
   public void member_delete_ok(HttpServletRequest request,HttpServletResponse response)
   {
 	  HttpSession session=request.getSession();
 	  String id=(String)session.getAttribute("id");
 	  String pwd=request.getParameter("pwd");
 	  MemberDAO dao=new MemberDAO();
 	  boolean bCheck=dao.memberJoinDelete(id, pwd);
 	  try
 	  {
 		  PrintWriter out=response.getWriter();
 		  if(bCheck==true)
 		  {
 			  out.println("yes");
 			  session.invalidate();
 		  }
 		  else
 		  {
 			  out.println("no");
 		  }
 	  }catch(Exception ex) {}
   }
   
}
