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
	String dunggub=request.getParameter("dunggub");
	String salary=request.getParameter("salary");
	PreparedStatement pstmt=null;
	try{
		String sql="insert into hobong1129 values(?,?)";
		pstmt=conn.prepareStatement(sql);
		
		pstmt.setString(1, dunggub);
		pstmt.setString(2, salary);
		pstmt.executeUpdate();
		System.out.println("데이터 등록 성공");
%>
	<script>
		alert("등록 성공");
		location.href="hobongSelect.jsp"
	</script>
<%
	}catch(SQLException e){
		System.out.println("데이터 등록 실패");
		e.printStackTrace();
	}
%>
	<script>
		alert("등록 실패");
		location.href="index.jsp"
	</script>
</body>
</html>