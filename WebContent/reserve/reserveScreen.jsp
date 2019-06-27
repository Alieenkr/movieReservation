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
	String c_name=request.getParameter("c_name");	
	String showdate=request.getParameter("showdate");
	//session.setAttribute("mem_id", id);
	//session.setAttribute("mem_pwd", pwd);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> 영화 예매 - 상영관 선택 </title>
</head>
<body>
<form name="screen" method="post" action="reserveTime.jsp">
	<input name="mem_id" type="hidden" value="<%=session.getAttribute("mem_id")%>">
	<input name="m_title" type="hidden" value="<%=request.getParameter("m_title")%>">
	<input name="c_name" type="hidden" value="<%=request.getParameter("c_name")%>">
	<input name="showdate" type="hidden" value="<%=request.getParameter("showdate")%>">
	<select name="screenNO" size="5" style="width:250px">
 		<option value="" selected style="font-size:30px">상영관 선택</option>
     <%
      // db에서 정보 얻어와 테이블에 출력하기
	  Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      try {
       con = DBConnection.getCon();
		String sql = "select distinct screenNO from showInfo where showInfo.c_name='"+c_name+"'and showInfo.m_title='"+m_title+"'";
		//select screenNO from showInfo where showinfo.m_title='aladdin' and showinfo.c_name='cgv'
		pstmt = con.prepareStatement(sql);
       rs = pstmt.executeQuery();
       while (rs.next()) {
        String screenNO = rs.getString("screenNO");
     %>
     <option value=<%=screenNO %>><%=screenNO %></option>
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