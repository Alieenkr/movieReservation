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
		String mem_id = null;
		if(session.getAttribute("mem_id") != null) {
			mem_id = (String) session.getAttribute("mem_id");
		}
	
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
			if (payMeth.equals("h")) { // 미발권, 현장 결제
				//티켓생성
				ticketDAO tidao = ticketDAO.getInstance();
				int result = tidao.reTiInsert(ti);
				
				if(result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('발권 실패. 다시 시도하세요.')");
					script.println("location.href = '../admin/admin_ticket.jsp'");
					script.println("</script>");
				}
				else  {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('발권 완료.')");
					//script.println("location.href = '../admin/admin_ticket.jsp'");
					script.println("</script>");
					
					//발권 상태 변경
					ticketDAO tidao2 = ticketDAO.getInstance();
					int updateIsPaid = tidao2.tiIsPaid(rCode);
						if(updateIsPaid == -1) {
							script.println("<script>");
							script.println("alert('발권 상태 변경 실패')");
							script.println("</script>");
						}
						else  {
							script.println("<script>");
							script.println("alert('발권 상태 변경 완료.')");
							script.println("location.href = '../admin/admin_ticket.jsp'");
							script.println("</script>");
						}
				}
			}
			else { // 미발권, 인터넷 결제
				
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('인터넷결제 예약. 관리자 발권 불가.)");
				script.println("location.href = '../admin/admin_ticket.jsp'");
				script.println("</script>");
			}	
		}
		else { // 이미 발권
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 발권된 예약입니다.')");
			script.println("location.href = '../admin/admin_ticket.jsp'");
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
         
</body>
</html>