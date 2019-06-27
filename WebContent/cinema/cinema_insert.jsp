<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>

<% request.setCharacterEncoding("UTF-8"); %>
 
<%@ page import="cinema.db.cinemaDAO" %>
<jsp:useBean id="cine" class="cinema.db.cinemaBean" scope="page"/>
<jsp:setProperty name="cine" property="c_name" />
<jsp:setProperty name="cine" property="c_addr" /> 
<jsp:setProperty name="cine" property="c_phone" /> 
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
	
	cinemaDAO cinedao = cinemaDAO.getInstance();
	int result = cinedao.insertCinema(cine);
	if(result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('추가 실패. 다시 시도하세요.')");
		script.println("history.back()");
		script.println("location.href='cinema_insert_form.jsp'");
		script.println("</script>");
	}
	else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('영화관이 추가되었습니다.')");
		script.println("location.href='../admin/admin_cinema.jsp'");
		script.println("</script>");
	}
%>
</body>
</html>