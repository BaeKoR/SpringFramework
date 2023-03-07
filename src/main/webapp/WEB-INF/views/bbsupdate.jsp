<%@page import="mul.cam.a.dto.BbsDto"%>
<%@page import="mul.cam.a.dao.BbsDao"%>
<%@page import="mul.cam.a.dto.MemberDto"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
MemberDto login = (MemberDto)session.getAttribute("login");

BbsDto dto = (BbsDto)request.getAttribute("bbsdto");

int seq = Integer.parseInt(request.getParameter("seq"));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
//BbsDao dao = BbsDao.getInstence();
//BbsDto dto = dao.getBbs(seq);
%>

<h2>글 수정</h2>

<div>
<form action="bbsupdateAf.do" method="post">
<%-- <input type="hidden" name="seq" value="<%=dto.getSeq()%>"> --%>
<input type="hidden" name="seq" value="<%=seq%>">

<table>
<col width="200"><col width="500">
<tr>
	<th>아이디</th>
	<td>
		<%=dto.getId()%>
	</td>
</tr>
<tr>
	<th>제목</th>
	<td>
		<input type="text" name="title" size="60" value='<%=dto.getTitle()%>'>
	</td>
</tr>
<tr>
	<th>내용</th>
	<td>
		<textarea rows="10" cols="60" name="content"><%=dto.getContent()%></textarea>
	</td>
</tr>
<tr>
	<td colspan="2" align="right">
		<input type="submit" value="수정 완료">
	</td>
</tr>
</table>
</form>
</div>

</body>
</html>



























