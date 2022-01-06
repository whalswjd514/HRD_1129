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
<h1>사원 정보 조회</h1>
<table border=1 id="tab1" align=center>
	<tr id="t1">
		<th>no</th>
		<th>사번</th>
		<th>성명</th>
		<th>직급</th>
		<th>직책</th>
		<th>연락처</th>
		<th>소속부서</th>
		<th>주소</th>
		<th>관리</th>
	</tr>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	try{
		String sql="select * from info1129";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		int no=0;
		while(rs.next()){
			int id=rs.getInt("id");
			String name=rs.getString("name");
			String position=rs.getString("position");
			String duty=rs.getString("duty");
			String phone=rs.getString("phone");
			String dept=rs.getString("dept");
			String address=rs.getString("address");
			no++;
			System.out.println("테이블 조회 성공");
%>
	<tr>
		<td><%=no %></td>
		<td><a href="sawonUpdate.jsp?id=<%=id %>"><%=id %></a></td>
		<td><%=name %></td>
		<td><%=position %></td>
		<td><%=duty %></td>
		<td><%=phone %></td>
		<td><%=dept %></td>
		<td><%=address %></td>
		<td><a href="sawonDelete.jsp?id=<%=id %>"
		onclick="if(!confirm('정말로 삭제하시겠습니까?))
		return false;">삭제</a></td>
	</tr>
<%
		}
	}catch(SQLException e){
		System.out.println("테이블 조회 실패");
		e.printStackTrace();
	}
%>
</table>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>