<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
						<p style="font-size: 20px; margin-bottom: 10px;">이메일</p>
						<div class="key">
							<i class="fa fa-envelope" aria-hidden="true"></i>
							<input  type="text">
							<div class="clearfix"></div>
						</div>
						<input type="submit" value="찾기" id="searchBtn">
						<input type="button" value="취소" id="cancleBtn">
					</form>
				</div>
			</div>
		</div>
		
		<!-- 비밀번호 변경 모달 창 -->
              <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
						            <input class="form-control" name="reply" id="reply">
						          </div>
						          <div class="form-group">
						            <label>비밀번호 확인</label>
						            <input class="form-control" name="replyer" id="replyer">
						          </div>
						        </form>
                          </div>
                          <div class="modal-footer">
                              <button type="button" class="btn btn-primary" >비밀번호 변경</button>
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
	var search = $("#searchBtn");
	var modal = $(".modal");

	search.on("click", function(e){
		e.preventDefault();
		modal.modal('show');
	});
	
	var cancle = $("#cancleBtn");
	cancle.on("click", function(e){
		e.preventDefault();
		location.href="/login";
	});
});

</script>

</body>
</html>