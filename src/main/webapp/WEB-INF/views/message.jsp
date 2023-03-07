<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
String message = (String)request.getAttribute("message");
if(message != null && !message.equals("")){
	if(message.equals("MEMBER_ADD_YES"))
	{
		%>
		<script type="text/javascript">
		alert("성공적으로 가입되었습니다");
		location.href = "login.do";
		</script>
		<%
	}
	else{
		%>
		<script type="text/javascript">
		alert("가입되지 않았습니다 다시 가입해 주세요");
		location.href = "regi.do";
		</script>
		<%
	}
}

String login = (String)request.getAttribute("login");
if(login != null && !login.equals("")){
	if(login.equals("LOGIN_OK"))
	{
		%>
		<script type="text/javascript">
		alert("로그인되었습니다");
		location.href = "bbslist.do";
		</script>
		<%
	}
	else{
		%>
		<script type="text/javascript">
		alert("아이디나 패스워드를 다시 확인해주세요");
		location.href = "login.do";
		</script>
		<%
	}
}

String bbswrite = (String)request.getAttribute("bbswrite");
if(bbswrite != null && !bbswrite.equals("")){
	if(bbswrite.equals("BBS_ADD_OK")){
		//int seq = (Integer)request.getAttribute("seq");
		%>
		<script type="text/javascript">
		alert("성공적으로 작성되었습니다");
		location.href = "bbslist.do";
		<%-- location.href = "bbsdetail.do?seq=" + <%=seq%>; --%>
		</script>
		<%
	}
	else{
		%>
		<script type="text/javascript">
		alert("작성되지 않았습니다 다시 작성해 주세요");
		location.href = "bbswrite.do";
		</script>
		<%
	}
}

String answer = (String)request.getAttribute("answer");
if(answer != null && !answer.equals("")){
	if(answer.equals("BBS_ANSWER_OK")){
		//int seq = (Integer)request.getAttribute("seq");
		%>
		<script type="text/javascript">
		alert("답글이 성공적으로 작성되었습니다");
		location.href = "bbslist.do";
		<%-- location.href = "bbsdetail.do?seq=" + <%=seq%>; --%>
		</script>
		<%
	}
	else{
		int seq = (Integer)request.getAttribute("seq");
		%>
		<script type="text/javascript">
		alert("답글을 다시 작성해 주십시오");
		let seq = "<%=seq%>";		
		location.href = "answer.do?seq=" + seq;
		</script>
		<%
	}	
}

String bbsupdate = (String)request.getAttribute("bbsupdate");
if(bbsupdate != null && !bbsupdate.equals("")){
	if(bbsupdate.equals("BBS_UPDATE_OK")){
		int seq = (Integer)request.getAttribute("seq");
		%>
		<script type="text/javascript">
		alert("성공적으로 수정되었습니다");
		location.href = "bbsdetail.do?seq=" + <%=seq%>;
		</script>
		<%
	}
	else{
		int seq = (Integer)request.getAttribute("seq");
		%>
		<script type="text/javascript">
		alert("다시 작성해 주십시오");
		let seq = "<%=seq%>";
		location.href = "bbsupdate.do?seq=" + seq;
		</script>
		<%
	}	
}

String bbsdelete = (String)request.getAttribute("bbsdelete");
if(bbsdelete != null && !bbsdelete.equals("")){
	if(bbsdelete.equals("BBS_DELETE_OK")){
		%>
		<script type="text/javascript">
		alert("성공적으로 삭제되었습니다");
		location.href = "bbslist.do";
		</script>
		<%
	}
	else{
		int seq = (Integer)request.getAttribute("seq");
		%>
		<script type="text/javascript">
		alert("삭제되지 않았습니다");
		let seq = "<%=seq%>";
		location.href = "bbsdetail.do?seq=" + seq;
		</script>
		<%
	}	
}

String sessionOut = (String)request.getAttribute("sessionOut");
if(sessionOut != null && !sessionOut.equals("")){
	%>
		<script type="text/javascript">
		alert("로그인 해 주세요");
		location.href = "login.do";
		</script>
	<%
}
%>
<%-- 
String answer = (String)request.getAttribute("answer");
int seq = (Integer)request.getAttribute("seq");
if(answer != null && !answer.equals("")){
	if(answer.equals("BBS_ANSWER_OK")){
		%>
		<script type="text/javascript">
		alert("답글이 성공적으로 작성되었습니다");
		location.href = "bbs?param=bbslist";
		</script>
		<%
	}
	else{
		%>
		<script type="text/javascript">
		alert("답글이 작성되지 않았습니다 다시 작성해 주세요");
		let seq = "<%=seq%>"
		location.href = "bbs?param=answer&seq=" + seq;
		</script>
		<%
	}
}
--%>





























