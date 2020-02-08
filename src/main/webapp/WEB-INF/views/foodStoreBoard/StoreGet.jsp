<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 조회 페이지</title>
</head>
<body>
<jsp:include page="../include/header.jsp"></jsp:include>

<div style="background-color: #F5F5F5; padding-top: 40px; padding-bottom: 20px;">
	<div class="recipeInsert">
		<div class="getRecipeDiv">
			<div class="recipeDate">
				<span class="dateLetter">등록일 :</span> <span>xxxx-xx-xx</span> <span class="dateLetter">수정일 :</span><span>xxxx-xx-xx</span>
			</div>
			<img src="/pppp/images/logo.png" width="60%;" height="300px;">
			<p class="recipeWriter">작성자 : 유도건</p>
			<p class="recipeTitle">레시피 제목 나오는 공간 이다</p>
			<div>
				<a class="recipeSc">
					<img src="/pppp/images/favorite.png" class="iconImg">
					<span style="font-size: 14px;">스크랩 10</span>
				</a>
				<a class="recipeSc" href="#replySpace">
					<img src="/pppp/images/comment.png" class="iconImg">
					<span style="font-size: 14px;">댓글 0</span>
				</a>
				<a class="recipeSc">
					<img src="/pppp/images/good.png" class="iconImg">
					<span style="font-size: 14px;">추천 0</span>
				</a>
			</div>
			
			<div class="managerBtn">
				<a class="managerText" href="/recipeModify">글 수정하기</a> <!-- 해당 게시물을 작성한 유저만 보이게 -->
				<a class="managerText">글 삭제하기</a> <!-- 해당 게시물을 작성한 유저만 보이게 -->
				<a class="reportText">글 신고하기</a> <!-- 로그인 한 유저만 보이게 -->
			</div>
		</div>
	</div>
	
	<div class="recipeInsert">
		<div class="getRecipeDiv2">
			<p style="font-size: 16px; font-weight: bold; margin-bottom: 20px;">조리 순서 
			<span style="color: lightgray; font-size: 16px;">Steps</span> </p>
			<div class="cookingOrder"> <!-- db에서 값 가져올 때 for문을 통해서 생성할 div 태그  -->
				<span id="orderValue">1.</span>
				<span id="orderContent" style="font-size: 18px; margin-left: 10px;">조리 순서 내용 디비 값 가져와서 출력 할 공간</span>
				<br>
			</div>
			<div class="cookingOrder">
				<span id="orderValue">2.</span>
				<span id="orderContent" style="font-size: 18px; margin-left: 10px;">조리 순서 내용 디비 값 가져와서 출력 할 공간</span>
				<br>
			</div>
			<div class="cookingOrder">
				<span id="orderValue">3.</span>
				<span id="orderContent" style="font-size: 18px; margin-left: 10px;">조리 순서 내용 디비 값 가져와서 출력 할 공간</span>
				<br>
			</div>
			<div style="margin-bottom: 15px;">
				<span style="font-size: 16px; font-weight: bold; color: red;" >* 조리 팁/ 주의사항</span>
			</div>
			<p style="font-size: 18px;">조리 팁/ 주의사항 내용 디비 값 가져와서 출력 할 공간</p>
		</div> <!-- End getRecipeDiv2 -->
	</div> <!-- End recipeInsert  -->
	
	<!-- 댓글 목록 -->
             <div class="recipeInsert" id="replySpace">
             	<div class="getRecipeDiv2">
              		<div style="border-bottom: 1px solid lightgray; padding-bottom: 10px;">
              			<span style="font-size: 16px;">댓글</span>
              			<button type="button" class="btn btn-info btn-sm pull-right" id="addReplyBtn">댓글 등록</button>
              		</div>
              		<div class="replyDiv">
              			<ul class="chat">
              				<li class="replyList" data-rno='12'>
              					<div>
              						<strong class="primary-font">user00</strong>
              						<small class="pull-right text-muted">2020-01-10 10:20</small>
              					</div>
              					<p>댓글 내용 디비에서 가져와 출력 할 공간</p>
              				</li>
              				<li class="replyList">
              					<div>
              						<strong class="primary-font">user01</strong>
              						<small class="pull-right text-muted">2019-11-29 15:43</small>
              					</div>
              					<p>댓글 내용 디비에서 가져와 출력 할 공간</p>
              				</li>
              			</ul>
              		</div>
              	</div>
              </div>	
              <!-- END 댓글 목록 -->
              
              <!-- 댓글 modal 창 -->
              <div class="modal fade" id="myModal5" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                      <div class="modal-content">
                          <div class="modal-header">
                              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                              <h4 class="modal-title" id="myModalLabel">댓글</h4>
                          </div>
                          <div class="modal-body">
                        		<form>
						          <div class="form-group">
						            <label>댓글 내용</label>
						            <input class="form-control" value="new Reply!!!" name="reply" id="reply">
						          </div>
						          <div class="form-group">
						            <label>작성자</label>
						            <input class="form-control" value="replyer" name="replyer" id="replyer" readonly="readonly">
						          </div>
						          <div class="form-group">
						            <label>댓글 등록 날짜</label>
						            <input class="form-control" name="replyDate" id="replyDate" value="2019-12-02 09:45:15">
						          </div>
						        </form>
                          </div>
                          <div class="modal-footer">
                              <button type="button" class="btn btn-warning" id="modalModBtn">수정</button>
                              <button type="button" class="btn btn-danger" id="modalRemoveBtn">삭제</button>
                              <button type="button" class="btn btn-info" id="modalRegisterBtn">등록</button>
                              <button type="button" class="btn btn-default" id="modalCloseBtn" data-dismiss="modal">닫기</button>
                          </div>
                      </div>
                      <!-- /.modal-content -->
                  </div>
                  <!-- /.modal-dialog -->
              </div>
              <!-- END 댓글 modal 창  -->
              
              <div class="recipeInsert">
	              <div class="getRecipeDiv2">
	              	<div style="margin-bottom: 20px;">
              			<span style="font-size: 16px;">태그</span>
              		</div>
              		<div style="margin-top: 10px;" class="tagDiv">
	              		<a class="recipeTag">#태그1</a>
	              		<a class="recipeTag">#존맛탱</a>
	              		<a class="recipeTag">#누구나 만들 수 있음</a>
	              	</div>
	              </div>
              </div>
              
