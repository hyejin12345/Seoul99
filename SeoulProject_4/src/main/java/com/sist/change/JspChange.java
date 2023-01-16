package com.sist.change;

public class JspChange {
	private static String[] jsp={
		"../main/home.jsp", //0번
		"../trip/trip_main.jsp"
	};
	public static String change(int no)
	{
		return jsp[no];
	}
}
