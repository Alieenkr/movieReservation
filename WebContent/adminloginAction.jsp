<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
 
<%@ page import="member.db.memberDAO" %>
<jsp:useBean id="member" class="member.db.memberBean"/>
<jsp:setProperty name="member" property="mem_id" />
<jsp:setProperty name="member" property="mem_pwd" />

<%
	String id=request.getParameter("mem_id");
	String pwd=request.getParameter("mem_pwd");
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
	
	if(mem_id != null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인이 되어있습니다.')");
		script.println("location.href = 'home.jsp'");
		script.println("</script>");
	}
	
	memberDAO memdao = memberDAO.getInstance();
	int result = memdao.login(id, pwd);
	
	if(result ==1) {
		session.setAttribute("mem_id", member.getMem_id()); // 세선 설정
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('관리자 로그인 되었습니다.')");
		script.println("location.href = 'topAdmin2.jsp'");
		script.println("</script>");
	}
	else if (result == 0 ) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀립니다.')");
		script.println("history.back()");
		script.println("location.href = 'adminlogin.jsp'");
		script.println("</script>");
	}
	else if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디입니다. 회원가입 창으로 넘어갑니다.')");
		script.println("location.href = 'join.jsp'");
		script.println("</script>");
	}
	else if (result == -2) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터베이스 오류가 발생했습니다. 다시 시도해주세요.')");
		script.println("history.back()");
		script.println("location.href = 'adminlogin.jsp'");
		script.println("</script>");
	}
%>
</body>
</html>