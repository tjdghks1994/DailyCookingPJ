<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 조회 페이지</title>
<!-- //for-mobile-apps -->
<link href="/resources/css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="/resources/css/style.css" rel='stylesheet' type='text/css' />
</head>
<body>
<jsp:include page="../include/header.jsp"></jsp:include>

<div style="background-color: #F5F5F5; padding-top: 40px; padding-bottom: 20px;">
	<div class="recipeInsert">
		<div class="getRecipeDiv">
			<div class="recipeDate">
				<span class="dateLetter">등록일 :</span> <span><fmt:formatDate value="${recipe.regdate }" pattern="yyyy-MM-dd"/> </span>
				<span class="dateLetter">수정일 :</span><span><fmt:formatDate value="${recipe.updateDate }" pattern="yyyy-MM-dd"/></span>
			</div>
			<img src="/resources/images/gooksu.jpg" width="60%;" height="50%;">
			<p class="recipeWriter">작성자 : <c:out value="${recipe.userid }"></c:out> </p>
			<p class="recipeTitle"><c:out value="${recipe.title }"></c:out> </p>
			<div class="recipeImgDiv">
				<span class="recipeInfo"><img src="/resources/images/people.png" class="infoImg1">
				 <c:choose>	
				 	<c:when test="${recipe.personnel eq 1}">1인분</c:when>
				 	<c:when test="${recipe.personnel eq 2}">2인분</c:when>
				 	<c:when test="${recipe.personnel eq 3}">3인분</c:when>
				 	<c:when test="${recipe.personnel eq 4}">4인분</c:when>
				 	<c:when test="${recipe.personnel eq 5}">5인분</c:when>
				 	<c:when test="${recipe.personnel eq 6}">6인분 이상</c:when>
				  </c:choose>
				 </span>
				<span class="recipeInfo"><img src="/resources/images/time.png" class="infoImg2">
				  <c:choose>
				  	<c:when test="${recipe.cookingTime eq 10 }">10분 이내</c:when>
				  	<c:when test="${recipe.cookingTime eq 20 }">20분 이내</c:when>
				  	<c:when test="${recipe.cookingTime eq 30 }">30분 이내</c:when>
				  	<c:when test="${recipe.cookingTime eq 60 }">60분 이내</c:when>
				  	<c:when test="${recipe.cookingTime eq 90 }">90분 이내</c:when>
				  	<c:when test="${recipe.cookingTime eq 120 }">120분 이상</c:when>
				  </c:choose>
				 </span>
				<span class="recipeInfo"><img src="/resources/images/level.png" class="infoImg2">
				 <c:choose>
				 	<c:when test="${recipe.cookingLevel eq 1}">매우 쉬움</c:when>
				 	<c:when test="${recipe.cookingLevel eq 2}">쉬움</c:when>
				 	<c:when test="${recipe.cookingLevel eq 3}">보통</c:when>
				 	<c:when test="${recipe.cookingLevel eq 4}">어려움</c:when>
				 	<c:when test="${recipe.cookingLevel eq 5}">매우 어려움</c:when>
				 </c:choose>
				</span>
			</div>
			<div>
				<a class="recipeSc">
					<img src="/resources/images/favorite.png" class="iconImg">
					<span style="font-size: 14px;">스크랩 <c:out value="${recipe.scrapCnt }"></c:out> </span>
				</a>
				<a class="recipeSc" href="#replySpace">
					<img src="/resources/images/comment.png" class="iconImg">
					<span style="font-size: 14px;">댓글 <c:out value="${recipe.replyCnt }"></c:out> </span>
				</a>
				<a class="recipeSc">
					<img src="/resources/images/good.png" class="iconImg">
					<span style="font-size: 14px;">추천 <c:out value="${recipe.likeCnt }"></c:out> </span>
				</a>
			</div>
			
			<div class="managerBtn">
			<sec:authorize access="isAuthenticated()">
				<a class="managerText" href="/recipeModify">글 수정하기</a> <!-- 해당 게시물을 작성한 유저만 보이게 -->
				<form action="/recipe/remove" method="post" name="deleteForm" style="display: inline;">
					<a class="managerText" href="#" id="recipeRemoveTag">글 삭제하기</a> <!-- 해당 게시물을 작성한 유저만 보이게 -->
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
					<input type="hidden" name="recipenum" value="${recipe.recipenum }">
				</form>
				<a class="reportText">글 신고하기</a> <!-- 로그인 한 유저만 보이게 -->
			</sec:authorize>
			</div>
		</div>
	</div>
	
	<div class="recipeInsert">
		<div class="getRecipeDiv2">
			<p style="font-size: 16px; font-weight: bold; margin-bottom: 20px;">[주 재료]</p>
			<p style="font-size: 18px;"><c:out value="${recipe.material }"></c:out> </p>
		</div>
	</div>
	
	<div class="recipeInsert">
		<div class="getRecipeDiv2">
			<p style="font-size: 16px; font-weight: bold; margin-bottom: 20px;">조리 순서 
			<span style="color: lightgray; font-size: 16px;">Steps</span> </p>
		
			<div class="orderDiv">	<!-- jQuery로 동적태그 생성해서 조리순서 값 넣었음  -->
				
			</div>
			
			<div style="margin-bottom: 15px;">
				<span style="font-size: 16px; font-weight: bold; color: red;" >* 조리 팁/ 주의사항</span>
			</div>
			<p style="font-size: 18px;"><c:out value="${recipe.cookingTip }"></c:out> </p>
		</div> <!-- End getRecipeDiv2 -->
	</div> <!-- End recipeInsert  -->
	
	<div class="recipeInsert">
		<div class="getRecipeDiv2">
			<p style="font-size: 16px; font-weight: bold; margin-bottom: 20px;">요리 완성 사진</p>
			<div class="uploadResult">
				<ul>
					<li>
						<div><img src="/resources/images/gooksu.jpg"> </div>
					</li>
					<li>
						<div><img src="/resources/images/gooksu.jpg"> </div>
					</li>
					<li>
						<div><img src="/resources/images/gooksu.jpg"> </div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	
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
              		<div style="margin-top: 10px;" class="tagDiv"> <!-- jQuery 이용해서 동적 태그생성 -->
              		
	              	</div>
	              </div>
              </div>
              
