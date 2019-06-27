<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
 
<%@ page import="java.sql.*" %><%@page import="msystem.DBConnection" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@ page import="java.io.PrintWriter" %>

<%@ page import="ticket.db.ticketDAO" %>
<jsp:useBean id="ti" class="ticket.db.ticketBean"/>
<jsp:setProperty name="ti" property="rCode" />


<%
	String rCode=request.getParameter("rCode");
%>

<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	</head>
	
<body>
 <% 
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	
		try {
		con=DBConnection.getCon();
		String sql = "select * from payinfo join re on payinfo.rCode=re.rCode where payinfo.rCode=?";
			
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, rCode);
		rs=pstmt.executeQuery();
		if(rs.next()) {	
		String payMeth = rs.getString("payMeth");
		String isPaid = rs.getString("isPaid");
		if (isPaid.equals("0")) {
			if (payMeth.equals("i")) { // 미발권, 인터넷 결제
				ticketDAO tidao = ticketDAO.getInstance();
				int result = tidao.reTiInsert(ti);
				
				if(result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('발권 실패. 다시 시도하세요.')");
					script.println("location.href = '../reserve/myreserve.jsp'");
					script.println("</script>");
				}
				else  {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('발권 완료.')");
					//script.println("location.href = 'showTicket.jsp'");
					script.println("</script>");
					
					ticketDAO tidao2 = ticketDAO.getInstance();
					int updateIsPaid = tidao2.tiIsPaid(rCode); 
					if(updateIsPaid  == -1) {
						script.println("<script>");
						script.println("alert('발권 상태 변경 실패')");
						script.println("</script>");
					}
					else  {
						script.println("<script>");
						script.println("alert('발권 상태 변경 완료.')");
						script.println("location.href = 'showTicket.jsp'");
						script.println("</script>");
					}
				}
			}
			
			else { // 미발권, 현장 결제
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('현장결제 예약입니다. 결제 후 관리자에게 발권받으세요.')");
				script.println("location.href = '../reserve/myreserve.jsp'");
				script.println("</script>");
			}
		}
		else { // 이미 발권
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 발권받으셨습니다.')");
			script.println("location.href = 'showTicket.jsp'");
			script.println("</script>");
		}
	
		} 
        } catch (SQLException se) {
        System.out.println(se.getMessage());
        } finally {
        try {
        if(rs!=null) rs.close();
        if(pstmt!=null) pstmt.close();
        if(con!=null) con.close();
        } catch(SQLException se) {
        System.out.println(se.getMessage());
        }
      }  
	%>
          

	<%
	String mem_id = null;
	if(session.getAttribute("mem_id") != null) {
		mem_id = (String) session.getAttribute("mem_id");
	}
	// 세션이 존재하는 회원들은 mem_id에 해당 세션 값을 저장
	

%>
</body>
</html>