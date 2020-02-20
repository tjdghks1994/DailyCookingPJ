<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지 - 관리자정보</title>
<!-- //for-mobile-apps -->
<link href="/resources/css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="/resources/css/style.css" rel='stylesheet' type='text/css' />
</head>
<body>
<jsp:include page="adminBar.jsp"></jsp:include>


<div class="bs-docs-example" style="position: relative; left: 10px; top: 30px; display: inline-block; width: 75%;">
	<span style="margin-left: 20px; font-weight: bold; font-size: 20px;">관리자 정보 
	<span style="color: lightgray; font-weight: bold; font-size: 15px;">(정보를 수정하기 버튼을 누르면 바로 정보가 수정됩니다)</span> </span>
	<div style="margin-bottom: 20px;">
	</div>
	
	
	<div>
		<div class="main-agileits2">
			<div class="form-w3agile">
		
					<p style="font-size: 15px; margin-bottom: 10px; font-weight: bold;">이름</p>
					<div class="key">
						<input  type="text" name="username" value="${adminInfo.username }">
						<div class="clearfix"></div>
					</div>
					<span style="font-size: 15px; margin-bottom: 10px; font-weight: bold;">아이디</span>
					<span style="color: lightgray; font-weight: bold; font-size: 15px;">(아이디는 수정이 불가능합니다)</span> 
					<div class="key">
						<input  type="text" name="userid" value="${adminInfo.userid }" readonly="readonly">
						<div class="clearfix"></div>
					</div>
					<p style="font-size: 15px; margin-bottom: 10px; font-weight: bold;">닉네임</p>
					<div class="key">
						<input  type="text" name="nickname" value="${adminInfo.nickname }">
						<div class="clearfix"></div>
					</div>
					<p style="font-size: 15px; margin-bottom: 10px; font-weight: bold;">이메일</p>
					<div class="key">
						<input  type="text" name="usermail" value="${adminInfo.usermail }">
						<div class="clearfix"></div>
					</div>
					<div style="text-align: center;">
						<button class="btn btn-info" id="infoChange" style="margin-right: 8px;">정보 수정 하기</button>
						<button class="btn btn-primary" style="margin-right: 8px;" id="pwChange">비밀번호 변경</button>
					</div>

			</div>
		</div>
	</div>
			<form action="/admin/info" id="completeChange">
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
			</form>
	
	
			<!-- 비밀번호 변경 모달 창 -->
              <div class="modal fade" id="myModal11" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                      <div class="modal-content">
                          <div class="modal-header">
                              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                              <h3 class="modal-title" id="myModalLabel">비밀번호 변경</h3>
                          </div>
                          <div class="modal-body">
                        		<form>
						          <div class="form-group">
						            <label>새 비밀번호</label>
						            <input class="form-control" type="password" name="userpw" id="newPw">
						          </div>
						          <div class="form-group">
						            <label>비밀번호 확인</label>
						            <input class="form-control" type="password" id="newPwCk">
						          </div>
						        </form>
                          </div>
                          <div class="modal-footer">
                              <button type="button" class="btn btn-primary" id="changePw">비밀번호 변경</button>
                              <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                          </div>
                      </div>
                      <!-- /.modal-content -->
                  </div>
                  <!-- /.modal-dialog -->
              </div>
              <!-- END 비밀번호 변경 모달 창  -->
</div>

<script>
$(function(){
	var pwChange = $("#pwChange");
	var modal11 = $("#myModal11"); // 패스워드 변경 모달
	
	pwChange.on("click", function(e){ // 패스워드 변경 버튼 클릭시 진행
		e.preventDefault();
		modal11.modal("show");
	});
	
	$("#changePw").on("click",function(e){
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		
		e.preventDefault();
		
		var newPw = $("#newPw").val(); // 새 비밀번호 값
		var newPwCk = $("#newPwCk").val(); // 새 비밀번호 확인란 값
		// 비밀번호 정규표현식 - 6~20자리의 영문 대소문자여야 하며 최소 1개의 숫자나 특수문자를 포함해야함
		var pwRegEx = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/;
		
		if(!(pwRegEx.test(newPw))){ // 비밀번호 정규표현식에 맞게 입력하지 않으면
			$("#newPw").val(""); // 비밀번호 입력 란 값 초기화
			alert("비밀번호는 6~20자리의 영문 대소문자여야 하며 최소 1개의 숫자나 특수문자를 포함해야됩니다 다시입력해주세요!");
			$("#newPw").focus();
		} else if(!(pwRegEx.test(newPwCk))){ // 비밀번호 정규표현식에 맞게 입력하지 않으면
			$("#newPwCk").val(""); // 비밀번호 확인란 값 초기화
			alert("비밀번호 확인란은 6~20자리의 영문 대소문자여야 하며 최소 1개의 숫자나 특수문자를 포함해야됩니다 다시입력해주세요!");
			$("#newPwCk").focus();
		} else if(newPw != newPwCk) { // 비밀번호와 비밀번호 확인란 값이 다르면
			$("#newPwCk").val(""); // 비밀번호 확인란 값 초기화
			alert("비밀번호와 비밀번호 확인란이 동일하지 않습니다 다시 입력해주세요");
			$("#newPwCk").focus();
		} else {
			$.ajax({
				url : '/admin/adminPwChange',
				data :{ userid : 'admin' , userpw : newPw },
				type : 'post',
				beforeSend : function(xhr)
		           {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
		              xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		           },
				success : function(result){
					if(result == 'changeOk'){
						alert('비밀번호가 수정되었습니다');
						modal11.modal("hide");
						}
					}
				});//END ajax()
			} // End esle()
	}); // END changePw
	
	$("#infoChange").on("click",function(e){
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		
		var nameRegEx = /^[가-힣]+$/; // 이름 정규표현식은 한글만 가능
		var emailRegEx = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		var usermail = $("input[name='usermail']").val();
		var inputName = $("input[name='username']").val();
		var inputNick = $("input[name='nickname']").val();
		
		if(inputName.length < 1){
			alert("이름을 입력해주세요");
			$("input[name='username']").focus();
		} else if(!(nameRegEx.test(inputName))){
			alert("이름은 한글만 입력 가능합니다");
			$("input[name='username']").focus();
		} else if(inputNick.length < 1) { // 닉네임을 입력하지 않았으면
			alert("닉네임을 입력해주세요");
			$("input[name='nickname']").focus();
		} else if(usermail.length < 1){
			alert("이메일을 입력해주세요");
			$("input[name='usermail']").focus();
		} else if(!(emailRegEx.test(usermail))){ // 이메일 정규표현식에 맞게 입력하지 않으면 
			$("input[name='usermail']").val(""); // 이메일 입력 란 값 초기화
			alert("이메일 형식대로 입력하세요 ex) xxxxx@naver.com ");
			$("input[name='usermail']").focus();
		} else {
			$.ajax({
				url : '/admin/infoChangeAdmin',
				data : {userid : 'admin', username : $("input[name='username']").val(), nickname : $("input[name='nickname']").val(),
						usermail : $("input[name='usermail']").val()},
				type : 'post',
				beforeSend : function(xhr)
		           {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
		              xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		           },
				success : function(result){
					if(result == 'ok'){
						alert("정보가 수정되었습니다");
						$("#completeChange").submit();
						}
					}
				}); // End ajax()
		} // END else
	})
});

</script>
</body>
</html>