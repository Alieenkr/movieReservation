<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>

<% request.setCharacterEncoding("UTF-8"); %>
 
<%@ page import="movie.db.movieDAO" %>
<jsp:useBean id="mov" class="movie.db.movieBean" scope="page"/>
<jsp:setProperty name="mov" property="m_id" />
<jsp:setProperty name="mov" property="m_title" /> 
<jsp:setProperty name="mov" property="m_direc" /> 
<jsp:setProperty name="mov" property="m_actor" />  
<jsp:setProperty name="mov" property="m_grade" />
<jsp:setProperty name="mov" property="m_plot" />  
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
	
	movieDAO modao = movieDAO.getInstance();
	int result = modao.insertMovie(mov);
	if(result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('추가 실패. 다시 시도하세요.')");
		script.println("history.back()");
		script.println("location.href='movie_insert_form.jsp'");
		script.println("</script>");
	}
	else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('영화가 추가되었습니다.')");
		script.println("location.href='../admin/admin_movie.jsp'");
		//script.println("history.back()");
		script.println("</script>");
	}
%>

</body>
</html>