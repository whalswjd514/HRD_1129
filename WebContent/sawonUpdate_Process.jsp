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
	String name=request.getParameter("name");
	String dept=request.getParameter("dept");
	String position=request.getParameter("position");
	String duty=request.getParameter("duty");
	String phone=request.getParameter("phone");
	String address=request.getParameter("address");
	String id=request.getParameter("id");
	try{
		String sql="update info1129 set name=?,dept=?,position=?,duty=?,phone=?,address=? where id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, dept);
		pstmt.setString(3, position);
		pstmt.setString(4, duty);
		pstmt.setString(5, phone);
		pstmt.setString(6, address);
		pstmt.setString(7, id);
		pstmt.executeUpdate();
		System.out.println("데이터 수정 성공");
%>
	<script>
		alert("수정 성공");
		location.href="sawonSelect.jsp";
	</script>
<%
	}catch(SQLException e){
		System.out.println("데이터 수정 실패");
	}
%>
	<script>
		alert("수정 실패");
		location.href="index.jsp";
	</script>
</body>
</html>