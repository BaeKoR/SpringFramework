<%@page import="mul.cam.a.dto.BbsDto"%>
<%@page import="mul.cam.a.dto.MemberDto"%>
<%@page import="mul.cam.a.dto.PdsDto"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
PdsDto pds = (PdsDto)request.getAttribute("pds");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>자료상세보기</h1>
<hr>

<div align="center">
<table border="1">
<col width="200"><col width="500">
<tr>
	<th>아이디</th>
	<td><%=pds.getId()%></td>
</tr>
<tr>
	<th>제목</th>
	<td><%=pds.getTitle()%></td>
</tr>
<tr>
	<th>다운로드</th>
	<td>
		<input type="button" value="다운로드" onclick="filedown(<%=pds.getSeq()%>, '<%=pds.getNewfilename()%>', '<%=pds.getFilename()%>')">
	</td>
</tr>
<tr>
	<th>조회수</th>
	<td><%=pds.getReadcount() %></td>
</tr>
<tr>
	<th>다운로드수</th>
	<td><%=pds.getDowncount() %></td>
</tr>
<tr>
	<th>파일명</th>
	<td><%=pds.getFilename() %></td>
</tr>
<tr>
	<th>등록일</th>
	<td><%=pds.getRegdate() %></td>
</tr>
<tr>
	<th>내용</th>
	<td>
		<textarea rows="10" cols="50" readonly="readonly"><%=pds.getContent()%></textarea>
	</td>
</tr>
</table>

<button type="button" onclick="location.href='pdslist.do'">글목록</button>

<%
MemberDto login = (MemberDto)session.getAttribute("login");
if(pds.getId().equals(login.getId())){
	%>
	<button type="button" onclick="location.href='pdsupdate.do?seq=<%=pds.getSeq()%>'">수정</button>
	<button type="button" onclick="location.href='pdsdelete.do?seq=<%=pds.getSeq()%>'">삭제</button>
	<%
}
%>

</div>

<form action="filedownLoad.do" name="file_down" method="post">
	<input type="hidden" name="newfilename">
	<input type="hidden" name="filename">
	<input type="hidden" name="seq">
</form>

<script type="text/javascript">
function filedown(seq, newfilename, filename) {
	document.file_down.seq.value = seq;
	document.file_down.newfilename.value = newfilename;
	document.file_down.filename.value = filename;
	document.file_down.submit();
}
</script>

</body>
</html>




























