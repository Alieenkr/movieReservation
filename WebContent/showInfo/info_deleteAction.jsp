<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import="showInfo.db.showInfoDAO" %>

<%@ page import="java.io.PrintWriter" %>
 
<jsp:useBean id="info" class="showInfo.db.showInfoBean"/>
<jsp:setProperty name="info" property="show_num" />

<%
	String sNum =request.getParameter("show_num");	
	//session.setAttribute("mem_id", id);
	//session.setAttribute("mem_pwd", pwd);
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
	

	showInfoDAO indao = showInfoDAO.getInstance();
	boolean result = indao.deleteInfo(sNum);
	
	if(result == true) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('삭제하였습니다.')");
		script.println("location.href = '../admin/admin_showing.jsp'");
		script.println("</script>");
	}
	else  {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('오류가 발생하였습니다. 다시 시도해주세요.')");
		script.println("history.back()");
		script.println("location.href = '../admin/admin_showing.jsp'");
		script.println("</script>");
	}
%>
</body>
</html>