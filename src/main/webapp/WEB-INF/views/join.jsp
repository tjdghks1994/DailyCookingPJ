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
						<p style="font-size: 20px; margin-bottom: 10px; display: inline-block;">아이디</p>
						<span class="checkOverlap"></span>
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
	
	var formJoin = $("#joinForm"); // 회원가입 폼태그
	var joinButton = $("#joinButton"); // 회원가입 버튼 태그
	
	joinButton.on("click",function(e){ // 회원가입 버튼 클릭시 진행 - 정규표현식 처리 할것
		var inputName = $("input[name='username']").val(); // 회원이 입력한 이름 값 저장
		var inputId = $("input[name='userid']").val(); // 회원이 입력한 아이디 값 저장
		var inputPw = $("input[name='userpw']").val(); // 회원이 입력한 패스워드 값 저장
		var inputPwCk = $("input[name='userpwck']").val(); // 회원이 입력한 패스워드 확인 값 저장
		var inputNick = $("input[name='nickname']").val(); // 회원이 입력한 닉네임 값 저장
		var inputEmail = $("input[name='usermail']").val(); // 회원이 입력한 메일 값 저장
		
		if(checkOverlap == false){
			alert("아이디가 중복되었습니다");
		} else {
			formJoin.submit();
		}
		
		
	});
	
	
	var checkOverlap = false; // 아이디 중복 체크 - 중복이면 false 중복이 아니면 true
	var inputNameTag = $("input[name='userid']"); // 아이디 입력 태그
	
	inputNameTag.on("keyup", function(){ // 회원가입 시 아이디값 입력시 진행
		var value = $(this).val(); // 아이디 입력 태그의 값 저장
		
		$.get("/userid", // 아이디 중복확인 ajax로 처리
			{userid:value},
			function(data){ // data - 서버에서 전송된 값
				if(data == 'yes'){ 
					$(".checkOverlap").html("사용가능한 아이디입니다");
					$(".checkOverlap").css("color","lightgreen");
					checkOverlap = true;
				} else if(data == 'no'){
					$(".checkOverlap").html("중복된 아이디입니다");
					$(".checkOverlap").css("color","red");
					checkOverlap = false;
				}
			},
			"html"
		);
		
	});
	
	
});

</script>

</body>

</html>