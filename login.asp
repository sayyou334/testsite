<%@Codepage = 65001%>
<% Session.Codepage = 65001%>
<% Response.Charset="utf-8"%>

<!--login.asp-->

<!DOCTYPE html>
<html>
	<head>
	<meta charset="utf-8">
	<script>
		function sendit()
		{
			if(document.myform.userid.value=="")
			{
				alert("아이디를 입력하세요");
				return false;
			}
			if(document.myform.passwd.value=="")
			{
				alert("비밀번호를 입력하세요");
				return false;
			}
			
			document.myform.submit();
		}
	</script>
	</head>
	
	<body>
	<center>
	<br>
	<h2>🌼회원 로그인🌼</h2>
	<hr>
	<form name="myform" action="login_check.asp" method="post">
	<table border="1" width="350" height="120" cellpadding="10" cellspacing="0">
	<tr>
	<th bgcolor="#373161"><font color="white">UserID
	<td><input type="text" name="userid">
	<tr>
	<th bgcolor="#373161"><font color="white">Password
	<td><input type="password" name="passwd">
	<tr>
	<th colspan="2" bgcolor="#8E89B2">
	<input type="button" value="Login" onclick="sendit();">
	<input type="button" value="Cancel" onclick="reset();">
	</table></form>	
	</body>
</html>