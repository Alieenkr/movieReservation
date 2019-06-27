<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="screen.db.screenDAO" %>

<%@ page import="java.io.PrintWriter" %>
 
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="sc" class="screen.db.screenBean" scope="page"/>
<jsp:setProperty name="sc" property="scNO" />
<jsp:setProperty name="sc" property="screenNO" />
<jsp:setProperty name="sc" property="c_name" /> 
<jsp:setProperty name="sc" property="seatNum" /> 
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
	
	screenDAO scdao = screenDAO.getInstance();
	int result = scdao.insertScreen(sc);
	if(result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('추가 실패. 다시 시도하세요.')");
		script.println("history.back()");
		script.println("location.href='screen_insert_form.jsp'");
		script.println("</script>");
	}
	else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('상영관이 추가되었습니다.')");
		script.println("location.href='../admin/admin_screen.jsp'");
		//script.println("history.back()");
		script.println("</script>");
	}
%>

</body>
</html>