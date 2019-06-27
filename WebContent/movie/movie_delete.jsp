<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%@ page import="java.io.PrintWriter" %>

<%@ page import="movie.db.movieDAO" %>
<jsp:useBean id="mov" class="movie.db.movieBean"/>
<jsp:setProperty name="mov" property="m_id" />

<%
	String m_id =request.getParameter("m_id");	
%> 

<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	</head>
	
<body>

<%
	String mem_id = null;
	if(session.getAttribute("mem_id") != null) {
		mem_id = (String) session.getAttribute("mem_id");
	}
	// 세션이 존재하는 회원들은 mem_id에 해당 세션 값을 저장
	

	movieDAO modao = movieDAO.getInstance();
	boolean result = modao.deleteMovie(m_id);
	
	if(result == true) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('삭제하였습니다.')");
		script.println("location.href = '../admin/admin_movie.jsp'");
		script.println("</script>");
	}
	else  {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('오류가 발생하였습니다. 다시 시도해주세요.')");
		script.println("history.back()");
		script.println("location.href = '../admin/admin_movie.jsp'");
		script.println("</script>");
	}
%>
</body>
</html>