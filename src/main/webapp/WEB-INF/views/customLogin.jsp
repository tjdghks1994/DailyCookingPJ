<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
					<form action="/login" method="post">
						<p style="font-size: 20px; margin-bottom: 10px;">아이디</p>
						<div class="key">
							<i class="fa fa-envelope" aria-hidden="true"></i>
							<input  type="text" name="username">
							<div class="clearfix"></div>
						</div>
						<p style="font-size: 20px; margin-bottom: 10px;">비밀번호</p>
						<div class="key">
							<i class="fa fa-lock" aria-hidden="true"></i>
							<input  type="password" name="password">
							<div class="clearfix"></div>
						</div>
						<input type="submit" value="Login">
						<div class="form-w3agile2">
							<input type="checkbox" name="remember-me"> 로그인 상태 유지하기
						</div>
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
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

<c:if test="${joinResult != null }"> <!-- 회원가입 완료시 알림창 -->
	<script>
		$(function(){
			var joinResult = '${joinResult}';
			alert(joinResult);
		});
	</script>
</c:if>

<c:if test="${logout != null }"> <!-- 로그아웃 진행 시 로그아웃되었다고 알림  -->
	<script>
		$(function(){
			alert("로그아웃하였습니다");
		});
	</script>
</c:if>

<c:if test="${error != null }">
	<script>
		$(function(){
			alert("아이디 또는 비밀번호가 일치하지 않습니다. 다시 확인 바랍니다");
		});
	</script>
</c:if>

<c:if test="${searchResult != null }">
	<script>
		$(function(){
			var memberId = '${searchResult}';
			alert("회원님의 아이디 찾기 결과 : " + memberId + "입니다");
		});
	</script>
</c:if>

</body>

</html>