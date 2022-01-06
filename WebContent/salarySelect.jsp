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
<h1>급여 정보 조회</h1>
<table border=1 id="tab1">
	<tr id="t1">
		<th>no</th>
		<th>사원번호</th>
		<th>이름</th>
		<th>급여</th>
		<th>가족수당</th>
		<th>직책수당</th>
		<th>근속수당</th>
		<th>기타수당</th>
		<th>급여합계</th>
	</tr>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	int no=0;
	try{
		String sql="select sudang1129.id,name,to_char(salary,'999,999,999'),to_char(gajok,'999,999,999'),to_char(jikchak,'999,999,999'),to_char(gunsok,'999,999,999'),to_char(gitasudang,'999,999,999'),to_char(salary+gajok+jikchak+gunsok+gitasudang,'999,999,999') from sudang1129,info1129,hobong1129 where info1129.id=sudang1129.id and info1129.position=hobong1129.dunggub";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			String id=rs.getString(1);
			String name=rs.getString(2);
			String salary=rs.getString(3);
			String gajok=rs.getString(4);
			String jikchak=rs.getString(5);
			String gunsok=rs.getString(6);
			String gitasudang=rs.getString(7);
			String sum=rs.getString(8);
			no++;
			System.out.println("테이블 조회 성공");
%>
	<tr>
		<td id="d1"><%=no %></td>
		<td id="d1"><%=id %></td>
		<td id="d1"><%=name %></td>
		<td align="right"><%=salary %></td>
		<td align="right"><%=gajok %></td>
		<td align="right"><%=jikchak %></td>
		<td align="right"><%=gunsok %></td>
		<td align="right"><%=gitasudang %></td>
		<td align="right"><%=sum %></td>
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