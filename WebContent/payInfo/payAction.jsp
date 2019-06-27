<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@page import="msystem.DBConnection" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@ page import="java.io.PrintWriter" %>   
<%@ page import="java.util.*" %>  

<%@ page import="payInfo.db.payInfoDAO" %>
<jsp:useBean id="pay" class="payInfo.db.payInfoBean" scope="page"/>
<jsp:setProperty name="pay" property="paidmon" />
<jsp:setProperty name="pay" property="paidpoi" />
<jsp:setProperty name="pay" property="paidTot" />
<jsp:setProperty name="pay" property="payMeth" />
<jsp:setProperty name="pay" property="paidDate" />
<jsp:setProperty name="pay" property="mem_id" />
<jsp:setProperty name="pay" property="rCode" />

<%
	String paidmon=request.getParameter("paidmon");	
	String paidpoi=request.getParameter("paidpoi");	
	String paidTot=request.getParameter("paidTot");
	String payMeth=request.getParameter("payMeth");
	String paidDate=request.getParameter("paidDate");
	String mem_id=request.getParameter("mem_id");
	String rCode=request.getParameter("rCode"); //추가
	String lastpo=request.getParameter("lastpo"); //추가, 최종포인트
%>		

<!DOCTYPE html>

<html>
	<head>
		<title> 결제 정보 저장 </title>
	</head>
	
<body>

     <%
	payInfoDAO padao = payInfoDAO.getInstance();
	int result = padao.reCiInsert(pay);
	if(result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('실패')");
		script.println("location.href='../reserve/reserve_main.jsp'");
		//script.println("history.back()");
		script.println("</script>");
	}
	else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('예약 완료.')");
		script.println("</script>");
		
		payInfoDAO padao2 = payInfoDAO.getInstance();
		int result2 = padao2.updatepoint(mem_id, lastpo); 
		if(result2 == -1) {
			script.println("<script>");
			script.println("alert('고객 포인트 업데이트 실패')");
			script.println("</script>");
		}
		else {
			script.println("<script>");
			script.println("alert('고객 포인트 업데이트 성공.')");
			script.println("location.href='../reserve/myreserve.jsp'");
			script.println("</script>");
		}
	}
     %>
</body>
</html>