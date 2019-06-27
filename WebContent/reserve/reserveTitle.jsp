<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
  
<%@page import="msystem.DBConnection" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@ page import="java.io.PrintWriter" %>   
<%@ page import="java.util.*" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> 영화 예매 - 영화 선택</title>
</head>
<body>

<%
		String mem_id = null;
		if(session.getAttribute("mem_id") != null) {
		mem_id = (String) session.getAttribute("mem_id");
		}
%>
		
<form name="title" method="post" action="reserveCine.jsp">
	<input name="mem_id" type="hidden" value="<%=session.getAttribute("mem_id")%>">
	<select name="m_title" size="5" style="width:250px">
 		<option value="" selected style="font-size:30px">영화 선택</option>
     <%
      // db에서 정보 얻어와 테이블에 출력하기
	  Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      try {
       con = DBConnection.getCon();
	   String sql ="select distinct m_title from showinfo GROUP BY m_title ORDER BY m_title";
       pstmt = con.prepareStatement(sql);
       rs = pstmt.executeQuery();
       while (rs.next()) {
        String m_title = rs.getString("m_title");
     %>
     <option value=<%=m_title%>><%=m_title%></option>
     <%
    	
      }
      } catch (SQLException se) {
       System.out.println(se.getMessage());
      } finally {
       try {
        if (rs != null)
         rs.close();
        if (pstmt != null)
         pstmt.close();
        if (con != null)
         con.close();
       } catch (SQLException se) {
        System.out.println(se.getMessage());
       }

      }
      
     %>
 	</select>
 	<input style="center" type="submit" class="btn btn-success" id="sendContact" value="다음"/>
</form>

</body>
</html>