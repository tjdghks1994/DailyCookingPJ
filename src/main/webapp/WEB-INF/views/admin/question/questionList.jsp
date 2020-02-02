<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지 - 건의/문의 사항 목록</title>
<!-- //for-mobile-apps -->
<link href="/resources/css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="/resources/css/style.css" rel='stylesheet' type='text/css' />
</head>
<body>
<jsp:include page="../adminBar.jsp"></jsp:include>

<div class="bs-docs-example" style="position: relative; left: 10px; top: 30px; display: inline-block; width: 75%;">
	<span style="margin-left: 20px; font-weight: bold; font-size: 20px;">전체 건의/문의 사항 목록 (
	<span class="memberNum"> 5 </span> )</span>
	<div style="margin-bottom: 20px;">
	</div>
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>번호</th>
                  <th>제목</th>
                  <th>작성자(닉네임)</th>
                  <th>건의 한 날짜 </th>
                  <th style="width: 15%;">답변 상태</th>
                </tr>
              </thead>
              <tbody>
                <tr class="questionList">
                  <td>1</td>
                  <td>관리자님 질문이요</td>
                  <td>유후우</td>
                  <td>2020/01/20</td>
                  <td>답변 안함</td>
                </tr>
                <tr>
                  <td>2</td>
                  <td>관리자님 제 게시글이 이상해요</td>
                  <td>원주토박이</td>
                  <td>2020/01/20</td>
                  <td>답변 안함</td>
                </tr>
                <tr>
                  <td>3</td>
                  <td>관리자님 계정 정지 해제 해주세요</td>
                  <td>그루트</td>
                  <td>2020/01/22</td>
                  <td>답변 안함</td>
                </tr>
                 <tr>
                  <td>4</td>
                  <td>관리자님 로그인이 안되요</td>
                  <td>백종원아들</td>
                  <td>2020/01/23</td>
                  <td>답변 안함</td>
                </tr> <tr>
                  <td>5</td>
                  <td>게시물 삭제가 안되요 ㅠㅠ</td>
                  <td>술꾼</td>
                  <td>2020/01/29</td>
                  <td>답변 완료</td>
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
              <div class="modal fade" id="myModal9" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                      <div class="modal-content">
                          <div class="modal-header">
                              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                              <h3 class="modal-title" style="color: #5bc0de;">관리자에게 문의/건의 하기</h3>
                          </div>
                          <div class="modal-body">
                        	
                        		<label>문의 / 건의 제목</label>
                        		<input class="form-control" value="관리자님 질문이요">
                        		<label>작성자</label>
						        <input class="form-control" value="유후우" name="replyer" id="replyer" readonly="readonly">
						        <label>문의 / 건의 내용</label>
						        <textarea class="form-control" style="margin-bottom: 10px;">저도 홈페이지 만들고 싶은데 알려주세용</textarea>	
                        	
                        		<div>
                        			<label>관리자 답변</label>
                        			<textarea class="form-control" style="margin-bottom: 10px;"></textarea>
                        		</div>
                          </div>
                          <div class="modal-footer">
                          	  <button type="button" class="btn btn-info" id="modalAnswerBtn">답변하기</button>
                              <button type="button" class="btn btn-default" id="modalCloseBtn" data-dismiss="modal">닫기</button>
                          </div>
                      </div>
                      <!-- /.modal-content -->
                  </div>
                  <!-- /.modal-dialog -->
              </div>
              <!-- END 관리자에게 건의/문의 모달 창  -->   

<script>
$(function(){

		var question = $('.questionList');
		var modal9 = $('#myModal9');
		
		question.on("click",function(e){
			e.preventDefault();
			$('#myModal9').modal('show');
		});
		
});
</script>
</body>
</html>