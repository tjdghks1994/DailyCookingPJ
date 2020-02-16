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
			<div class="mainImgDiv"> <!-- 첨부 사진 중 1번째 사진을 대표사진으로 보이게 -->
				
			</div>
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
					<span style="font-size: 14px;">댓글 <span class="replyCount">0</span></span>
				</a>
				<a class="recipeSc" id="likeTag">
					<img src="/resources/images/good.png" class="iconImg">
					<span class="likeText" style="font-size: 14px;">추천 ${recipe.likeCnt } </span>
				</a>
			</div>
			
			<div class="managerBtn">
			<sec:authentication property="principal" var="principal"/>
			<sec:authorize access="isAuthenticated()">
			<c:if test="${principal.username eq recipe.userid }">
				<form action="/recipe/modify" name="modifyForm" style="display: inline;">
					<a class="managerText" href="#" id="recipeModifyTag">글 수정하기</a> <!-- 해당 게시물을 작성한 유저만 보이게 -->
					<input type="hidden" name="recipenum" value="${recipe.recipenum }">
					<input type="hidden" name="pageNum" value="${cri.pageNum }">
					<input type="hidden" name="amount" value="${cri.amount }">
					<input type="hidden" name="type" value="${cri.type }">
					<input type="hidden" name="keyword" value="${cri.keyword }">
				</form>
			
				<form action="/recipe/remove" method="post" name="deleteForm" style="display: inline;">
					<a class="managerText" href="#" id="recipeRemoveTag">글 삭제하기</a> <!-- 해당 게시물을 작성한 유저만 보이게 -->
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
					<input type="hidden" name="recipenum" value="${recipe.recipenum }">
					<input type="hidden" name="pageNum" value="${cri.pageNum }">
					<input type="hidden" name="amount" value="${cri.amount }">
					<input type="hidden" name="type" value="${cri.type }">
					<input type="hidden" name="keyword" value="${cri.keyword }">
				</form>
			</c:if>
				<form action="/recipe/report" method="post" name="reportForm" style="display: inline;">
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
					<input type="hidden" name="recipenum" value="${recipe.recipenum }">
					<input type="hidden" name="pageNum" value="${cri.pageNum }">
					<input type="hidden" name="amount" value="${cri.amount }">
					<input type="hidden" name="type" value="${cri.type }">
					<input type="hidden" name="keyword" value="${cri.keyword }">
					<input type="hidden" name="reporter" value="${principal.username }">
					<a class="reportText">글 신고하기</a> <!-- 로그인 한 유저만 보이게 -->
				</form>
			</sec:authorize>
			<form action="/recipe/list" method="get" name="listForm" style="display: inline;">
				<a class="managerText" href="#" id="recipeListTag">게시글 목록으로</a>
				<input type="hidden" name="pageNum" value="${cri.pageNum }">
				<input type="hidden" name="amount" value="${cri.amount }">
				<input type="hidden" name="type" value="${cri.type }">
				<input type="hidden" name="keyword" value="${cri.keyword }">
			</form>
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
	
	<div class="recipeInsert"> <!-- 요리 사진 첨부파일  -->
		<div class="getRecipeDiv2">
			<p style="font-size: 16px; font-weight: bold; margin-bottom: 20px;">요리 완성 사진</p>
			<div class="uploadResult">
				<ul>
					
				</ul>
			</div>
		</div>
	</div>
	
	<!-- 댓글 목록 -->
             <div class="recipeInsert" id="replySpace">
             	<div class="getRecipeDiv2">
              		<div style="border-bottom: 1px solid lightgray; padding-bottom: 10px;">
              			<span style="font-size: 16px; font-weight: bold;">댓글</span>
              			<sec:authorize access="isAuthenticated()">
              				<button type="button" class="btn btn-info btn-sm pull-right" id="addReplyBtn">댓글 등록</button>
              			</sec:authorize>
              		</div>
              		<div class="replyDiv">
              			<ul class="chat">
              				<li class="replyList" data-replynum='4'>
              					<div>
              						<strong class="primary-font">댓글이 존재하지않습니다.</strong>
              					</div>
              				</li>
              			</ul>
              		</div>
              		<div class="replyFooter">
              		
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
                              <h4 class="modal-title" id="myModalLabel">댓글 상세 정보</h4>
                          </div>
                          <div class="modal-body">
                        		
						          <div class="form-group">
						            <label>댓글 내용</label>
						            <input class="form-control" value="new Reply!!!" name="reply" id="reply">
						          </div>
						          <div class="form-group">
						            <label>작성자</label>
						            <input class="form-control" value="" name="userid" id="userid" readonly="readonly">
						          </div>
						          <div class="form-group">
						            <label>댓글 등록 날짜</label>
						            <input class="form-control" name="regDate" id="regDate" value="2019-12-02 09:45:15">
						          </div>
						        
                          </div>
                          <div class="modal-footer">
                              <button type="button" class="btn btn-warning" id="modalModBtn">수정</button>
                              <button type="button" class="btn btn-danger" id="modalRemoveBtn">삭제</button>
                              <button type="button" class="btn btn-info" id="modalRegBtn">등록</button>
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
              			<span style="font-size: 16px; font-weight: bold;">태그</span>
              		</div>
              		<div style="margin-top: 10px;" class="tagDiv"> <!-- jQuery 이용해서 동적 태그생성 -->
              		
	              	</div>
	              </div>
              </div>
              
