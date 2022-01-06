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
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String id=request.getParameter("id");
	try{
		String sql="select * from info1129 where id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		if(rs.next()){
			String name=rs.getString("name");
			String dept=rs.getString("dept");
			String position=rs.getString("position");
			String duty=rs.getString("duty");
			String phone=rs.getString("phone");
			String address=rs.getString("address");
%>
<form name="form" method="post" action="sawonUpdate_Process.jsp">
<h1>인사관리 사원등록 화면</h1>
<table border=1 id="tab1">
	<tr>
		<th>사원번호(자동생성)</th>
		<td><input type="text" name="id" value="<%=id %>">마지막번호+1</td>
	</tr>
	<tr>
		<th>성명</th>
		<td><input type="text" name="name" value="<%=name %>"></td>
	</tr>
	<tr>
		<th>소속부서</th>
		<td>
			<select name="dept">
				<option value="0"<%if(dept.equals("0")){%>selected<%}%>>선택없음</option>
				<option value="10"<%if(dept.equals("10")){%>selected<%}%>>인사부</option>
				<option value="20"<%if(dept.equals("20")){%>selected<%}%>>기획부</option>
				<option value="30"<%if(dept.equals("30")){%>selected<%}%>>홍보부</option>
				<option value="40"<%if(dept.equals("40")){%>selected<%}%>>영업부</option>
				<option value="50"<%if(dept.equals("50")){%>selected<%}%>>경리부</option>
			</select>
		</td>
	</tr>
	<tr>
		<th>직급</th>
		<td><input type="radio" name="position" value="1" <%if(position.equals("1")){%>checked<%}%>>1급
			<input type="radio" name="position" value="2" <%if(position.equals("2")){%>checked<%}%>>2급
			<input type="radio" name="position" value="3" <%if(position.equals("3")){%>checked<%}%>>3급
			<input type="radio" name="position" value="4" <%if(position.equals("4")){%>checked<%}%>>4급
			<input type="radio" name="position" value="5" <%if(position.equals("5")){%>checked<%}%>>5급
		</td>
	</tr>
	<tr>
		<th>직책</th>
		<td><input type="text" name="duty" value="<%=duty %>"></td>
	</tr>
	<tr>
		<th>연락처</th>
		<td><input type="text" name="phone" value="<%=phone %>"></td>
	</tr>
	<tr>
		<th>주소</th>
		<td><input type="text" name="address" value="<%=address %>"></td>
	</tr>
	<tr>
		<td colspan=2 align=center>
			<input type="button" value="등록" id="in1" onclick="check()">
			<input type="reset" value="취소" id="in1">
		</td>
	</tr>
<%
			}
	}catch(SQLException e){
		System.out.println("데이터 조회 실패");
	}
%>
</table>
</form>
<script>
	function check(){
		if(document.form.name.value==""){
			alert("성명이 입력되지 않았습니다.");
			document.form.name.focus();
		}else if(document.form.dept.value=="0"){
			alert("소속부서가 입력되지 않았습니다.");
			document.form.dept.focus();
		}else{
			cnt=0;
			var position=document.getElementsByName("position");
			for(var i=0;i<position.length;i++){
				if(position[i].checked==true){
					cnt++;
					break;
				}
			}if(cnt==0){
				alert("직급을 입력해주세요.");
				document.form.position.focus();
		}else if(document.form.duty.value==""){
			alert("직책이 입력되지 않았습니다.");
			document.form.duty.focus();
		}else if(document.form.phone.value==""){
			alert("연락처가 입력되지 않았습니다.");
			document.form.phone.focus();
		}else if(document.form.address.value==""){
			alert("주소가 입력되지 않았습니다.");
			document.form.address.focus();
		}else{
			alert("등록이 완료되었습니다.");
			document.form.submit();
		}
	}
	}
</script>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>