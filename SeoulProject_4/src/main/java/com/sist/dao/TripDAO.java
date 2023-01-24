//여행지, 축제 DAO

package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.vo.*;
public class TripDAO {
	private Connection conn;
	private PreparedStatement ps;
	
	//메인페이지 - 여행지리스트
	public List<TripVO> tripMainListData()
	{
		List<TripVO> list=new ArrayList<TripVO>();
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT /*+ INDEX_ASC(gg_trip_4 t_tno_pk_4)*/ "
					   +"tcno,tno,name,image,hit,rownum FROM gg_trip_4 " 
					   +"WHERE rownum<=12";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				TripVO vo=new TripVO();
				vo.setTcno(rs.getInt(1));
				vo.setTno(rs.getInt(2));
				vo.setName(rs.getString(3));
				vo.setImage(rs.getString(4));
				vo.setHit(rs.getInt(5));
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
	
	//메인페이지 - 축제리스트
	public List<FestivalVO> festivalListData()
	{
		List<FestivalVO> list=new ArrayList<FestivalVO>();
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT /*+ INDEX_ASC(gg_trip_4 t_tno_pk_4)*/ "
					    +"name, image, rownum FROM gg_festival_4 "
						+"WHERE rownum <=12";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				FestivalVO vo=new FestivalVO();
				vo.setName(rs.getString(1));
				vo.setImage(rs.getString(2));
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
	
	//전체여행지페이지 - 여행지리스트
	public List<TripVO> tripAllListData(int tcno,int page)
	{
		List<TripVO> list=new ArrayList<TripVO>();
		try
		{
			conn=CreateConnection.getConnection();
			int[] tripCategory={1,2,3,4}; //1번 명소, 2번 자연, 3번 즐길거리, 4번 쇼핑
			String sql="SELECT tcno,tno,name,image,hit,num "
					  +"FROM (SELECT /*+ INDEX_ASC(gg_trip_4 t_tno_pk_4)*/ tcno,tno,name,image,hit,rownum as num "
					  +"FROM gg_trip_4 "
					  +"WHERE tcno=?) "
					  +"WHERE num BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql);
			int rowSize=9;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			ps.setInt(1, tripCategory[tcno-1]);
			ps.setInt(2, start);
			ps.setInt(3, end);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				TripVO vo=new TripVO();
				vo.setTcno(rs.getInt(1));
				vo.setTno(rs.getInt(2));
				vo.setName(rs.getString(3));
				vo.setImage(rs.getString(4));
				vo.setHit(rs.getInt(5));
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
	
	//전체여행지페이지 - 여행지리스트 총페이지
	public int tripTotalPage(int tcno)
	{
		int totalpage=0;
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT CEIL(count(*)/9.0) FROM gg_trip_4 "
					  +"WHERE tcno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, tcno);
			ResultSet rs=ps.executeQuery();
			rs.next();
			totalpage=rs.getInt(1);
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}finally
		{
			CreateConnection.disConnection(conn, ps);
		}
		return totalpage;
	}
}









