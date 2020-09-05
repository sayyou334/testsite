<%@Codepage = 65001%>
<% Session.Codepage = 65001%>
<% Response.Charset="utf-8"%>
<!-- 65001 = ansi코드, 위 세줄은 무조건 맨 위로 가야함-->

<!--mem_regist.asp-->

<%
	'데이터 받아오기
	name = request.form("name")
	'name = request.querystring("name")	<- get방식
	userid = request.form("userid")
	passwd = request.form("passwd")
	email = request.form("email")
	phone = request.form("phone")
	addr = request.form("addr")

	'db open
	set dbconn = server.createobject("ADODB.Connection")
	dbconn.open "provider=sqloledb;user id=sa;password=kit2020!;initial catalog=KoreaITSite;Data Source=(local);"
	
	'넘어온 userid와 일치하는 userid를 검색
	sql ="select * from member where userid='"&userid&"'"
	  'select * from member where usrid='hongkil'에서 hongkil이 전달되는 변수임
	set rs = dbconn.execute(sql)
	
	'검색결과가 없다면 (중복되지 않았다면)
	if rs.BOF and rs.EOF then
		'중복되지 않는다면 가입
		sql = "Insert into member values ('"&name&"', '"&userid&"', '"&passwd&"', '"&email&"', '"&phone&"', default, '"&addr&"')"
		dbconn.execute(sql)
    %>
	<html>
	<br>
		<body><center><h1>🙇🏻‍♀️회원가입이 완료 되었습니다🙇🏻‍♂️</h1>
		<a href="login.asp">로그인</a> 후 사이트 이용하세요.
		</center></body></html>
<%	else	%> 
<script>
	alert("이미 사용중인 아이디입니다.");
	history.back();	//현재 페이지의 바로 이전페이지로 돌아감
	</script>
<%end if%>
