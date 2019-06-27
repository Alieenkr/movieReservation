<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 
<%@page import="msystem.DBConnection" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@ page import="java.io.PrintWriter" %>   
<%@ page import="java.util.*" %>  
<%@ page import="re.db.reDAO" %>
<%@ page import="seat.db.seatDAO" %>

<jsp:useBean id="re" class="re.db.reBean" scope="page"/>
<jsp:useBean id="seat" class="seat.db.seatBean" scope="page"/>

<jsp:setProperty name="re" property="m_title" />
<jsp:setProperty name="re" property="c_name" />
<jsp:setProperty name="re" property="showdate" />
<jsp:setProperty name="re" property="screenNO" />
<jsp:setProperty name="re" property="showtime" />
<jsp:setProperty name="re" property="people" />
<jsp:setProperty name="re" property="reSeat" />
<jsp:setProperty name="re" property="mem_id" />
<jsp:setProperty name="re" property="reserDate" />

<jsp:setProperty name="seat" property="c_name" />
<jsp:setProperty name="seat" property="showdate" />
<jsp:setProperty name="seat" property="screenNO" />

<%

	String m_title=request.getParameter("m_title");	
	String c_name=request.getParameter("c_name");	
	String showdate=request.getParameter("showdate");
	String screenNO=request.getParameter("screenNO");
	String showtime=request.getParameter("showtime");
	String reSeat=request.getParameter("reSeat");
	String [] checkvalue = request.getParameterValues("checkvalue");
	int seatresult = 0;
	
	Random random = new Random();
	String randomStr = String.valueOf(random.nextInt(10000));
%>

		
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> 예약 저장 </title>
</head>
<body>
     <%
     
     reDAO redao = reDAO.getInstance();
     int result = redao.reCiInsert(re, randomStr); 

	if(result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('예약 실패')");
		script.println("location.href='reserve_main.jsp'");
		//script.println("history.back()");
		script.println("</script>");
	}
	else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('예약 성공.')");
		//script.println("history.back()");
		script.println("</script>");
		
		for(int i = 0; i<checkvalue.length; i++){
	    	 seatDAO seatdao = seatDAO.getInstance();
	    	 seatresult = seatdao.createSeat(seat, re, checkvalue[i], randomStr); 
	     } 

		if(seatresult == -2){
			script.println("<script>");
			script.println("alert('좌석 추가 실패')");
			script.println("location.href='reserveSeat.jsp'");
			//script.println("history.back()");
			script.println("</script>");
		}else{
			script.println("<script>");
			script.println("alert("+randomStr+")");
			script.println("alert('좌석 추가 성공. 결제창으로 이동')");
			script.println("location.href='../payInfo/payInfo_form.jsp'");
			//script.println("history.back()");
			script.println("</script>");
		}
	}
     %>
</body>
</html>