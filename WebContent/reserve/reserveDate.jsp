<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   
<%@ page import="java.util.*" %>  

<%
	String m_title=request.getParameter("m_title");	
	String c_name=request.getParameter("c_name");
	//session.setAttribute("mem_id", id);
	//session.setAttribute("mem_pwd", pwd);
%>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<meta charset="EUC-KR">
<title> ��ȭ ���� - �󿵳�¥ ����</title>
</head>
<body>
<form name="date" method="post" action="reserveScreen.jsp">
	<br>
	<label for="startDate"> �� ��¥ ���� </label>
	<input name="mem_id" type="hidden" value="<%=session.getAttribute("mem_id")%>">
	<input name="m_title" type="hidden" value="<%=request.getParameter("m_title")%>">
	<input name="c_name" type="hidden" value="<%=request.getParameter("c_name")%>">
	<input type="text" id="startDate" name="showdate">
 	<input type="submit" class="btn btn-success" id="sendContact" value="����"/>
</form>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
            $.datepicker.setDefaults($.datepicker.regional['ko']); 
            $( "#startDate" ).datepicker({
                 changeMonth: true, 
                 changeYear: true,
                 nextText: '���� ��',
                 prevText: '���� ��', 
                 dayNames: ['�Ͽ���', '������', 'ȭ����', '������', '�����', '�ݿ���', '�����'],
                 dayNamesMin: ['��', '��', 'ȭ', '��', '��', '��', '��'], 
                 monthNamesShort: ['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��'],
                 monthNames: ['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��'],
                 dateFormat: "yymmdd",
                 maxDate: 14,                       // �����Ҽ��ִ� �ּҳ�¥, ( 0 : ���� ���� ��¥ ���� �Ұ�)
                 onClose: function( selectedDate ) {    
                      //������(startDate) datepicker�� ������
                      //������(endDate)�� �����Ҽ��ִ� �ּ� ��¥(minDate)�� ������ �����Ϸ� ����
                     $("#endDate").datepicker( "option", "minDate", selectedDate );
                 }    
 
            });
        
    });
</script>

</body>
</html>