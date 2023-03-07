<%@page import="mul.cam.a.util.Utility"%>
<%@page import="mul.cam.a.dto.BbsDto"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<script type="text/javascript" src="./jquery/jquery.twbsPagination.min.js"></script>
</head>
<body>

<%
	/*
	String choice = request.getParameter("choice");
	String search = request.getParameter("search");
	
	if(choice == null){
		choice = "";	
	}
	if(search == null){
		search = "";
	}
	*/
	//BbsDao dao = BbsDao.getInstence();
	
	//List<BbsDto> list = dao.getBbsList();
	//List<BbsDto> list = dao.getBbsSearchList(choice, search);
	
	// 컨트롤러에서 온 포장들
	List<BbsDto> list = (List<BbsDto>)request.getAttribute("bbslist");
	
	int pageBbs = (Integer)request.getAttribute("pageBbs");
	int pageNumber = (Integer)request.getAttribute("pageNumber");
	String choice = (String)request.getAttribute("choice");
	String search = (String)request.getAttribute("search");
%>

<h1>게시판</h1>

<a href="pdslist.do">자료실</a>
<hr>

<div align="center">
<table border="1">
<col width="70"><col width="600"><col width="100"><col width="150">
<thead>
<tr>
	<th>번호</th><th>제목</th><th>조회수</th><th>작성자</th>
</tr>
</thead>
<tbody>

<%
	if(list == null || list.size() == 0){
		%>
		<tr>
			<td colspan="4">작성된 글이 없습니다</td>
		</tr>
		<%
	}
	else{
		for(int i = 0; i < list.size(); i++){
			BbsDto dto = list.get(i);
			
			%>
			<tr>
				<th><%=i + 1%></th>
				
				<%
				if(dto.getDel() == 0){
				%>
				<td>
					<%=Utility.arrow(dto.getDepth())%>
					<a href="bbsdetail.do?seq=<%=dto.getSeq()%>">
						<%=dto.getTitle()%>
					</a>
				</td>
				<%
				}
				else if(dto.getDel() == 1){
				%>
				<td>
					<%=Utility.arrow(dto.getDepth())%>
					<font color="#ff0000">*** 이 글은 작성자에 의해서 삭제되었습니다 ***</font>
				</td>
				<%
				}
				%>
				
				<td><%=dto.getReadcount()%></td>
				<td><%=dto.getId()%></td>
			</tr>
			<%
		}
	}
%>

</tbody>
</table>

<br><br>
<%--
<%
	for(int i = 0; i < pageBbs; i++){
		if(pageNumber == i){ // 현재 페이지
			%>
			<span style="font-size: 15pt; color: #0000ff; font-weight: bold;">
				<%=i + 1%>
			</span>
			<%
		}
		else{ // 그밖에 다른 페이지
			%>
			<a href="#none" title="<%=i + 1%>페이지" onclick="goPage(<%=i%>)" style="font-size: 15pt; color: #000; font-weight: bold; text-decoration: none;">
				[<%=i + 1%>]
			</a>
			<%
		}
	}
%>
--%>

<div class="container">
    <nav aria-label="Page navigation">
        <ul class="pagination" id="pagination" style="justify-content: center;"></ul>
    </nav>
</div>

<br><br>

<select id="choice">
	<option value="">검색</option>
	<option value="title">제목</option>
	<option value="content">내용</option>
	<option value="writer">작성자</option>
</select>

<input type="text" id="search" value="<%=search%>">

<button type="button" onclick="searchBtn()">검색</button>

<br><br>

<a href="bbswrite.do">글쓰기</a>

</div>

<script type="text/javascript">
let search = "<%=search%>";
if (search != "") {
	let obj = document.getElementById("choice");
	obj.value = "<%=choice%>";
	obj.setAttribute("selected", "selected");
}

function searchBtn() {
	let choice = document.getElementById("choice").value;
	let search = document.getElementById("search").value;
	/*
	if (choice == "") {
		alert("카테고리를 선택해 주세요");
		
		return;
	}
	if (search.trim() == "") {
		alert("검색어를 선택해 주세요");
		
		return;
	}
	*/
	location.href="bbslist.do?choice=" + choice + "&search=" + search;
}

function goPage(pageNumber) {
	let choice = document.getElementById("choice").value;
	let search = document.getElementById("search").value;
	
	location.href="bbslist.do?choice=" + choice + "&search=" + search + "&pageNumber=" + pageNumber;
}

$("#pagination").twbsPagination({
	startPage: <%=pageNumber+1%>,
    totalPages: <%=pageBbs%>,
    visiblePages: 10,
    first: "<span srid-hidden='true'>«</span>",
    prev: "이전",
    next: "다음",
    last: "<span srid-hidden='true'>»</span>",
    initiateStartPageClick: false, // onPageClick이 자동실행되는것을 방지
    onPageClick: function (event, page) {
        //console.info(page + ' (from options)');
        //alert(page);
        let choice = document.getElementById("choice").value;
		let search = document.getElementById("search").value;
    	location.href="bbslist.do?choice=" + choice + "&search=" + search + "&pageNumber=" + (page-1);
    }
});
</script>

</body>
</html>



























