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
	<span style="color: lightgray; font-weight: normal; font-size: 15px;">(정보를 수정하기 버튼을 누르면 바로 정보가 수정됩니다)</span> </span>
	<div style="margin-bottom: 20px;">
	</div>
	
	
	<div>
		<div class="main-agileits2">
			<div class="form-w3agile">
				<form action="">
					<p style="font-size: 15px; margin-bottom: 10px; font-weight: bold;">이름</p>
					<div class="key">
						<input  type="text" value="관리자 이름">
						<div class="clearfix"></div>
					</div>
					<p style="font-size: 15px; margin-bottom: 10px; font-weight: bold;">아이디</p>
					<div class="key">
						<input  type="text" value="admin" readonly="readonly">
						<div class="clearfix"></div>
					</div>
					<p style="font-size: 15px; margin-bottom: 10px; font-weight: bold;">닉네임</p>
					<div class="key">
						<input  type="text" value="관리자">
						<div class="clearfix"></div>
					</div>
					<p style="font-size: 15px; margin-bottom: 10px; font-weight: bold;">이메일</p>
					<div class="key">
						<input  type="text" value="admin@naver.com">
						<div class="clearfix"></div>
					</div>
					<div style="text-align: center;">
						<button class="btn btn-info" style="margin-right: 8px;">정보 수정 하기</button>
						<button class="btn btn-primary" style="margin-right: 8px;" id="pwChange">비밀번호 변경</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
			<!-- 비밀번호 변경 모달 창 -->
              <div class="modal fade" id="myModal11" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
</div>

<script>
$(function(){
	var pwChange = $("#pwChange");
	var modal11 = $("#myModal11"); // 패스워드 변경 모달
	
	pwChange.on("click", function(e){ // 패스워드 변경 버튼 클릭시 진행
		e.preventDefault();
		modal11.modal("show");
	});
});

</script>
</body>
</html>