</div> <!-- End 전체 감싼 div  -->

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
	
	var order = '${recipe.cookingOrder}'; // 게시물 재료 순서 모든 값
	var orderArray = order.split("@"); // 게시물 재료 순서를 @ 기준으로 잘라서 배열에 담음
	var orderArrayLength = orderArray.length; // 게시물 재료 순서 배열의 총 길이
	
	var orderDiv = $(".orderDiv"); // 조리순서 div 태그
	var orderText = ""; // 동적으로 태그 생성하기위해 변수 생성
	for(var i=0; i<orderArrayLength-1; i++){
		orderText += '<div class="cookingOrder">';
		orderText += '<span id="orderValue">' + (i+1) + '.</span>';
		orderText += '<span id="orderContent" style="font-size: 18px; margin-left: 10px;">' + orderArray[i] + '</span>';
		orderText += '<br></div>';
	}
	orderDiv.append(orderText); // 조리순서 view 페이지에 부착
	
	var tag = '${recipe.cookingTag}';
	var tagArray = tag.split("#");
	console.log(tagArray[0] + " : " + tagArray[1]);
	var tagArrayLength = tagArray.length;
	console.log(tagArrayLength);
	
	var tagDiv = $(".tagDiv"); // 게시글 태그 div
	var tagText = "";
	for(var i=1; i<tagArrayLength; i++){
		tagText += '<a class="recipeTag">#'+ tagArray[i] +'</a>';
	}
	tagDiv.append(tagText); // 게시물의 태그값 view 페이지에 부착
	
	var removeTag = $("#recipeRemoveTag");
	removeTag.on("click", function(e){
		e.preventDefault();
		
		$("form[name='deleteForm']").submit();
	});
</script>
</body>
</html>