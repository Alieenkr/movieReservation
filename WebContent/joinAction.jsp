<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
 
<% request.setCharacterEncoding("UTF-8"); %>

<%@ page import="member.db.memberDAO" %>
<jsp:useBean id="member" class="member.db.memberBean" scope="page"/>
<jsp:setProperty name="member" property="mem_id" />
<jsp:setProperty name="member" property="mem_pwd" />
<jsp:setProperty name="member" property="mem_name" /> 
<jsp:setProperty name="member" property="mem_birth" /> 
<jsp:setProperty name="member" property="mem_addr" />  
<jsp:setProperty name="member" property="mem_phone" />

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
	
	if(mem_id != null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인이 되어있습니다.')");
		script.println("location.href = 'home.jsp'");
		script.println("</script>");
	}
	// 세션이 존재하는 회원들은 mem_id에 해당 세션 값을 저장
	
	memberDAO memdao = memberDAO.getInstance();
	int result = memdao.join(member);
	if(result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 존재하는 아이디입니다')");
		script.println("history.back()");
		script.println("location.href='join.jsp'");
		script.println("</script>");
	}
	else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('회원가입이 완료되었습니다. 환영합니다.')");
		script.println("location.href='home.jsp'");
		//script.println("history.back()");
		script.println("</script>");
	}
%>

</body>
</html>