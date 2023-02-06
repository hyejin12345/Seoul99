package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.vo.*;
public class ReserveDAO {
	private Connection conn;
	private PreparedStatement ps;
  
	public List<FoodVO> reserveFoodListData(String fd)
	{
		List<FoodVO> list=new ArrayList<FoodVO>();
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT fno,poster,name,addr,tel,rownum "
			    +"FROM gg_locationfood_4 "
			    +"WHERE rownum<=50 AND type LIKE '%'||?||'%'";
			ps=conn.prepareStatement(sql);
			ps.setString(1, fd);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				FoodVO vo=new FoodVO();
				vo.setFno(rs.getInt(1));
				String poster=rs.getString(2);
				poster=poster.substring(0,poster.indexOf("^"));
				poster=poster.replace("#", "&");
				vo.setPoster(poster);
				vo.setName(rs.getString(3));
				String address=rs.getString(4);
				address=address.substring(0,address.lastIndexOf("지")).trim();
				vo.setAddr(address);
				vo.setTel(rs.getString(5));
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
	// 예약일
	public  String reserveDayData(int fno)
	{
		String rdate="";
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT reserve_day FROM gg_locationFood_4 "
					+"WHERE fno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, fno);
			ResultSet rs=ps.executeQuery();
			rs.next();
			rdate=rs.getString(1);
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			CreateConnection.disConnection(conn, ps);
		}
		return rdate;
	}
	
	// 예약시간
	public String reserveTimeData(int fdno)
	{
  		String times="";
  		try
  		{
  			conn=CreateConnection.getConnection();
  			String sql = "SELECT time FROM gg_foodDate_4 "
  					+ "WHERE fdno=?";
  			ps=conn.prepareStatement(sql);
  			ps.setInt(1, fdno);
  			ResultSet rs = ps.executeQuery();
  			rs.next();
  			times=rs.getString(1);
  			rs.close();
  		}catch(Exception ex)
  		{
  			ex.printStackTrace();
  		}
  		finally
  		{
  			CreateConnection.disConnection(conn, ps);
  		}
  		return times;
  		
  	}
	
	public String reserveTimeRealData(int ftno)
  	{
  		String times="";
  		try
  		{
  			conn=CreateConnection.getConnection();
  			String sql = "SELECT time FROM gg_foodTime_4 "
  					+ "WHERE ftno=?";
  			ps=conn.prepareStatement(sql);
  			ps.setInt(1, ftno);
  			ResultSet rs = ps.executeQuery();
  			rs.next();
  			times=rs.getString(1);
  			rs.close();
  		}catch(Exception ex)
  		{
  			ex.printStackTrace();
  		}
  		finally
  		{
  			CreateConnection.disConnection(conn, ps);
  		}
  		return times;
  		
  	}
	
}