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
							<input  type="text" name="username" id="joinName">
							<div class="clearfix"></div>
						</div>
						<p style="font-size: 20px; margin-bottom: 10px; display: inline-block;">아이디</p>
						<span class="checkOverlap"></span>
						<div class="key">
							<i class="fa fa-envelope" aria-hidden="true"></i>
							<input  type="text" name="userid" id="joinId">
							<div class="clearfix"></div>
						</div>
						<p style="font-size: 20px; margin-bottom: 10px;">비밀번호</p>
						<div class="key">
							<i class="fa fa-envelope" aria-hidden="true"></i>
							<input  type="password" name="userpw" id="joinPw">
							<div class="clearfix"></div>
						</div>
						<p style="font-size: 20px; margin-bottom: 10px;">비밀번호 확인</p>
						<div class="key">
							<i class="fa fa-envelope" aria-hidden="true"></i>
							<input  type="password" name="userpwck" id="joinPwCk">
							<div class="clearfix"></div>
						</div>
						<p style="font-size: 20px; margin-bottom: 10px;">닉네임</p>
						<div class="key">
							<i class="fa fa-lock" aria-hidden="true"></i>
							<input  type="text" name="nickname" id="joinNickName">
							<div class="clearfix"></div>
						</div>
						<p style="font-size: 20px; margin-bottom: 10px;">이메일</p>
						<div class="key">
							<i class="fa fa-envelope" aria-hidden="true"></i>
							<input  type="text" name="usermail" id="joinEmail">
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
		var inputName = $("#joinName").val(); // 회원이 입력한 이름 값 저장
		var inputId = $("#joinId").val(); // 회원이 입력한 아이디 값 저장
		var inputPw = $("#joinPw").val(); // 회원이 입력한 패스워드 값 저장
		var inputPwCk = $("#joinPwCk").val(); // 회원이 입력한 패스워드 확인 값 저장
		var inputNick = $("#joinNickName").val(); // 회원이 입력한 닉네임 값 저장
		var inputEmail = $("#joinEmail").val(); // 회원이 입력한 메일 값 저장
		var nameRegEx = /^[가-힣]+$/; // 이름 정규표현식은 한글만 가능
		// 이메일 정규표현식
		var emailRegEx = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		// 비밀번호 정규표현식 - 6~20자리의 영문 대소문자여야 하며 최소 1개의 숫자나 특수문자를 포함해야함
		var pwRegEx = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/;
		
		if(inputName.length < 1){ // 이름을 입력하지 않았으면
			alert("이름을 입력하세요");
			$("#joinName").focus();
		} else if(!(nameRegEx.test(inputName))){ // 이름 정규표현식에 맞게 입력하지 않으면
			$("#joinName").val(""); // 이름 입력 란 값 초기화
			alert("이름은 한글만 작성가능합니다");
			$("#joinName").focus();
		} else if(inputId.length < 1){ // 아이디를 입력하지 않았으면
			alert("아이디를 입력하세요");
			idCheck = false;
			$("#joinId").focus();
		} else if(inputId.length < 5 || inputId.length > 15) {
			alert("아이디는 5~15자 까지만 입력가능 합니다.");
			$("#joinId").val("");
			$("#joinId").focus();
		} else if(idCheck == false) { // 아이디 정규표현식에 맞지않게 입력하지 않으면
			alert("아이디는 영어 소문자로 시작하는 5~15자 영문 또는 숫자만 입력하세요");
			$("#joinId").val("");
			$("#joinId").focus();
		} else if(!(pwRegEx.test(inputPw))){ // 비밀번호 정규표현식에 맞게 입력하지 않으면
			$("#joinPw").val(""); // 비밀번호 입력 란 값 초기화
			alert("비밀번호는 6~20자리의 영문 대소문자여야 하며 최소 1개의 숫자나 특수문자를 포함해야됩니다 다시입력해주세요!");
			$("#joinPw").focus();
		} else if(!(pwRegEx.test(inputPwCk))){ // 비밀번호 정규표현식에 맞게 입력하지 않으면
			$("#joinPwCk").val(""); // 비밀번호 확인란 값 초기화
			alert("비밀번호 확인란은 6~20자리의 영문 대소문자여야 하며 최소 1개의 숫자나 특수문자를 포함해야됩니다 다시입력해주세요!");
			$("#joinPwCk").focus();
		} else if(inputPw != inputPwCk) { // 비밀번호와 비밀번호 확인란 값이 다르면
			$("#joinPwCk").val(""); // 비밀번호 확인란 값 초기화
			alert("비밀번호와 비밀번호 확인란이 동일하지 않습니다 다시 입력해주세요");
			$("#joinPwCk").focus();
		} else if(inputNick.length < 1) { // 닉네임을 입력하지 않았으면
			alert("닉네임을 입력해주세요");
			$("#joinNickName").focus();
		} else if(!(emailRegEx.test(inputEmail))){ // 이메일 정규표현식에 맞게 입력하지 않으면 
			$("#joinEmail").val(""); // 이메일 입력 란 값 초기화
			alert("이메일 형식대로 입력하세요 ex) xxx.naver.com ");
			$("#joinEmail").focus();
		} else if(checkOverlap == false){ // 아이디가 중복된 경우
			$("#joinId").val(""); // 아이디 입력 란 값 초기화
			alert("중복된 아이디 입니다 다시입력해주세요");
			$("#joinId").focus();
		} else { // 전부 만족했을 때 폼 전송 - 회원가입
			formJoin.submit();
		} 
	}); // END 회원가입 버튼 클릭시 진행 되는 함수 
	
	var idCheck = false; // 아이디 정규표현식 체크 값
	var idRegEx =  /^[a-z]{1}[a-z0-9]{4,14}$/; // 아이디는 영어 소문자로 시작하는 5~15자 영문 또는 숫자
	var checkOverlap = false; // 아이디 중복 체크 - 중복이면 false 중복이 아니면 true
	var inputIdTag = $("#joinId"); // 아이디 입력 태그
	
	inputIdTag.on("keyup", function(){ // 회원가입 시 아이디값 입력시 진행
		var value = $(this).val(); // 아이디 입력 태그의 값 저장
		
		if($("#joinId").val().length > 4 ){ // 5자리 이상의 아이디를 입력했을경우 진행
			
			$.get("/userid", // 아이디 중복확인 ajax로 처리
					{userid:value},
					function(data){ // data - 서버에서 전송된 값
						if(idRegEx.test(value)){ // 아이디 정규표현식에 맞게 입력하였다면
							if(data == 'yes'){
								$(".checkOverlap").html("사용가능한 아이디입니다");
								$(".checkOverlap").css("color","lightgreen");
								checkOverlap = true; // 아이디 중복 체크 값을 true로 변경
								idCheck = true; // 아이디 정규표현식 체크 값을 true로 변경
							} else if(data == 'no'){ 
								$(".checkOverlap").html("중복된 아이디입니다");
								$(".checkOverlap").css("color","red");
								checkOverlap = false; // 아이디 중복 체크 값을 false로 변경
								idCheck = true; // 아이디 정규표현식 체크 값을 true로 변경
							}
						} else { // 아이디 정규표현식에 맞지 않게 입력하였다면
							$(".checkOverlap").html("영어 소문자로 시작하는 5~15자 영문 또는 숫자만 입력하세요");
							$(".checkOverlap").css("color","red");
							$(".checkOverlap").css("font-size","10px");
							idCheck = false; // 아이디 정규표현식 체크 값을 false로 변경
						}
						 
					},
					"html"
				);	
		}

	}); // END 회원가입 시 아이디값 입력시 진행되는 함수
	
	
});

</script>

</body>

</html>