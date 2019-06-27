<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@page import="msystem.DBConnection" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
   
<%@ page import="java.util.*" %>  


<%
	String m_title=request.getParameter("m_title");	
	String c_name=request.getParameter("c_name");	
	String showdate=request.getParameter("showdate");
	String screenNO=request.getParameter("screenNO");
	String showtime=request.getParameter("showtime");
	String people=request.getParameter("people");
	
	int count = 0;
	
	Connection con = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> 영화 예매 - 인원 선택 </title>
</head>
<body>
<form name="seating" method="post" action="reserveAction.jsp">
	<input name="mem_id" type="hidden" value="<%=session.getAttribute("mem_id")%>"/>
	<input name="m_title" type="hidden" value="<%=request.getParameter("m_title")%>"/>
	<input name="c_name" type="hidden" value="<%=request.getParameter("c_name")%>">
	<input name="showdate" type="hidden" value="<%=request.getParameter("showdate")%>"/>
	<input name="screenNO" type="hidden" value="<%=request.getParameter("screenNO")%>"/>
	<input name="showtime" type="hidden" value="<%=request.getParameter("showtime")%>"/>
	<input name="people" type="hidden" value="<%=request.getParameter("people")%>">
	<input name="reserDate" type="date" id="currentDate" style="display:none"/>

	<% 	
		try {
				con=DBConnection.getCon();
				String sql = "select screen.seatNum from screen where screen.screenNO=? and screen.c_name=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, screenNO);
				pstmt.setString(2, c_name);
				rs=pstmt.executeQuery();
				if (rs.next()) {
					int seatNum = rs.getInt("seatNum");%>
					<table border="1" width="800">
						<tr><td colspan="11" align=center>
						선택하신 인원은<font color=red><%=request.getParameter("people")%></font>명 입니다.<br>
   						<font color=red><%=request.getParameter("people")%></font>개의 좌석을 선택하세요. 
						</td></tr>
  	   					<tr> <td colspan="11" align=center>스크린</td> </tr>
					    <tr align=center>
					        <td width="30">&nbsp;</td>
					        <td width="20">0</td>
					        <td width="20">1</td>
					        <td width="20">2</td>
					        <td width="20">3</td>
					        <td width="20">4</td>
					        <td width="20">5</td>
					        <td width="20">6</td>
					        <td width="20">7</td>
					        <td width="20">8</td>
					   		<td width="20">9</td>
					    </tr>
					    <script>
					    var seatvalue = new Array();
					    </script>
					<%
						for(int i = 0; i < seatNum; i++){%>
						<tr align=center> 
    					<td width="30"><%=i%>열</td>
						<%
							for(int j = 0; j < 10; j++){%>
								<%
								try {
									conn=DBConnection.getCon();
									String sql2 = "select seatNO from seat "
									+"where seatNO=? and showdate=? and show_num=(select show_num from showinfo where showinfo.c_name=? and showinfo.screenNO=? and showinfo.showTime=?)";
									pstmt=conn.prepareStatement(sql2);
									pstmt.setString(1, i+""+j);
									pstmt.setString(2, showdate);
									pstmt.setString(3, c_name);
									pstmt.setString(4, screenNO);
									pstmt.setString(5, showtime);
									
									rs=pstmt.executeQuery();
									if(rs.next()) {
										String seatNO = rs.getString("seatNO");%>
										<td></td>
									<%}else{%>
										<td>	
											<input onclick="test(this.value)" type=checkbox id="<%=i%><%=j%>" name="checkvalue" value="<%=i%><%=j%>"/>
										</td>
									<%}%>
									
								<%	}catch(Exception e) {
									e.printStackTrace();
								}%>
							<%
								++count;
								if(count>=seatNum) break;
							}%>
							<%
							if(count>=seatNum) break;%>
							</tr>
							<%
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
	</table>
	<input id="SeatPrint" type="hidden" name="reSeat" placeholder="좌석을 입력해주세요."><br>
 	<input onclick="alert(seatvalue)" type="submit" class="btn btn-success" id="sendContact" value="선택완료"/>
</form>
<script>
  document.getElementById("currentDate").value = new Date().toISOString().substring(0, 10);
	
	function test(event){
		if(<%=request.getParameter("people")%><seatvalue.length+1){
			alert("인원을 초과하였습니다. 선택완료를 눌러주세요.");
			document.getElementById(event).checked = false;
		}else{
			var event_test = event;
			seatvalue.push(event_test);
			alert(event_test);
			document.getElementById("SeatPrint").value = seatvalue;
		}
	}
</script>

</body>
</html>