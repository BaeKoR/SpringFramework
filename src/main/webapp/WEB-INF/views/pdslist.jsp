<%@page import="mul.cam.a.dto.PdsDto"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
List<PdsDto> list = (List<PdsDto>)request.getAttribute("pdslist");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>자료실</h1>
<hr>

<div align="center">
<table border="1">
<col width="50"><col width="100"><col width="300"><col width="50"><col width="50"><col width="50"><col width="100">
<thead>
<tr>
	<th>번호</th><th>작성자</th><th>제목</th><th>다운로드</th><th>조회수</th><th>다운수</th><th>작성일</th>
</tr>
</thead>
<tbody>
<%
for(int i = 0; i < list.size(); i++){
	PdsDto pds = list.get(i);
	%>
	<tr>
		<th><%=i + 1%></th>
		<td><%=pds.getId()%></td>
		<td>
			<a href="pdsdetail.do?seq=<%=pds.getSeq()%>"><%=pds.getTitle()%></a>
		</td>
		<td>
			<input type="button" value="다운로드" onclick="filedown(<%=pds.getSeq()%>, '<%=pds.getNewfilename()%>', '<%=pds.getFilename()%>')">
		</td>
		<td><%=pds.getReadcount()%></td>
		<td><%=pds.getDowncount()%></td>
		<td><%=pds.getRegdate()%></td>
	</tr>
	<%
}
%>
</tbody>
</table>

<br>
<button type="button" onclick="pdsWrite()">자료추가</button>

</div>

<form name="file_down" action="filedownLoad.do" method="post">
	<input type="hidden" name="newfilename">
	<input type="hidden" name="filename">
	<input type="hidden" name="seq">
</form>

<script type="text/javascript">
function pdsWrite() {
	location.href="pdswrite.do";
}

function filedown(seq, newfilename, filename) {
	document.file_down.newfilename.value = newfilename;
	document.file_down.filename.value = filename;
	document.file_down.seq.value = seq;
	document.file_down.submit();
}
</script>

</body>
</html>




























