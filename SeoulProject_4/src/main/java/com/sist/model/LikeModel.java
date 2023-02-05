package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.LikeDAO;
import com.sist.vo.AllLikeVO;

@Controller
public class LikeModel {
	@RequestMapping("like/like_insert.do")
	public String like_insert(HttpServletRequest request, HttpServletResponse response)
	{
		String fno=request.getParameter("fno");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		AllLikeVO vo=new AllLikeVO();
		vo.setNo(Integer.parseInt(fno));
		vo.setId(id);
		LikeDAO dao=new LikeDAO();
		dao.LikeInsert(vo);
		return "redirect:../food/food_detail.do?fno="+fno;
	}
}
