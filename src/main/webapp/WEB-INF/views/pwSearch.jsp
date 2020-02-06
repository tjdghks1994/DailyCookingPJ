<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패스워드 찾기 페이지</title>
<!-- //for-mobile-apps -->
<link href="/resources/css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="/resources/css/style.css" rel='stylesheet' type='text/css' />
</head>
<jsp:include page="include/header.jsp"></jsp:include>
<body>
<div class="banner-top">
	<div class="container">
		<h3>패스워드 찾기</h3>
		<div class="clearfix"> </div>
	</div>
</div>
		<div class="login">
			<div class="main-agileits">
				<div class="form-w3agile">
					<h3>패스워드 찾기</h3>
					<form action="/pwSearch" method="post">
						<p style="font-size: 20px; margin-bottom: 10px;">이름</p>
						<div class="key">
							<i class="fa fa-envelope" aria-hidden="true"></i>
							<input  type="text" name="username">
							<div class="clearfix"></div>
						</div>
						<p style="font-size: 20px; margin-bottom: 10px;">아이디</p>
						<div class="key">
							<i class="fa fa-envelope" aria-hidden="true"></i>
							<input  type="text" name="userid">
							<div class="clearfix"></div>
						</div>
						<p style="font-size: 20px; margin-bottom: 10px;">이메일</p>
						<div class="key">
							<i class="fa fa-envelope" aria-hidden="true"></i>
							<input  type="text" name="usermail">
							<div class="clearfix"></div>
						</div>
						<input type="submit" value="찾기" id="searchBtn">
						<input type="button" value="취소" id="cancleBtn">
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
					</form>
				</div>
			</div>
		</div>
		
		<!-- 비밀번호 변경 모달 창 -->
              <div class="modal fade" id="myModal13" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                      <div class="modal-content">
                          <div class="modal-header">
                              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                              <h3 class="modal-title" id="myModalLabel">비밀번호 변경</h3>
                          </div>
                          <div class="modal-body">
                        		<form action="/pwChange" id="pwChangeForm" method="post">
						          <div class="form-group">
						            <label>새 비밀번호</label>
						            <input class="form-control" name="userpw" type="password">
						          </div>
						          <div class="form-group">
						            <label>비밀번호 확인</label>
						            <input class="form-control" type="password" name="userpwck">
						          </div>
						          <input type="hidden" value="${memId }" name="userid">
						          <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
						        </form>
                          </div>
                          <div class="modal-footer">
                              <button type="button" class="btn btn-primary" id="pwChangeBtn">비밀번호 변경</button>
                              <button type="button" class="btn btn-default" id="modalCloseBtn" data-dismiss="modal">닫기</button>
                          </div>
                      </div>
                      <!-- /.modal-content -->
                  </div>
                  <!-- /.modal-dialog -->
              </div>
              <!-- END 비밀번호 변경 모달 창  -->
              
<script>
$(function(){
	var cancle = $("#cancleBtn"); // 취소 버튼
	cancle.on("click", function(e){
		e.preventDefault();
		location.href="/customLogin";
	});
});

</script>

<c:if test="${pwSearchResult == 'notMatch' }">
	<script>
		$(function(){
			alert("입력하신 정보에 해당하는 회원이 존재하지않아 비밀번호 찾기에 실패하였습니다");
		});
	</script>
</c:if>

<c:if test="${pwSearchResult == 'match' }">
	<script>
		$(function(){
			var modal13 = $("#myModal13"); // 비밀번호 변경 모달 창
			var memId = '${memId}'; // 회원 아이디 값 저장 변수
			// 비밀번호 정규표현식 - 6~20자리의 영문 대소문자여야 하며 최소 1개의 숫자나 특수문자를 포함해야함
			var pwRegEx = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/;
			
			modal13.modal("show");
			
			$("#pwChangeBtn").on("click",function(e){ // 비밀번호 변경 버튼 클릭 시 진행
				var pwInput = $("input[name='userpw']").val(); // 회원이 입력한 패스워드 값 저장
				var pwCkInput = $("input[name='userpwck']").val(); // 회원이 입력한 패스워드 확인 값 저장
				
				if(!(pwRegEx.test(pwInput))){ // 비밀번호 정규표현식에 맞게 입력하지 않으면
					$("input[name='userpw']").val(""); // 비밀번호 입력 란 값 초기화
					alert("비밀번호는 6~20자리의 영문 대소문자여야 하며 최소 1개의 숫자나 특수문자를 포함해야됩니다 다시입력해주세요!");
					$("input[name='userpw']").focus();
				} else if(!(pwRegEx.test(pwCkInput))){ // 비밀번호 정규표현식에 맞게 입력하지 않으면
					$("input[name='userpwck']").val(""); // 비밀번호 확인란 값 초기화
					alert("비밀번호 확인란은 6~20자리의 영문 대소문자여야 하며 최소 1개의 숫자나 특수문자를 포함해야됩니다 다시입력해주세요!");
					$("input[name='userpwck']").focus();
				} else if(pwInput != pwCkInput) { // 비밀번호와 비밀번호 확인란 값이 다르면
					$("input[name='userpwck']").val(""); // 비밀번호 확인란 값 초기화
					alert("비밀번호와 비밀번호 확인란이 동일하지 않습니다 다시 입력해주세요");
					$("input[name='userpwck']").focus();
				} else { // 전부 제대로 입력이 되었다면 진행
					$("#pwChangeForm").submit(); // 폼 전송
				}
				
			});
		});
	</script>
</c:if>

<c:if test="${pwChangeResult == 'notChange' }">
	<script>
		$(function(){
			alert("비밀번호 변경에 실패하였습니다. 다시 시도해주세요");
		});
	</script>
</c:if>




</body>
</html>