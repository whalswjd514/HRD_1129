<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBConn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	String salary=request.getParameter("salary");
	String dunggub=request.getParameter("dunggub");
	try{
		String sql="update hobong1129 set salary=? where dunggub=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, salary);
		pstmt.setString(2, dunggub);
		pstmt.executeUpdate();
		System.out.println("데이터 수정 성공");
%>
	<script>
		alert("수정 완료");
		location.href="hobongSelect.jsp"
	</script>
<%
	}catch(SQLException e){
		System.out.println("데이터 수정 실패");
	}
%>
	<script>
		alert("수정 실패");
		location.href="index.jsp"
	</script>
</body>
</html>