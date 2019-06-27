<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="showInfo.db.showInfoDAO" %>

<%@ page import="java.io.PrintWriter" %>

<% request.setCharacterEncoding("UTF-8"); %>
 
<jsp:useBean id="info" class="showInfo.db.showInfoBean" scope="page"/>
<jsp:setProperty name="info" property="show_num" />
<jsp:setProperty name="info" property="screenNO" />
<jsp:setProperty name="info" property="m_title" /> 
<jsp:setProperty name="info" property="runTime" /> 
<jsp:setProperty name="info" property="showSDate" />
<jsp:setProperty name="info" property="showEDate" />
<jsp:setProperty name="info" property="c_name" /> 
<jsp:setProperty name="info" property="showTime" /> -[]
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
	
	showInfoDAO indao = showInfoDAO.getInstance();
	int result = indao.insertInfo(info);
	if(result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('추가 실패. 다시 시도하세요.')");
		script.println("history.back()");
		script.println("location.href='info_insert_form.jsp'");
		script.println("</script>");
	}
	else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('상영정보가 추가되었습니다.')");
		script.println("location.href='../admin/admin_showing.jsp'");
		//script.println("history.back()");
		script.println("</script>");
	}
%>

</body>
</html>