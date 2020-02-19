<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 문의 목록</title>
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
					<form action="/myPage/info" method="get" id="infoForm">
						<a href="#" class="forg2-left" id="infoTag">회원 정보</a>
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
						<sec:authentication property="principal" var="principal"/>
						<input type="hidden" name="userid" value="${principal.username }">
						<input type="hidden" name="pageNum" value="1">
					    <input type="hidden" name="amount" value="10">
					</form>
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
					<a href="#" class="forg2-left active" id="joinLink">문의/건의 목록</a>
				<div class="clearfix"></div>
		</div>
		<div class="clearfix"> </div>
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
               <c:forEach items="${qList }" var="qList">
                <tr class="questionShow" data-title="${qList.title }" data-id="${qList.userid }" data-ct="${qList.content }" data-st="${qList.status }"
                data-an="${qList.answer }">
                  <td>${qList.questionNum }</td>
                  <td>${qList.title }</td>
                  <td>${qList.content }</td>
                  <td><fmt:formatDate value="${qList.questionDate }" pattern="yyyy-MM-dd"/></td>
                  <c:if test="${qList.status eq 0}">
                  <td>답변 대기중</td>
                  </c:if>
                  <c:if test="${qList.status eq 1 }">
                  <td>답변 완료</td>
                  </c:if>
                </tr>
              </c:forEach>
              </tbody>
            </table>
            
			<div style="text-align: center;">
	            <ul class="pagination pagination">
	            <c:if test="${paging.prev }">
	            	<li class="disabled"><a href="#"><span aria-hidden="true">«</span></a></li>
	            </c:if>
	            <c:forEach var="num" begin="${paging.startPage }" end="${paging.endPage }">
	            	<li class="paginate_button ${paging.cri.pageNum == num ? "active":"" }"><a href="${num }">${num }</a></li>
	            </c:forEach>	
				<c:if test="${paging.next }">
					<li><a href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
				</c:if>
				</ul>
			</div>
			<form action="/myPage/questionList" method="get" id="questionPageForm">
				<sec:authentication property="principal" var="principal"/>
				<input type="hidden" name="userid" value="${principal.username }">
				<input type="hidden" name="pageNum" value="${paging.cri.pageNum }">
				<input type="hidden" name="amount" value="${paging.cri.amount }">
			</form>
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
                        		<input class="form-control" value="문의 문의 문의!" name="title" readonly="readonly">
                        		<label>작성자</label>
						        <input class="form-control" value="작성자" name="userid" readonly="readonly">
						        <label>문의 / 건의 내용</label>
						        <textarea class="form-control" name="content" style="margin-bottom: 10px;"></textarea>	
                        	
                        		<div>
                        			<label>관리자 답변</label>
                        			<textarea class="form-control" name="answer" style="margin-bottom: 10px;"></textarea>
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
	var questionList = $('.questionShow');
	var modal8 = $('#myModal8');
	
	questionList.on('click', function(e) {
		$("input[name='title']").val($(this).data("title"));
		$("input[name='userid']").val($(this).data("id"));
		$("textarea[name='content']").html($(this).data("ct"));
		$("textarea[name='content']").attr("readonly","readonly");
		
		if($(this).data("st") == 0){
			$("textarea[name='answer']").html("관리자가 아직 답변을 하지 않았습니다 기다려 주세요!");
			$("textarea[name='answer']").attr("readonly","readonly");
		} else {
			$("textarea[name='answer']").html($(this).data("an"));
			$("textarea[name='answer']").attr("readonly","readonly");
		}
		
		modal8.modal('show');
	});
	
	var questionPageForm = $("#questionPageForm");
	
	$(".paginate_button a").on("click", function(e){ // 댓글 페이지 버튼 클릭 시 진행
		e.preventDefault();
		questionPageForm.find("input[name='pageNum']").val($(this).attr("href"));
		questionPageForm.submit();
	});

	$("#myPageReplyTag").on("click",function(e){
		e.preventDefault();
		
		$("#replyForm").submit();
	});
</script>
</body>
</html>