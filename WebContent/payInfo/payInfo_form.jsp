<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="msystem.DBConnection" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>

<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title> 내역 확인 </title>
	</head>
	
<body>

<%
	String mem_id = null;
	if(session.getAttribute("mem_id") != null) {
	mem_id = (String) session.getAttribute("mem_id");
	}
%>

		<div class="top">
			<jsp:include page="topPay.jsp"></jsp:include>
		</div>
		
		 <div class="container" id="point">
		 <form name="payform" method="post" action="payAction.jsp" > 
		 <input name="mem_id" type="hidden" value="<%=session.getAttribute("mem_id")%>">
		  <% 
		  
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	
		try {
			con=DBConnection.getCon();
			String sql = "select * from re inner join member on re.mem_id=member.mem_id where re.mem_id=?";
			//select * from re inner join member on re.mem_id=member.mem_id;
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			rs=pstmt.executeQuery();
			if (rs.next()) {
				int rCode = rs.getInt("rCode");
				String c_name = rs.getString("c_name");
				String screenNO = rs.getString("screenNO");
				String showdate = rs.getString("showdate");
				String showtime = rs.getString("showtime");
				String people = rs.getString("people");	
				int mem_point = rs.getInt("mem_point");	
				
		%>	
		<input type="hidden" name="rCode" value="<%=rCode%>">
		
		예약 내역을 확인한 후 내역이 일치할 경우 '예매하기'를 통해 예매를 완료하십시오. <br>
		완료 되지 않은 예약 내역은 인정되지 않습니다. <br>
		
		 <div class="col-md-6">
		 <br>
          <table class="table table-striped">
                <tr><th>영화관</th><td><%=c_name%></td></tr>
                <tr><th>상영관</th><td><%=screenNO%></td></tr>
                <tr><th>상영날짜</th><td><%=showdate%></td></tr>
                <tr><th>상영시각</th><td><%=showtime%></td></tr>
    <!-- 추가 -->	<tr><th>인원</th><td><input type="text" id="people" value="<%=people%>"></td></tr>
            
               <%
             int peo = Integer.parseInt(rs.getString("people"));
             int pay = 10000;
             int to =(peo*pay);
             %>
                <tr><th>금액</th><td><input type="text" id="paidmon" name="paidmon" style="width:75px" value="<%=to%>"></td></tr>
                <tr><th>내 포인트</th> <td><input type="text" id="mem_point" name="mem_point" style="width:75px" value="<%=mem_point%>"></td></tr>
                <tr><th>포인트 사용</th><td><input type="text" id="paidpoi" name="paidpoi" style="width:75px">
                						<input type="button" id="ok" name="ok" value="적용" style="width:50px" onclick="button1_click();"></td></tr>
                <tr><th>최종 결제 금액</th><td><input type="text" name="paidTot" id="paidTot" style="width:75px" value=""></td></tr>
                <tr><th>지불 방법</th><td>현장결제<input type="checkbox" name="payMeth" value="h">  인터넷결제<input type="checkbox" name="payMeth" value="i"></td></tr>
                <tr><th>예약일</th><td><input name="paidDate" type="date" id="currentDate"></td></tr>
    <!-- 추가 --> <tr><th></th><td> 결제내역 확인 후, 결제진행 '동의' 버튼을 클릭해주세요. <input type="button" id="ok2" name="ok2" value="동의" style="width:50px" onclick="button2_click();"></td></tr>
    <!-- 추가 --> <tr><th></th><td>
    <!-- 추가 -->	<input type="hidden" id="mem_point2" name="mem_point2" style="width:75px" value="<%=mem_point%>">
    <!-- 추가 -->	<input type="hidden" id="usepointN" name="usepointN" value="">
    <!-- 추가 -->	<input type="hidden" id="sapointN" name="sapointN" value="">
   	<!-- 추가 -->	<input type="hidden" id="lastpo" name="lastpo" value=""></td></tr>
                
            <% } 
            } 
		catch (SQLException se) {
            System.out.println(se.getMessage());
        } finally {
            try {
            	if(rs!=null) rs.close();
            	if(pstmt!=null) pstmt.close();
            	if(con!=null) con.close();
            } 
            catch(SQLException se) {
            	System.out.println(se.getMessage());
            }
        }
		%>
          </table>  
          <button type="submit" class="btn btn-primary" onclick="location.href='payAction.jsp'" > 예약 완료  </button>
        </div>
       </form>
	</div>

<script>
	function button1_click() {
		var mem_point=document.getElementById("mem_point").value;
		mem_point *= 1;
		
		if (mem_point <999) {
			alert("포인트는 1,000점 이상일 때 사용할 수 있습니다.");
		}
		
		else {
		var paidmon=document.getElementById("paidmon").value;
		var paidpoi=document.getElementById("paidpoi").value;
		paidmon *= 1;
		paidpoi *= 1;
		
		document.getElementById('paidTot').value=product(paidmon,paidpoi);
		}
	}
	
	function product(paidmon, paidpoi) {
		return paidmon-paidpoi;
	}
	// 고객 포인트 조회해서 사용할 포인트 입력 후 총 결제 금액 리턴
	
	function button2_click() {
		var mem_point2=document.getElementById("mem_point2").value;
		var paidpoi=document.getElementById("paidpoi").value;
		var people=document.getElementById("people").value;
		var po=100;
		
		mem_point2 *= 1;
		paidpoi *= 1;
		people *= 1;
	
		document.getElementById('usepointN').value=product2(mem_point2,paidpoi); //차감된 후의 고객포인트
		document.getElementById('sapointN').value=product3(people,po); //적립해줄 포인트 값	
		
		lapo();
	}
	
	function lapo() {
		var usepointN=document.getElementById("usepointN").value;
		var sapointN=document.getElementById("sapointN").value;
		usepointN *= 1;
		sapointN *= 1;
		
		document.getElementById('lastpo').value=product4(usepointN,sapointN); //적립해줄 포인트 값
		alert("예약완료 버튼을 눌러 결제를 완료하세요.");
	}

	function product2(mem_point2, paidpoi) {
		return mem_point2-paidpoi;
	}
	
	function product3(people, po) {
		return people*po;
	}
	
	function product4(usepointN, sapointN) {
		return usepointN+sapointN;
	}	
</script>

<script>
  document.getElementById("currentDate").value = new Date().toISOString().substring(0, 10);;
</script>
	
</body>
</html>