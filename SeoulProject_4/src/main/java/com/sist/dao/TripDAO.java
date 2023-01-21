//여행지, 축제 DAO

package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.vo.*;
public class TripDAO {
	private Connection conn;
	private PreparedStatement ps;
	
	//메인 여행지리스트
	public ArrayList<TripVO> tripListData()
	{
		ArrayList<TripVO> list=new ArrayList<TripVO>();
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT /*+ INDEX_ASC(gg_trip_4 t_tno_pk_4)*/ "
					   +"tcno,tno,name,image,hit, rownum FROM gg_trip_4 " 
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
	
	//메인 축제리스트
	public ArrayList<FestivalVO> festivalListData()
	{
		ArrayList<FestivalVO> list=new ArrayList<FestivalVO>();
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT name, image, rownum FROM gg_festival_4 "
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
	
}
