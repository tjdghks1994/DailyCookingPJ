<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
					<a href="#" class="forg2-left active">회원 정보</a>
					<form action="/myPage/scrapList" method="get" id="scrapForm">
						<a href="#" class="forg2-left" id="myPageScrapTag">스크랩 게시물</a>
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
						<sec:authentication property="principal" var="principal"/>
						<input type="hidden" name="userid" value="${principal.username }">
						<input type="hidden" name="pageNum" value="1">
					    <input type="hidden" name="amount" value="10">
					</form>
					<form action="/myPage/boardList" method="get" id="boardForm">
						<a href="#" class="forg2-left" id="myPageBoardTag">작성 게시물</a>
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
						<sec:authentication property="principal" var="principal"/>
						<input type="hidden" name="userid" value="${principal.username }">
						<input type="hidden" name="pageNum" value="1">
					    <input type="hidden" name="amount" value="10">
					</form>
					<form action="/myPage/replyList" method="get" id="replyForm">
						<a href="#" class="forg2-left" id="myPageReplyTag">작성 댓글 목록</a>
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
						<sec:authentication property="principal" var="principal"/>
						<input type="hidden" name="userid" value="${principal.username }">
						<input type="hidden" name="pageNum" value="1">
					    <input type="hidden" name="amount" value="10">
					</form>
					<form action="/myPage/questionList" method="get" id="questionForm">
						<a href="#" class="forg2-left" id="myPageQuestionTag">문의 / 건의 목록</a>
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
						<sec:authentication property="principal" var="principal"/>
						<input type="hidden" name="userid" value="${principal.username }">
						<input type="hidden" name="pageNum" value="1">
					    <input type="hidden" name="amount" value="10">
					</form>
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
                        		<form>
						          <div class="form-group">
						            <label>새 비밀번호</label>
						            <input class="form-control" type="password" id="newPw" name="userpw">
						          </div>
						          <div class="form-group">
						            <label>새 비밀번호 확인</label>
						            <input class="form-control" type="password" id="newPwCk">
						          </div>
						        </form>
                          </div>
                          <div class="modal-footer">
                              <button type="button" class="btn btn-primary" id="changePwBtn">비밀번호 변경</button>
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
                        			<li>작성된 게시물, 댓글 등 전부 삭제 처리 됩니다.</li>
                        		</ul>
                          </div>
                          <div class="modal-footer">
                              <button type="button" class="btn btn-danger" id="deleteMemberBtn">예, 탈퇴하겠습니다</button>
                              <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                          </div>
                      </div>
                      <!-- /.modal-content -->
                  </div>
                  <!-- /.modal-dialog -->
              </div>
              <!-- END 회원탈퇴 모달 창  -->
            
            <form action="/customLogout" method="post" style="display: inline;" class="logoutProc"> <!-- 비밀번호 변경, 회원 탈퇴 시 로그아웃처리를 위한 form  -->
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">
			</form>

<script>
$(function(){
	var pwChange = $("#pwChange"); // 비밀번호 변경 버튼
	var delInfo = $("#delInfo"); // 회원탈퇴 버튼
	var infoChange = $("#infoChange"); // 정보변경 버튼
	var modal2 = $("#myModal2"); // 패스워드 변경 모달
	var modal3 = $("#myModal3"); // 회원탈퇴 모달 
	
	infoChange.on("click",function(e){ // 정보 변경 버튼 클릭 시 진행
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
		
	var memId = null; // 회원 아이디 변수
	
	
	$("#changePwBtn").on("click", function(e){ // 비밀번호 변경 클릭 시 진행
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		
		<sec:authorize access="isAuthenticated()">
		
		memId = '<sec:authentication property="principal.username"/>'; //회원 아이디 가져오기
		
		</sec:authorize>
		
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
				url : '/myPage/pwChange',
				data :{ userid : memId , userpw : newPw },
				type : 'post',
				beforeSend : function(xhr)
		           {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
		              xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		           },
				success : function(result){
					if(result == 'changeOk'){
						alert('비밀번호가 수정되었습니다. 새 비밀번호로 다시 로그인 바랍니다.');
						modal2.modal("hide");
						$(".logoutProc").submit();
					}
				}
			}); //END ajax()
		}
	}); // END 비밀번호 변경
		
	$("#deleteMemberBtn").on("click",function(e){ // 예, 탈퇴하겠습니다 버튼 클릭 시 진행
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		
		<sec:authorize access="isAuthenticated()">
		
		memId = '<sec:authentication property="principal.username"/>'; //회원 아이디 가져오기
		
		</sec:authorize>
		
		$.ajax({
			url : '/myPage/removeMember',
			data :{ userid : memId },
			type : 'post',
			beforeSend : function(xhr)
	           {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
	              xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	           },
			success : function(result){
				if(result == 'removeOk'){
					alert('회원이 정상적으로 탈퇴 되었습니다. 자동으로 로그아웃 됩니다.');
					modal3.modal("hide");
					$(".logoutProc").submit();
				}
			}
		}); //END ajax()
	}); // END deleteMemberBtn click()
	
	$("#myPageScrapTag").on("click",function(e){ // 스크랩 게시물 태그 클릭 시 진행
		e.preventDefault();
	
		var form = $("#scrapForm");
		form.submit();
	});
	
	$("#myPageBoardTag").on("click",function(e){
		e.preventDefault();
		
		$("#boardForm").submit();
	});
	
	$("#myPageReplyTag").on("click",function(e){
		e.preventDefault();
		
		$("#replyForm").submit();
	});
	
	$("#myPageQuestionTag").on("click",function(e){
		e.preventDefault();
		
		$("#questionForm").submit();
	});
});

</script>

</body>
</html>