<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 회원정보</title>
<!-- //for-mobile-apps -->
<link href="/resources/css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="/resources/css/style.css" rel='stylesheet' type='text/css' />
</head>
<body>
<jsp:include page="../include/header.jsp"></jsp:include>
	 <!--banner--> 
<div class="banner-top">
	<div class="container">
		<h3>마이페이지</h3>
		<div class="forg2">
					<a href="/myPageInfo" class="forg2-left active">회원 정보</a>
					<a href="/myPageBoard" class="forg2-left">스크랩/작성 게시물</a>
					<a href="/myPageComment" class="forg2-left" id="joinLink">작성 댓글/관리자 문의 목록</a>
				<div class="clearfix"></div>
		</div>
		<div class="clearfix"> </div>
	</div>
</div>

<div class="login">
		<div class="main-agileits">
				<div class="form-w3agile">
					<h3>회원 정보</h3>
					<form action="/myPage/infoChange" method="post" id="infoForm">
						<p style="font-size: 20px; margin-bottom: 10px;">이름</p>
						<div class="key">
							<i class="fa fa-envelope" aria-hidden="true"></i>
							<input  type="text" value="${memberInfo.username }" name="username" readonly="readonly">
							<div class="clearfix"></div>
						</div>
						<p style="font-size: 20px; margin-bottom: 10px;">아이디</p>
						<div class="key">
							<i class="fa fa-envelope" aria-hidden="true"></i>
							<input  type="text" value="${memberInfo.userid }" name="userid" readonly="readonly">
							<div class="clearfix"></div>
						</div>
						<p style="font-size: 20px; margin-bottom: 10px;">닉네임</p>
						<div class="key">
							<i class="fa fa-envelope" aria-hidden="true"></i>
							<input  type="text" value="${memberInfo.nickname }" name="nickname">
							<div class="clearfix"></div>
						</div>
						<p style="font-size: 20px; margin-bottom: 10px;">이메일</p>
						<div class="key">
							<i class="fa fa-envelope" aria-hidden="true"></i>
							<input  type="text" value="${memberInfo.usermail }" name="usermail">
							<div class="clearfix"></div>
						</div>
						<!-- <input type="button" value="정보 수정 하기">
						<input type="button" value="비밀번호 변경">
						<input type="button" value="회원 탈퇴 하기"> -->
						<div style="text-align: center;">
						<button class="btn btn-info" style="margin-right: 8px;" id="infoChange">정보 수정 하기</button>
						<button class="btn btn-primary" style="margin-right: 8px;" id="pwChange">비밀번호 변경</button>
						<button class="btn btn-danger" id="delInfo">회원 탈퇴 하기</button>
						</div>
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
					</form>
				</div>
			</div>
		</div>
		
		<!-- 비밀번호 변경 모달 창 -->
              <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                      <div class="modal-content">
                          <div class="modal-header">
                              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                              <h3 class="modal-title" id="myModalLabel">비밀번호 변경</h3>
                          </div>
                          <div class="modal-body">
                        		<form><div class="form-group">
						            <label>현재 비밀번호</label>
						            <input class="form-control">
						          </div>
						          <div class="form-group">
						            <label>새 비밀번호</label>
						            <input class="form-control">
						          </div>
						          <div class="form-group">
						            <label>비밀번호 확인</label>
						            <input class="form-control">
						          </div>
						        </form>
                          </div>
                          <div class="modal-footer">
                              <button type="button" class="btn btn-primary">비밀번호 변경</button>
                              <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                          </div>
                      </div>
                      <!-- /.modal-content -->
                  </div>
                  <!-- /.modal-dialog -->
              </div>
              <!-- END 비밀번호 변경 모달 창  -->
              
              <!-- 회원탈퇴  모달 창 -->
              <div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                      <div class="modal-content">
                          <div class="modal-header" style="text-align: center;">
                              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                              <h3 class="modal-title" id="myModalLabel">회원 탈퇴시 아래의 조치가 취해집니다</h3>
                          </div>
                          <div class="modal-body">
                        		<ul class="modal-ul">
                        			<li>회원 탈퇴 일로부터 계정과 모든 개인 정보는 완전히 삭제되며 더 이상 복구할 수 없게 됩니다.</li>
                        			<li>작성된 게시물은 삭제되지 않으며, 익명처리 후 Daily Cooking 소유권이 귀속됩니다.</li>
                        			<li>게시물 삭제가 필요한 경우에는 관리자(admin@naver.com)로 문의해 주시기 바랍니다.</li>
                        		</ul>
                          </div>
                          <div class="modal-footer">
                              <button type="button" class="btn btn-danger">예, 탈퇴하겠습니다</button>
                              <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                          </div>
                      </div>
                      <!-- /.modal-content -->
                  </div>
                  <!-- /.modal-dialog -->
              </div>
              <!-- END 회원탈퇴 모달 창  -->
              
<script>
$(function(){
	var pwChange = $("#pwChange"); // 비밀번호 변경 버튼
	var delInfo = $("#delInfo"); // 회원탈퇴 버튼
	var infoChange = $("#infoChange"); // 정보변경 버튼
	var modal2 = $("#myModal2"); // 패스워드 변경 모달
	var modal3 = $("#myModal3"); // 회원탈퇴 모달 
	
	infoChange.on("click",function(e){
		e.preventDefault();
		var changeAnswer = confirm("입력한 값으로 정보를 변경하시겠습니까?");
		var emailRegEx = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		var usermail = $("input[name='usermail']").val();
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		
		if(changeAnswer){
			
		 	if($("input[name='nickname']").length < 1) { // 닉네임을 입력하지 않았으면
				alert("닉네임을 입력해주세요");
				$("input[name='nickname']").focus();
			} else if(!(emailRegEx.test(usermail))){ // 이메일 정규표현식에 맞게 입력하지 않으면 
				$("input[name='usermail']").val(""); // 이메일 입력 란 값 초기화
				alert("이메일 형식대로 입력하세요 ex) xxxxx@naver.com ");
				$("input[name='usermail']").focus();
			} else {
				var infoChange = {
						username : $("input[name='username']").val(), userid : $("input[name='userid']").val(),
						nickname : $("input[name='nickname']").val(), usermail : $("input[name='usermail']").val()
				}
					$.ajax({
						url : '/myPage/infoChange',
						data : infoChange,
						type : 'post',
						beforeSend : function(xhr)
				           {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				              xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				           },
						success : function(result){
							alert("회원 정보를 수정하였습니다.");
						}
					}); //END ajax()
			} // END else{}
		} // END if(changeAnswer)
	});
	
	pwChange.on("click", function(e){ // 패스워드 변경 버튼 클릭시 진행
		e.preventDefault();
		modal2.modal("show");
	});
	
	delInfo.on("click", function(e){ // 회원탈퇴 버튼 클릭시 진행
		e.preventDefault();
		modal3.modal("show");
	});
		
	
		
	
});

</script>

</body>
</html>