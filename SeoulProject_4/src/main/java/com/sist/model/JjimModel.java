package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.JjimDAO;
import com.sist.vo.AllJjimVO;

@Controller
public class JjimModel {
	@RequestMapping("jjim/jjim_insert.do")
	public String jjim_insert(HttpServletRequest request, HttpServletResponse response)
	{
		String fno=request.getParameter("fno");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		AllJjimVO vo=new AllJjimVO();
		vo.setNo(Integer.parseInt(fno));
		vo.setId(id);
		
		// db연동
		JjimDAO dao=new JjimDAO();
		dao.JjimInsert(vo);
		
		return "redirect:../food/food_detail.do?fno="+fno;
	}
}
