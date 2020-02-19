<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 작성 댓글</title>
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
					<a href="/myPage/info" class="forg2-left">회원 정보</a>
					<a href="/myPage/board" class="forg2-left">스크랩/작성 게시물</a>
					<a href="#" class="forg2-left active" id="joinLink">작성 댓글/관리자 문의 목록</a>
				<div class="clearfix"></div>
		</div>
		<div class="clearfix"> </div>
	</div>
</div>

<div class="bs-docs-example">
	<p style="margin: 20px; font-weight: bold; font-size: 20px;">작성 한 댓글</p>
	
            <table class="table table-striped">
              <thead>
                <tr>
                  <th style="width: 10%;">게시글 번호</th>
                  <th>게시글 제목</th>
                  <th>댓글 내용</th>
                  <th style="width: 20%;">작성 날짜</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1</td>
                  <td>아아아아</td>
                  <td>안녕하세요</td>
                  <td>20.01.06</td>
                </tr>
                <tr>
                  <td>2</td>
                  <td>우우우</td>
                  <td>댓글</td>
                  <td>20.01.06</td>
                </tr>
                <tr>
                  <td>3</td>
                  <td>요요요</td>
                  <td>반가워용</td>
                  <td>20.01.07</td>
                </tr>
              </tbody>
            </table>
            <div style="text-align: center;">
	            <ul class="pagination pagination">
					<li class="disabled"><a href="#"><span aria-hidden="true">«</span></a></li>
					<li class="active"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
				</ul>
			</div>
</div>

<div class="bs-docs-example">
	<p style="margin: 20px; font-weight: bold; font-size: 20px;">관리자에게 문의/건의 한 목록</p>
	
            <table class="table table-striped">
              <thead>
                <tr>
                  <th style="width: 10%;">문의 번호</th>
                  <th>문의 제목</th>
                  <th>문의 내용</th>
                  <th style="width: 20%;">문의 날짜</th>
                  <th style="width: 10%">답변 상태</th>
                </tr>
              </thead>
              <tbody>
                <tr class="reportList">
                  <td>1</td>
                  <td>아아아아</td>
                  <td>안녕하세요</td>
                  <td>20.01.06</td>
                  <td>미완료</td>
                </tr>
                <tr>
                  <td>2</td>
                  <td>우우우</td>
                  <td>댓글</td>
                  <td>20.01.06</td>
                  <td>미완료</td>
                </tr>
                <tr>
                  <td>3</td>
                  <td>요요요</td>
                  <td>반가워용</td>
                  <td>20.01.07</td>
                  <td>미완료</td>
                </tr>
              </tbody>
            </table>
            <div style="text-align: center;">
	            <ul class="pagination pagination">
					<li class="disabled"><a href="#"><span aria-hidden="true">«</span></a></li>
					<li class="active"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
				</ul>
			</div>
</div>

 <!-- 관리자에게 건의/문의 모달 창 -->
              <div class="modal fade" id="myModal8" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                      <div class="modal-content">
                          <div class="modal-header">
                              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                              <h3 class="modal-title" style="color: #5bc0de;">관리자에게 문의/건의 하기</h3>
                          </div>
                          <div class="modal-body">
                        	
                        		<label>문의 / 건의 제목</label>
                        		<input class="form-control" value="문의 문의 문의!">
                        		<label>작성자</label>
						        <input class="form-control" value="작성자" name="replyer" id="replyer" readonly="readonly">
						        <label>문의 / 건의 내용</label>
						        <textarea class="form-control" style="margin-bottom: 10px;">문의 한다아아</textarea>	
                        	
                        		<div>
                        			<label>관리자 답변</label>
                        			<textarea class="form-control" style="margin-bottom: 10px;">관리자 답변이 없으면 - 관리자가 아직 답변을 하지 않았습니다 출력</textarea>
                        		</div>
                          </div>
                          <div class="modal-footer">
                              <button type="button" class="btn btn-default" id="modalCloseBtn" data-dismiss="modal">닫기</button>
                          </div>
                      </div>
                      <!-- /.modal-content -->
                  </div>
                  <!-- /.modal-dialog -->
              </div>
              <!-- END 관리자에게 건의/문의 모달 창  -->   


<script>
	var reportList = $('.reportList');
	var modal8 = $('#myModal8');
	
	reportList.on('click', function(e) {
		modal8.modal('show');
	});
</script>
</body>
</html>