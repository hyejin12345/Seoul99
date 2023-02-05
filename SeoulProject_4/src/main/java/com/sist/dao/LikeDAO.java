package com.sist.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.sist.vo.AllLikeVO;

public class LikeDAO {
	private Connection conn;
	private PreparedStatement ps;
	
	public void LikeInsert(AllLikeVO vo)
	{
		try
		{
			conn=CreateConnection.getConnection();
			String sql="INSERT INTO gg_allLike_4 VALUES("
					+"(SELECT NVL(MAX(alno)+1,1) FROM gg_allLike_4),?,?)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, vo.getNo());
			ps.setString(2, vo.getId());
			ps.executeUpdate();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			CreateConnection.disConnection(conn, ps);
		}
			
	}
	
	public int LikeCount()
	{
		int count=0;
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT COUNT(*) FROM gg_allLike_4";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			count=rs.getInt(1);
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			CreateConnection.disConnection(conn, ps);
		}
		return count;
	}
	// 좋아요 취소!
	public int myLikeCount(int no, String id)
	{
		int count=0;
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT COUNT(*) FROM gg_allLike_4 "
					+"WHERE no=? AND id=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ps.setString(2, id);
			ResultSet rs=ps.executeQuery();
			rs.next();
			count=rs.getInt(1);
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			CreateConnection.disConnection(conn, ps);
		}
		return count;
		
	}
	// 맛집 좋아요 비활
	public int foodLikeCount(int fno)
	{
	      int count=0;
	      try
	      {
	         conn=CreateConnection.getConnection();
	         String sql="SELECT COUNT(*) FROM gg_allLike_4 "
	               +"WHERE no=?";
	         ps = conn.prepareStatement(sql);
	         ps.setInt(1, fno);
	         ResultSet rs=ps.executeQuery();
	         rs.next();
	         count=rs.getInt(1);
	         rs.close();
	      }catch (Exception ex) {
	         ex.printStackTrace();
	      } 
	      finally
	      {
	         CreateConnection.disConnection(conn, ps);
	      }
	      return count;
	   }
	
}
