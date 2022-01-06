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
<h1>수당 정보 조회</h1>
<table border=1 id="tab1">
	<tr id="t1">
		<th>no</th>
		<th>사원번호</th>
		<th>이름</th>
		<th>가족수당</th>
		<th>직책수당</th>
		<th>근속수당</th>
		<th>기타수당</th>
		<th>수당합계</th>
		<th>구분</th>
	</tr>
<%@ include file="DBConn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	int no=0;
	try{
		String sql="select info1129.id,name,to_char(gajok,'999,999,999'),to_char(jikchak,'999,999,999'),to_char(gunsok,'999,999,999'),to_char(gitasudang,'999,999,999'),to_char(gajok+jikchak+gunsok+gitasudang,'999,999,999') from info1129,sudang1129 where info1129.id=sudang1129.id";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			String id=rs.getString(1);
			String name=rs.getString(2);
			String gajok=rs.getString(3);
			String jikchak=rs.getString(4);
			String gunsok=rs.getString(5);
			String gitasudang=rs.getString(6);
			String sum=rs.getString(7);
			no++;
			System.out.println("테이블 조회 성공");
%>
	<tr>
		<td id="d1"><%=no %></td>
		<td id="d1"><%=id %></td>
		<td id="d1"><%=name %></td>
		<td align="right"><%=gajok %></td>
		<td align="right"><%=jikchak %></td>
		<td align="right"><%=gunsok %></td>
		<td align="right"><%=gitasudang %></td>
		<td align="right"><%=sum %></td>
		<td id="d1"><a href="sudangUpdate.jsp?id=<%=id %>">수정</a> /
			<a href="sudangDelete.jsp?id=<%=id %>"onclick="if(!confirm('정말로 삭제하시겠습니까?'))
			return false;">삭제</a>
		</td>
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