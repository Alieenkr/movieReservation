<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@page import="msystem.DBConnection" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>

<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title> 영화관리 </title>
	</head>
	
	<body>
		<div class="top">
			<jsp:include page="topAdmin.jsp"></jsp:include>
		</div>
		
		<div class="page-header">
 			<h1> 영화 관리 <small> 영화를 등록, 수정, 삭제합니다.  </small></h1>
		</div>
		
		<br>
		<br>
		<br>
	
	         <button type="button" class="btn btn-warning" onclick="location.href='../movie/movie_insert_form.jsp'" > 영화 등록 </button>
	         <br>
	         <br>
	         
	<form action="post">
          <table class="table table-striped">
            <thead>
              <tr>
                <th> 아이디 </th>
                <th> 제목 </th>
                <th> 감독 </th>
                <th> 배우 </th>
                <th> 등급 </th>
              </tr>
            </thead>
        <% 
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	
		try {
			con=DBConnection.getCon();
			String sql = "select * from movie;";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				String id = rs.getString("m_id");
				String title = rs.getString("m_title");
				String direc = rs.getString("m_direc");
				String actor = rs.getString("m_actor");
				String grade = rs.getString("m_grade");
		
			%>				
            <tbody>
              <tr>
                <td><%=id%></td>
                <td><%=title%></td>
                <td><%=direc%></td>
                <td><%=actor%></td>
                <td><%=grade%></td>
                </tr>
            </tbody>
            <% } 
            } 
		catch (SQLException se) {
            System.out.println(se.getMessage());
        } finally {
            try {
            	if(rs!=null) rs.close();
            	if(pstmt!=null) pstmt.close();
            	if(con!=null) con.close();
            } 
            catch(SQLException se) {
           		System.out.println(se.getMessage());
            }
        }%>
          </table>
          <button type="button" class="btn btn-info" onclick="location.href='../movie/movie_update_form.jsp'" > 수정하기 </button>
          <button type="button" class="btn btn-danger" onclick="location.href='../movie/movie_delete_form.jsp'" > 삭제하기 </button>
          </form>
</body>
</html>