<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
 
<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>

<%@ page import="cinema.db.cinemaDAO" %>
<jsp:useBean id="cine" class="cinema.db.cinemaBean"/>


<%@ page import="screen.db.screenDAO" %>
<jsp:useBean id="screen" class="screen.db.screenBean"/>

<jsp:setProperty name="cine" property="c_name" />
<jsp:setProperty name="screen" property="c_name" />

<%
	String c_name =request.getParameter("c_name");	
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
	

	cinemaDAO cidao = cinemaDAO.getInstance();
	boolean result = cidao.deleteCine(c_name);
	
	if(result == true) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('영화관을 삭제하였습니다.')");
		script.println("location.href = '../admin/admin_cinema.jsp'");
		script.println("</script>");
		
		/*cinemaDAO cidao2 = cinemaDAO.getInstance();
		boolean result2 = cidao2.deleteScreen(c_name);
		
		if(result2 == true) {
			script.println("<script>");
			script.println("alert('상영관을 삭제하였습니다.')");
			script.println("location.href = '../admin/admin_cinema.jsp'");
			script.println("</script>");
		}
		else  {
			script.println("<script>");
			script.println("alert('상영관 삭제 오류가 발생하였습니다. 다시 시도해주세요.')");
			script.println("history.back()");
			script.println("location.href = '../admin/admin_cinema.jsp'");
			script.println("</script>");
		}*/
	}
	else  {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('영화관 삭제 오류가 발생하였습니다. 다시 시도해주세요.')");
		script.println("history.back()");
		script.println("location.href = '../admin/admin_cinema.jsp'");
		script.println("</script>");
	}
%>
</body>
</html>