</div> <!-- End 전체 감싼 div  -->
<jsp:include page="../include/footer.jsp"></jsp:include>
<script>
	var replyBtn = $('#addReplyBtn'); // 댓글 등록 버튼
	var modal5 = $('#myModal5'); // 댓글 모달 창
	var modalInputReply = modal5.find("input[name='reply']"); // 댓글 모달 창 - 댓글 내용
	var modalInputReplyer = modal5.find("input[name='replyer']"); // 댓글 모달 창 - 작성자
	var modalInputReplyDate = modal5.find("input[name='replyDate']"); // 댓글 모달 창 - 최종 수정 날짜
	
	var modalModBtn = $('#modalModBtn'); // 댓글 모달 창 - 수정 버튼
	var modalRemoveBtn = $('#modalRemoveBtn'); // 댓글 모달 창 - 삭제 버튼
	var modalRegisterBtn = $('#modalRegisterBtn'); // 댓글 모달 창 - 등록 버튼
	
	replyBtn.on('click', function(e) { // 댓글 등록 버튼 클릭시 진행
		e.preventDefault();
		
		modal5.find("input").val(""); // input태그의 값 전부 공백으로
		modalInputReplyDate.closest("div").hide(); // 댓글 등록 날짜의 div를 숨김
		modalModBtn.hide(); // 수정 버튼 숨김
		modalRemoveBtn.hide(); // 삭제 버튼 숨김
		modalRegisterBtn.show(); // 등록 버튼 보이게
		
		modal5.modal('show'); // 모달창 보이게
	});
	
	var replyList = $('.replyList'); // 댓글 목록 li태그
	
	replyList.on('click', function(e) { // 댓글 목록 클릭시 진행
		e.preventDefault();
	
		modalInputReplyDate.closest("div").show(); // 댓글 등록 날짜의 div 보이게
		modal5.find("button[id != 'modalCloseBtn']").hide(); // 닫기 버튼이 아닌 버튼은 모드 숨김 처리
		modalModBtn.show(); // 댓글 작성자와 사용자 아이디가 같으면 수정 버튼 보이게 할 것
		modalRemoveBtn.show(); // 댓글 작성자와 사용자 아이디가 같으면 삭제 버튼 보이게 할 것
		
		modal5.modal('show');
	});
	
	var reportBtn = $('.reportText'); // 게시물 신고하기 a태그
	reportBtn.on('click', function(e) { // 게시물 신고하기 클릭시 진행
		e.preventDefault();
		confirm('정말 게시글을 신고하시겠습니까?');
	});
</script>
</body>
</html>