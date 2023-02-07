package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.dao.*;
import com.sist.vo.*;

@Controller
public class MainModel {

   @RequestMapping("main/main.do")
   public String main_page(HttpServletRequest request, HttpServletResponse response) {
      // 메인 여행지리스트
      String tcno=request.getParameter("tcno");
      if(tcno==null)
         tcno="2";
      
      TripDAO tdao = new TripDAO();
      List<TripVO> tlist1 = tdao.tripLandmarkList();
      request.setAttribute("tlist1", tlist1);
      
      List<TripVO> tlist2 = tdao.tripOhterList(2);
      request.setAttribute("tlist2", tlist2);
      
      
      //찜 표시
    JjimDAO jdao=new JjimDAO();
    
    HttpSession session=request.getSession();
    String id=(String)session.getAttribute("id");
    
    for(TripVO vo:tlist1)
    {
       if(id==null)
       {	   
          vo.setJjim(0);
       }
       else
       {
       vo.setJjim(jdao.myJjimCount(1, vo.getTno(),id));
       }
    }
    //request.setAttribute("jjimcount", jjimcount);
      
      
      // 메인 맛집리스트
      FoodDAO fdao = new FoodDAO();
      List<FoodCategoryVO> flist = fdao.mainpageFoodListData(); // ArrayList에서 List로 수정
      request.setAttribute("flist", flist);

      // 메인 축제리스트
      List<FestivalVO> fslist = tdao.festivalListData();
      request.setAttribute("fslist", fslist);
      
      // main 본문에 include할 jsp파일
      request.setAttribute("main_jsp", "../main/home.jsp");// main.jsp
      
      // cookie 전송 - 여행지
      Cookie[] cookies=request.getCookies();
      List<TripVO> tcList=new ArrayList<TripVO>();
      /*HttpSession*/ session=request.getSession();
      /*String*/ id=(String)session.getAttribute("id");
      if(cookies!=null)
      {
         if(id==null)
         {
            for(int i=cookies.length-1;i>=0;i--)
            {
               if(cookies[i].getName().startsWith("guest_trip"))
               {
                  String tno=cookies[i].getValue();
                  TripVO vo=tdao.tripDetail(Integer.parseInt(tno));
                  tcList.add(vo);
               }
            }
         }
         else
         {
            for(int i=cookies.length-1;i>=0;i--)
            {
               if(cookies[i].getName().startsWith(id+"_trip"))
               {
                  String tno=cookies[i].getValue();
                  TripVO vo=tdao.tripDetail(Integer.parseInt(tno));
                  tcList.add(vo);
               }
            }
         }
      }
      request.setAttribute("tcList", tcList);
      
      
      //cookie 전송 - 맛집
      Cookie[] cookies2=request.getCookies();
      List<FoodVO> fcList=new ArrayList<FoodVO>();
      session=request.getSession();
      id=(String)session.getAttribute("id");
      if(cookies2!=null)
      {
         if(id==null)
         {
            for(int i=cookies2.length-1;i>=0;i--)
            {
               if(cookies2[i].getName().startsWith("guest_food"))
               {
                  String fno=cookies2[i].getValue();
                  FoodVO vo=fdao.foodDetail(Integer.parseInt(fno));
                  fcList.add(vo);
               }
            }
         }
         else
         {
            for(int i=cookies2.length-1;i>=0;i--)
            {
               if(cookies2[i].getName().startsWith(id+"_food"))
               {
                  String fno=cookies2[i].getValue();
                  FoodVO vo=fdao.foodDetail(Integer.parseInt(fno));
                  fcList.add(vo);
               }
            }
         }
      }
      request.setAttribute("fcList", fcList);
      
      
      return "../main/main.jsp";

   }

   @RequestMapping("main/search.do")
   public String main_search(HttpServletRequest request, HttpServletResponse response)
   {
      try
      {
         request.setCharacterEncoding("UTF-8");
      } catch (Exception ex) {ex.printStackTrace();}
      String searchWord = request.getParameter("searchWord");

      //검색목록 페이지 처리 관련(t_ 여행지, f_ 맛집)
      String tpage = request.getParameter("tpage");
      if (tpage == null)
         tpage = "1";
      int t_curpage = Integer.parseInt(tpage);

      String fpage = request.getParameter("fpage");
      if (fpage == null)
         fpage = "1";
      int f_curpage = Integer.parseInt(fpage);
      
      SearchDAO dao = new SearchDAO();
      List<TripVO> tlist = dao.searchTripAllListData(searchWord, t_curpage);
      List<FoodVO> flist = dao.searchFoodAllListData(searchWord, f_curpage);

      int t_totalpage = dao.searchTripTotalPage(searchWord);
      int f_totalpage = dao.searchFoodTotalPage(searchWord);

      int tripCount = dao.searchTripCount(searchWord);
      int foodCount = dao.searchFoodCount(searchWord);
      int boardCount = 0; // 게시판dao연결하기
      int allCount = tripCount+foodCount+boardCount; /* 여행지count+맛집count+커뮤니티count */

      final int BLOCK = 7;
      int t_startpage = ((t_curpage - 1) / BLOCK * BLOCK) + 1;
      int t_endpage = ((t_curpage - 1) / BLOCK * BLOCK) + BLOCK;
      if (t_endpage > t_totalpage)
         t_endpage = t_totalpage;
      
      int f_startpage = ((f_curpage - 1) / BLOCK * BLOCK) + 1;
      int f_endpage = ((f_curpage - 1) / BLOCK * BLOCK) + BLOCK;
      if (f_endpage > f_totalpage)
         f_endpage = f_totalpage;
      
      request.setAttribute("searchWord", searchWord);
      request.setAttribute("tlist", tlist);
      request.setAttribute("t_curpage", t_curpage);
      request.setAttribute("t_startpage", t_startpage);
      request.setAttribute("t_endpage", t_endpage);
      request.setAttribute("t_totalpage", t_totalpage);
      
      request.setAttribute("tripCount", tripCount);
      request.setAttribute("foodCount", foodCount);
      request.setAttribute("allCount", allCount);
      
      request.setAttribute("flist", flist);
      request.setAttribute("f_curpage",f_curpage);
      request.setAttribute("f_startpage", f_startpage);
      request.setAttribute("f_endpage", f_endpage);
      request.setAttribute("f_totalpage", f_totalpage);

      request.setAttribute("main_jsp", "../main/search.jsp");
      return "../main/main.jsp";
   }

}