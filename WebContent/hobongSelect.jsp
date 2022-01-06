<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<%@ include file="DBConn.jsp" %>
<h1>호봉 정보 조회</h1>
<table border=1 id="tab2">
	<tr id="t1">
		<th>no</th>
		<th>직급</th>
		<th>급여</th>
		<th>삭제</th>
	</tr>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	int no=0;
	try{
		String sql="select * from hobong1129";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			int dunggub=rs.getInt("dunggub");
			int salary=rs.getInt("salary");
			no++;
			System.out.println("테이블 조회 성공");
%>
	<tr>
		<td><%=no %></td>
		<td><a href="hobongUpdate.jsp?dunggub=<%=dunggub %>"><%=dunggub %>급</a></td>
		<td><%=salary %></td>
		<td><a href="hobongDelete.jsp?dunggub=<%=dunggub %>"onclick="if(!confirm('정말로 삭제하시겠습니까?'))
			return false;">삭제</a></td>
	</tr>
<%
		}
	}catch(SQLException e){
		System.out.println("테이블 조회 실패");
	}
%>
</table>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>