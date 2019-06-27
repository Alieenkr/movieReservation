<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@page import="msystem.DBConnection" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@ page import="java.util.*" %>  

<%
	String m_title=request.getParameter("m_title");	
	//session.setAttribute("mem_id", id);
	//session.setAttribute("mem_pwd", pwd);
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> 영화 예매 - 영화관 선택 </title>
</head>
<body>
<form name="name" method="post" action="reserveDate.jsp">
	<input name="mem_id" type="hidden" value="<%=session.getAttribute("mem_id")%>">
	<input name="m_title" type="hidden" value="<%=request.getParameter("m_title")%>">
	<select name="c_name" size="5" style="width:250px">
 		<option value="" selected style="font-size:30px">영화관 선택</option>
     <%
      // db에서 정보 얻어와 테이블에 출력하기
  	  Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String sql = "select distinct c_name from showInfo where showInfo.m_title='"+m_title+"'";
     
      try {
       con = DBConnection.getCon();
	   pstmt = con.prepareStatement(sql);
       rs = pstmt.executeQuery();
       while (rs.next()) {
        String c_name = rs.getString("c_name");
     %>
     <option value=<%=c_name %>><%=c_name %></option>
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
 	<input type="submit" class="btn btn-success" id="sendContact" value="다음"/>
</form>
</body>
</html>