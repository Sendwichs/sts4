package info.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import oracle.db.DbConnect;

public class InfoDao {

	DbConnect db = new DbConnect();

	// insert
	public void insertInfo(InfoDto dto) {

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		String sql = "insert into info values(seq1.nextval,?,?,sysdate)";

		try {
			pstmt = conn.prepareStatement(sql);

			// 물음표(?) 바인딩 시키기
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());

			// update
			pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}

	// select
	public Vector<InfoDto> getInfoAllDatas() {
		Vector<InfoDto> list = new Vector<>();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql="select * from info order by num asc";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			// 여러 개의 데이터는 while
			while(rs.next()) {
				// while 문안에서 dto선언
				
				InfoDto dto = new InfoDto();
				
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				dto.setSdate(rs.getTimestamp("sdate"));
				
				// 벡터에 추가
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		

		return list;
	}
	public InfoDto getData(String num) {
		
		InfoDto dto= new InfoDto();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		String sql="select * from info where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();
			
//			수정하려는 하나의 데이터가 필요하므로 if
			if (rs.next()) {
				
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				dto.setSdate(rs.getTimestamp("sdate"));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return dto;
	}
	// update
	public void updateInfo(InfoDto dto) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql="update info set name=?, addr=? where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			pstmt.setString(3, dto.getNum());
			
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	// delete
	public void deleteInfo(InfoDto dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql="delete info to name=?,addr=?,where num=?";
		
	}

}