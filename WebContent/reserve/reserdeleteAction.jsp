<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import="re.db.reDAO" %>
<%@ page import="seat.db.seatDAO" %>

<%@ page import="java.io.PrintWriter" %>

<jsp:useBean id="re" class="re.db.reBean"/>

<jsp:setProperty name="re" property="rCode" />
<jsp:setProperty name="re" property="showtime" />

<%
		String id=request.getParameter("rCode");	
		String showdate=request.getParameter("showdate");
		String screenNO=request.getParameter("screenNO");
		String showtime=request.getParameter("showtime");
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
		//seatDAO seatdao = seatDAO.getInstance();
		//boolean result2 = redao.deleteseat(id);
		
		reDAO redao = reDAO.getInstance();
		boolean result = redao.delete(id);

		if(result == true) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('예약이 취소되었습니다.')");
			script.println("location.href = 'myreserve.jsp'");
			script.println("</script>");
			
			/*reDAO redao2 = reDAO.getInstance();
			boolean result2 = redao2.deleteseat(id);
			
			if(result2 == true){
				script.println("<script>");
				script.println("alert('좌석이 취소되었습니다.')");
				script.println("location.href = 'myreserve.jsp'");
				script.println("</script>");
			}else{
				script.println("<script>");
				script.println("alert('좌석 삭제 오류가 발생하였습니다. 다시 시도해주세요.')");
				script.println("history.back()");
				script.println("location.href = 'myreserve.jsp'");
				script.println("</script>");
			}*/
		}
		else  {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('오류가 발생하였습니다. 다시 시도해주세요.')");
			script.println("history.back()");
			script.println("location.href = 'myreserve.jsp'");
			script.println("</script>");
		}
%>
</body>
</html>