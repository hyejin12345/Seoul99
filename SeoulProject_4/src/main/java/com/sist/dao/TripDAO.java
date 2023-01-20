//여행지, 축제 DAO

package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.vo.*;
public class TripDAO {
	private Connection conn;
	private PreparedStatement ps;
	
	//메인 여행지리스트
	public ArrayList<TripVO> tripListData(int tcno)
	{
		ArrayList<TripVO> list=new ArrayList<TripVO>();
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT tcno,name,image,hit, rownum FROM gg_trip_4 "  //실제 작업 시 테이블명 수정하기
					   +"WHERE tcno=? " //1 명소, 2 자연, 3 즐길거리, 4 쇼핑
					   +"AND rownum<=12";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, tcno);;
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				TripVO vo=new TripVO();
				vo.setTcno(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setImage(rs.getString(3));
				vo.setHit(rs.getInt(4));
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
