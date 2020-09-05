<%@Codepage = 65001%>
<% Session.Codepage = 65001%>
<% Response.Charset="utf-8"%>

<!--login_check.asp-->
<%'1.데이터 받아오기
	userid = request.form("userid")
	passwd = request.form("passwd")
  
	set dbconn = server.createobject("ADODB.Connection")
	dbconn.open "provider=sqloledb;user id=sa;password=kit2020!;initial catalog=KoreaITSite;data source=(local);"
	
   '2.넘어온 id와 db의 id와 일치하는 데이터 검색
   sql = "select * from member where userid='"&userid&"'"
   set rs = dbconn.execute(sql)
   
   '3.검색 결과가 없다면
   if rs.BOF and rs.EOF then %>
   <script>
	alert("입력한 아이디가 일치하지 않습니다.");
	location.href="member.html";
	</script>
<%	else	'검색된 id가 있다면 패스워드 비교
	if passwd = rs("pwd") then
		'4.id와 password모두 일치
		'세션변수 할당
		session("id") = rs("userid")
		session("name") = rs("name")
		response.write "로그인 성공"
		
	else%>
	<script>
		alert("비밀번호가 일치하지 않습니다.");
		history.back();	//location.href="login.asp";
	</script>
	<%end if
	end if
   %>
	