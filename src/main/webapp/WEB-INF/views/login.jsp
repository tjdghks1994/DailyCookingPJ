<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
<!-- //for-mobile-apps -->
<link href="/resources/css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="/resources/css/style.css" rel='stylesheet' type='text/css' />
</head>
<body>
<jsp:include page="include/header.jsp"></jsp:include>
	 <!--banner--> 
<div class="banner-top">
	<div class="container">
		<h3>로그인</h3>
		<div class="clearfix"> </div>
	</div>
</div>
<!--login-->

	<div class="login">
	
		<div class="main-agileits">
				<div class="form-w3agile">
					<h3>로그인</h3>
					<form action="#" method="post">
						<p style="font-size: 20px; margin-bottom: 10px;">아이디</p>
						<div class="key">
							<i class="fa fa-envelope" aria-hidden="true"></i>
							<input  type="text">
							<div class="clearfix"></div>
						</div>
						<p style="font-size: 20px; margin-bottom: 10px;">비밀번호</p>
						<div class="key">
							<i class="fa fa-lock" aria-hidden="true"></i>
							<input  type="password">
							<div class="clearfix"></div>
						</div>
						<input type="submit" value="Login">
						<div class="form-w3agile2">
							<input type="checkbox"> 로그인 상태 유지하기
						</div>
					</form>
				</div>
				
				<div class="forg">
					<a href="/idSearch" class="forg-left">아이디 찾기 </a>
					<label> / </label>
					<a href="/pwSearch" class="forg">패스워드 찾기</a>
					<a href="#" class="forg-right" id="joinLink">회원가입</a>
				<div class="clearfix"></div>
				</div>
			</div>
		</div>
              
<script>
$(function(){
	var join = $("#joinLink"); // 회원가입 a태그
	var modal = $("#myModal1"); // 모달창

	join.on("click", function(e){ // 회원가입 a태그를 클릭하면 진행
		e.preventDefault();
		modal.modal('show'); // 모달창 보이기
	});
	
	var joinCk = $("#joinCk"); // 회원가입 약관 동의 체크박스
	var joinBtn = $("#joinBtn"); // 회원가입 버튼
	
});

</script>
</body>

</html>