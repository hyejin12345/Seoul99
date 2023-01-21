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

@Controller
public class TripModel {
	@RequestMapping("trip/trip_all.do")
	public String trip_all(HttpServletRequest request,HttpServletResponse response)
	{
		
		request.setAttribute("main_jsp","../trip/trip_all.jsp");
		return "../main/main.jsp";
	}
}
