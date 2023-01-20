package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.vo.*;

public class FoodDAO {
	private Connection conn;
	private PreparedStatement ps;
	
	// 카테고리 데이터
	public ArrayList<FoodCategoryVO> mainpageFoodListData()
	{
		ArrayList<FoodCategoryVO> list=new ArrayList<FoodCategoryVO>();
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT /*+ INDEX_ASC(gg_foodCategory_4 fc_fcno_pk_4)*/ "
					  +"fcno,title,subtitle,image "
					  +"FROM gg_foodCategory_4";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				FoodCategoryVO vo=new FoodCategoryVO();
				vo.setFcno(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setSubtitle(rs.getString(3));
				vo.setImage(rs.getString(4));
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
	// 검색 검색 검색 검색 검색 검색 (서울 맛집 ㅋ)
	public ArrayList<FoodVO> foodLocationFindData(int page, String ss)
	{
		ArrayList<FoodVO> list=new ArrayList<FoodVO>();
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT fno,name,poster,num "
					+"FROM (SELECT fno,name,poster,rownum as num "
					+"FROM (SELECT fno,name,poster "
					+"FROM gg_locationFood_4 "
					+"WHERE address LIKE '%'||?||'%')) "
					+"WHERE num BETWEEN ? AND ?";
			
			ps=conn.prepareStatement(sql);
			int rowSize=20;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			
			ps.setString(1, ss);
			ps.setInt(2, start);
			ps.setInt(3, end);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				FoodVO vo=new FoodVO();
				vo.setFno(rs.getInt(1));
				vo.setName(rs.getString(2));
				String poster=rs.getString(3);
				poster=poster.substring(0,poster.indexOf("^"));
				poster=poster.replace("#", "&");
				vo.setPoster(poster);
				
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
	
	public int foodLocationTotalPage(String ss)
	{
		int total=0;
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT CEIL(COUNT(*)/20.0) FROM gg_locationFood_4 "
					+"WHERE address Like '%'||?||'$'";
			ps=conn.prepareStatement(sql);
			ps.setString(1, ss);
			
			ResultSet rs=ps.executeQuery();
			
			rs.next();
			total=rs.getInt(1);
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			CreateConnection.disConnection(conn, ps);
		}
		return total;
	}
	// 목록
	public List<FoodVO> foodListData(int cno)
	{
		
		List<FoodVO> list=new ArrayList<FoodVO>();
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT fno,fcno,name,addr,tel,type,poster,score "
					  +"FROM gg_foodDetail_4 "
					  +"WHERE fcno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, cno);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				FoodVO vo=new FoodVO();
				vo.setFno(rs.getInt(1));
				vo.setFcno(rs.getInt(2));
				vo.setName(rs.getString(3));
				String addr=rs.getString(4);
				addr=addr.substring(0,addr.lastIndexOf("지"));
				vo.setAddr(addr.trim());
				vo.setTel(rs.getString(5));
				vo.setType(rs.getString(6));
				String poster=rs.getString(7);
				poster=poster.substring(0,poster.indexOf("^"));
				vo.setPoster(poster);
				vo.setScore(rs.getDouble(8));
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
	// 카테고리 제목 부제목
	public FoodCategoryVO categoryInfoData(int cno)
	{
		FoodCategoryVO vo=new FoodCategoryVO();
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT title,subtitle FROM gg_foodCategory_4 "
					  +"WHERE fcno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, cno);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setTitle(rs.getString(1));
			vo.setSubtitle(rs.getString(2));
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			CreateConnection.disConnection(conn, ps);
		}
		return vo;
				
	}
}
