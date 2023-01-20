package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.sist.vo.*;

public class FoodDAO {
	private Connection conn;
	private PreparedStatement ps;
	
	//메인페이지 맛집리스트 : 실제 작업 시 이름 수정 (컬럼, 테이블 등)
	public ArrayList<FoodCategoryVO> mainpageFoodListData()
	{
		ArrayList<FoodCategoryVO> list=new ArrayList<FoodCategoryVO>(); 
		try
		{
			
			conn=CreateConnection.getConnection();
			String sql="SELECT /*+ INDEX_ASC(project_category pc_cno_pk)*/ "
					   +"cno,title,subject,poster "
					   +"FROM project_category ";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				FoodCategoryVO vo=new FoodCategoryVO();
				vo.setFcno(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setSubtitle(rs.getString(3));
				vo.setPoster(rs.getString(4));
				list.add(vo);
			}
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			CreateConnection.disConnection(conn, ps);
		}
		return list;
	}
}
