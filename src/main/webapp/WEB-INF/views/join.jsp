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
					<form action="#" method="post">
						<p style="font-size: 20px; margin-bottom: 10px;">이름</p>
						<div class="key">
							<i class="fa fa-envelope" aria-hidden="true"></i>
							<input  type="text">
							<div class="clearfix"></div>
						</div>
						<p style="font-size: 20px; margin-bottom: 10px;">아이디</p>
						<div class="key">
							<i class="fa fa-envelope" aria-hidden="true"></i>
							<input  type="text">
							<div class="clearfix"></div>
						</div>
						<p style="font-size: 20px; margin-bottom: 10px;">비밀번호</p>
						<div class="key">
							<i class="fa fa-envelope" aria-hidden="true"></i>
							<input  type="password">
							<div class="clearfix"></div>
						</div>
						<p style="font-size: 20px; margin-bottom: 10px;">비밀번호 확인</p>
						<div class="key">
							<i class="fa fa-envelope" aria-hidden="true"></i>
							<input  type="password">
							<div class="clearfix"></div>
						</div>
						<p style="font-size: 20px; margin-bottom: 10px;">닉네임</p>
						<div class="key">
							<i class="fa fa-lock" aria-hidden="true"></i>
							<input  type="text">
							<div class="clearfix"></div>
						</div>
						<p style="font-size: 20px; margin-bottom: 10px;">이메일</p>
						<div class="key">
							<i class="fa fa-envelope" aria-hidden="true"></i>
							<input  type="text">
							<div class="clearfix"></div>
						</div>
						<input type="submit" value="회원가입">
						<input type="button" value="취소" id="cancleBtn">
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
});

</script>

</body>

</html>