</div> <!-- End 전체 감싼 div  -->

<script src="/resources/js/recipeReply.js"></script>

<script>
$(function(){
	var replyBtn = $('#addReplyBtn'); // 댓글 등록 버튼
	var modal5 = $('#myModal5'); // 댓글 모달 창
	var modalInputReply = modal5.find("input[name='reply']"); // 댓글 모달 창 - 댓글 내용
	var modalInputReplyer = modal5.find("input[name='userid']"); // 댓글 모달 창 - 작성자
	var modalInputReplyDate = modal5.find("input[name='regDate']"); // 댓글 모달 창 - 최종 수정 날짜
	
	var modalModBtn = $('#modalModBtn'); // 댓글 모달 창 - 수정 버튼
	var modalRemoveBtn = $('#modalRemoveBtn'); // 댓글 모달 창 - 삭제 버튼
	var modalRegBtn = $('#modalRegBtn'); // 댓글 모달 창 - 등록 버튼
	
	var replyer = null; // 댓글 작성자 변수
	
	<sec:authorize access="isAuthenticated()">
	
	replyer = '<sec:authentication property="principal.username"/>';
	
	</sec:authorize>
	
	replyBtn.on('click', function(e) { // 댓글 등록 버튼 클릭시 진행
		e.preventDefault();
		
		modal5.find("input").val(""); // input태그의 값 전부 공백으로
		modal5.find("input[name='userid']").val(replyer); // 댓글 작성자 칸에 값을 로그인 한 아이디로
		modalInputReplyDate.closest("div").hide(); // 댓글 등록 날짜의 div를 숨김
		modal5.find("button[id != 'modalCloseBtn']").hide(); // 닫기 버튼 제외 모두 숨기기 처리
		modalRegBtn.show(); // 등록 버튼은 보이게처리
		
		modal5.modal('show'); // 모달창 보이게
	});
	
	modalRegBtn.on("click", function(e){ // 댓글 모달 창에서 등록 버튼 클릭 시 진행
		var reply = {
				reply : modalInputReply.val(),
				userid : modalInputReplyer.val(),
				recipenum : recipeNum
		};
			replyService.add(reply, function(result){
				alert("댓글 등록에 성공하였습니다");
				
				modal5.find("input").val("");
				modal5.modal("hide");
				
				showList(-1);
			}); 
		});
	
	$(".chat").on("click", "li", function(e){ // 댓글 목록 한개 클릭시 진행 - 동적태그 이므로 이벤트 위임 처리
		var replynum = $(this).data("replynum");
		
		replyService.get(replynum, function(reply){
			modalInputReply.val(reply.reply); // 댓글 내용 칸에 값을 해당 댓글의 내용으로 변경
			modalInputReplyer.val(reply.userid); // 댓글 작성자 칸을 작성자 아이디로 내용 변경
			modalInputReplyDate.val(replyService.displayTime(reply.regDate)).attr("readonly","readonly");
			modal5.data("replynum", reply.replynum); // 모달창의 속성 data-replynum을 해당 댓글의 번호로 지정
			
			modal5.find("button[id != 'modalCloseBtn']").hide();
			modalModBtn.show(); // 수정 버튼 보이게
			modalRemoveBtn.show(); // 삭제 버톤 보이게
			
			modal5.modal("show"); // 모달 창 보이게
		});
	});
	
	modalModBtn.on("click", function(e){ // 댓글 수정 버튼 클릭 시 진행
		var reply = {replynum : modal5.data("replynum"), reply : modalInputReply.val()};
		
		if(!replyer){
			alert("로그인 후 이용해 주세요");
			modal5.modal("hide");
			return;
		}
		
		var replyWriter = modalInputReplyer.val();
		
		if(replyer != replyWriter){
			alert("자신이 작성한 댓글만 수정 가능합니다");
			modal5.modal("hide");
			return;
		}
	
		replyService.update(reply, function(result){
			alert("댓글 수정에 성공하였습니다");
			modal5.modal("hide");
			showList(pageNum);
		}); 
	});
	
	modalRemoveBtn.on("click", function(e){ // 댓글 삭제 버튼 클릭 시 진행
		var replynum = modal5.data("replynum");
	
		if(!replyer){
			alert("로그인 후 이용해 주세요");
			modal5.modal("hide");
			return;
		}
		
		var replyWriter = modalInputReplyer.val();
		
		if(replyer != replyWriter){
			alert("자신이 작성한 댓글만 삭제 가능합니다");
			modal5.modal("hide");
			return;
		}
		
		var memberDeleteAnswer = confirm("정말 댓글을 삭제하시겠습니까?");	
	
		if(memberDeleteAnswer){ // 댓글을 정말 삭제한다고 하였을 때 진행
			replyService.remove(replynum, function(result){
		 		alert("댓글 삭제 하였습니다");
		 		modal5.modal("hide");
		 		showList(pageNum);
		 	});
		}	
	});
	
	// 첨부파일 ajax 처리
	$.getJSON("/recipe/getAttachList", {recipenum:"${recipe.recipenum}"}, function(arr){
/* 		console.log(arr);
		console.log(arr[0].uploadPath); */
		// 첫번 째 첨부파일 경로명
		var firstAttachPath = encodeURIComponent(arr[0].uploadPath+ "/s_"+arr[0].uuid+"_"+arr[0].fileName);
		var firstImg = "";
		firstImg += "<img src='/display?fileName="+firstAttachPath+"'>";
		$(".mainImgDiv").html(firstImg); // 대표 이미지 사진으로 변경시키기
		
		var attachList = "";
		
		$(arr).each(function(i, attach){
			var fileCallPath = encodeURIComponent(attach.uploadPath+ "/s_"+attach.uuid+"_"+attach.fileName);
			attachList += "<li data-path='"+attach.uploadPath+"'";
			attachList += " data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.image+"'";
			attachList += " ><div>";
			attachList += "<img class='attachImg' src='/display?fileName="+fileCallPath+"'>";
			attachList += "</div></li>";
		});
		
		$(".uploadResult ul").html(attachList);
		
	});
	
	console.log(replyer);
	var likeTag = $("#likeTag");
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	var likeCnt = "${recipe.likeCnt}";
	
	likeTag.on("click",function(e){
		
		if(replyer == null) { // 로그인이 되어있지 않다면
			alert("추천은 로그인 후 이용 가능합니다");
			return;
		}
		
		 // like table 조회
		$.getJSON("/recipe/likeList", {recipenum : '${recipe.recipenum}', userid : replyer}, function(arr){
				
				if(arr.length <= 0){ // 해당 게시물에 추천 태그를 누른적이 없다면
					var userAnswer = confirm("해당 게시물을 추천 하시겠습니까?");
					if(userAnswer){
						$.ajax({
							url : '/recipe/likeInsert',
							data : {recipenum : '${recipe.recipenum}', userid : replyer},
							type : 'post',
							beforeSend : function(xhr)
				            {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				                xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				            },
							success : function(result){
								likeCnt = likeCnt * 1; // 자동 타입 형변환을 위해 먼저 곱하기 1을 함 Number타입으로 변환
								likeCnt = likeCnt + 1; // Number타입으로 변환된 후 1 더하기
								$(".likeText").html('추천 ' + likeCnt);
								alert('${recipe.title}' + " 게시글을  추천하였습니다");
							}
						});
					}
					
				} // END arr.length <=0 
				else {
					var userAnswer = confirm("해당 게시물을 이미 추천하였습니다. 추천을 취소하시겠습니까?");
					if(userAnswer){
						$.ajax({
							url : '/recipe/likeDelete',
							data : {recipenum : '${recipe.recipenum}', userid : replyer},
							type : 'post',
							beforeSend : function(xhr)
				            {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				                xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				            },
							success : function(result){
								likeCnt = likeCnt * 1; // 자동 타입 형변환을 위해 먼저 곱하기 1을 함 Number타입으로 변환
								likeCnt = likeCnt -1;
								$(".likeText").html('추천 ' + likeCnt);
								alert('추천을 취소하였습니다');
							}
						});
					}
				}
		
		}); // END getJSON()
	});
		
	
	
}); // end function()
	
	
	var recipeNum = '${recipe.recipenum}'; // 레시피 게시물의 번호
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	var replyUL = $(".chat"); // 댓글 ul태그
	showList(1);
	
	function showList(page){
		replyService.getList({recipenum:recipeNum, page:page||1},function(replyCnt,list){
			
			console.log("댓글 갯수 : " + replyCnt);
			
			if(page == -1){ // 페이지 번호가 -1로 전달되면 마지막 페이지를 찾아서 다시 호출
				pageNum = Math.ceil(replyCnt/10.0);
				showList(pageNum);
				return;
			}
			
			var str = "";
			if(list == null || list.length == 0){ // 댓글목록이 존재하지 않을 때
				replyUL.html("");
				return;
			}
			for(k=0, len=list.length || 0; k<len; k++){
				str +="<li class='replyList' data-replynum='"+list[k].replynum+"'>";
				str +="<div><strong class='primary-font'>"+list[k].userid+"</strong>";
				str +="<small class='pull-right text-muted'>"+replyService.displayTime(list[k].regDate)+"</small></div>";
				str +="<p>"+list[k].reply+"</p></li>";
			}
			
			replyUL.html(str);
			showReplyPage(replyCnt);
		}); 
	}
	

	var pageNum = 1;
	var replyPageFooter = $(".replyFooter");
	var replyCountSpanTag = $(".replyCount"); // 댓글 수를 보여주는 span태그
	
	function showReplyPage(replyCnt){ // 댓글 갯수로 댓글 페이징
		var endNum = Math.ceil(pageNum / 10.0) * 10;
		var startNum = endNum -9;
		
		var prev = startNum != 1;
		var next = false;
		
		if(endNum * 10 >= replyCnt) {
			endNum = Math.ceil(replyCnt/10.0);
		}
		if(endNum * 10 < replyCnt) {
			next = true;
		}
		
		var replyPageText = "<ul class='pagination pull-right'>";
		
		if(prev){
			replyPageText += "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>«</a></li>";
		}
		
		for(var x=startNum; x<=endNum; x++){
			var active = pageNum == x? " active":"";
			
			replyPageText += "<li class='page-item" + active+" '><a class='page-link' href='"+x+"'>"+x+"</a></li>";
		}
		
		if(next){
			replyPageText += "<li class='page-item'><a class='page-link' href='"+(endNum+1)+"'>»</a></li>";
		}
		
		replyPageText += "</ul></div>";
		
		replyCountSpanTag.html(replyCnt); // 댓글 전체 숫자 값을 span태그에 반영시키기
		replyPageFooter.html(replyPageText); // 페이징 처리 view에 반영시키기
	} /* 댓글 페이징 함수 showReplyPage 끝 */
	
	replyPageFooter.on("click","li a", function(e){ // 댓글 페이징 번호 클릭 시 진행
		e.preventDefault();
		
		var targetPageNum = $(this).attr("href");
		
		pageNum = targetPageNum;
		showList(pageNum);
	});
	
	var reportBtn = $('.reportText'); // 게시물 신고하기 a태그
	reportBtn.on('click', function(e) { // 게시물 신고하기 클릭시 진행
		e.preventDefault();
		var reportAnswer = confirm('정말 게시글을 신고하시겠습니까?');
		if(reportAnswer){
			$("form[name='reportForm']").submit();
		}
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
	
	var removeTag = $("#recipeRemoveTag"); // 글 삭제하기 태그
	removeTag.on("click", function(e){ // 글 삭제하기 클릭시 진행
		e.preventDefault();
		
		var removeAnswer = confirm('정말 게시글을 삭제하시겠습니까?');
		if(removeAnswer){ 
			$("form[name='deleteForm']").submit(); // 폼 전송
		}
	});
	
	var modifyTag = $("#recipeModifyTag"); // 글 수정하기 태그
	modifyTag.on("click", function(e){
		e.preventDefault();
		
		$("form[name='modifyForm']").submit();
	});
	
	var listTag = $("#recipeListTag"); // 글 목록으로 태그
	listTag.on("click", function(e){
		e.preventDefault();
		
		$("form[name='listForm']").submit();
	});
				
		
</script>
</body>
</html>