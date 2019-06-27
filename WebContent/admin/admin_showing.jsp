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
		<title> 상영영화관리 </title>
	</head>
	
	<body>
		<div class="top">
			<jsp:include page="topAdmin.jsp"></jsp:include>
		</div>
		
		<div class="page-header">
 			<h1>&nbsp;상영영화관리 <small>&nbsp;상영영화정보를 등록, 삭제합니다. </small></h1>
		</div>
		
		<br>
		<br>
		<br>
	
	         <button type="button" class="btn btn-warning" onclick="location.href='../showInfo/info_insert_form.jsp'" > 상영정보 등록 </button>
	         <br>
	         <br>
	         
	
          <table class="table table-striped">
            <thead>
              <tr>
                <th>상영정보번호</th>
                <th>상영관번호</th>
                <th>영화이름</th>
                <th>상영시간</th>
                <th>상영시작일</th>
                <th>상영종료일</th>
                <th>상영영화관</th>
                <th>상영시각</th>
              </tr>
            </thead>
        <% 
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	
		try {
			con=DBConnection.getCon();
			String sql = "select * from showInfo";
			
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				int show_num = rs.getInt("show_num");
				String screenNO = rs.getString("screenNO");
				String m_title = rs.getString("m_title");
				int runtime = rs.getInt("runtime");
				String showSDate = rs.getString("showSDate");
				String showEDate = rs.getString("showEDate");
				String c_name = rs.getString("c_name");
				String showTime = rs.getString("showTime");
			
			%>				
            <tbody>
              <tr>
                <td><%=show_num%></td>
                <td><%=screenNO%></td>
                <td><%=m_title%></td>
                <td><%=runtime%></td>
                <td><%=showSDate%></td>
                <td><%=showEDate%></td>
                <td><%=c_name%></td>
                <td><%=showTime%></td>
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
          <button type="button" class="btn btn-info" onclick="location.href='../showInfo/info_delete_form.jsp'"> 삭제하기 </button>	
</body>
</html>