<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<!-- //for-mobile-apps -->
<link href="/resources/css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="/resources/css/style.css" rel='stylesheet' type='text/css' />
<script src="/resources/js/jquery-1.11.1.min.js"></script>
</head>
<jsp:include page="include/header.jsp"></jsp:include>
<body>
<div class="banner-top">
	<div class="container">
		<h3>회원 가입</h3>
		<div class="clearfix"> </div>
	</div>
</div>

	<div class="login">
			<div class="main-agileits">
				<div class="form-w3agile">
					<h3>회원 가입</h3>
					<form action="/join" method="post" id="joinForm">
						<p style="font-size: 20px; margin-bottom: 10px;">이름</p>
						<div class="key">
							<i class="fa fa-envelope" aria-hidden="true"></i>
							<input  type="text" name="username">
							<div class="clearfix"></div>
						</div>
						<p style="font-size: 20px; margin-bottom: 10px;">아이디</p>
						<div class="key">
							<i class="fa fa-envelope" aria-hidden="true"></i>
							<input  type="text" name="userid" id="userid">
							<div class="clearfix"></div>
						</div>
						<p style="font-size: 20px; margin-bottom: 10px;">비밀번호</p>
						<div class="key">
							<i class="fa fa-envelope" aria-hidden="true"></i>
							<input  type="password" name="userpw">
							<div class="clearfix"></div>
						</div>
						<p style="font-size: 20px; margin-bottom: 10px;">비밀번호 확인</p>
						<div class="key">
							<i class="fa fa-envelope" aria-hidden="true"></i>
							<input  type="password" name="userpwck">
							<div class="clearfix"></div>
						</div>
						<p style="font-size: 20px; margin-bottom: 10px;">닉네임</p>
						<div class="key">
							<i class="fa fa-lock" aria-hidden="true"></i>
							<input  type="text" name="nickname">
							<div class="clearfix"></div>
						</div>
						<p style="font-size: 20px; margin-bottom: 10px;">이메일</p>
						<div class="key">
							<i class="fa fa-envelope" aria-hidden="true"></i>
							<input  type="text" name="usermail">
							<div class="clearfix"></div>
						</div>
						<input type="button" value="회원가입" id="joinButton" style="background: #fdb515;">
						<input type="button" value="취소" id="cancleBtn">
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
					</form>
				</div>
			</div>
		</div>
<script>
$(function(){
	
	var cancle = $("#cancleBtn");
	cancle.on("click", function(e){
		e.preventDefault();
		history.back();
	});
	
	var formJoin = $("#joinForm");
	var joinButton = $("#joinButton");
	
	joinButton.on("click",function(e){
		formJoin.submit();
	});
});

</script>

</body>

</html>