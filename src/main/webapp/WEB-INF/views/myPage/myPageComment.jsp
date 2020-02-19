<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
					<a href="#" class="forg2-left active" id="joinLink">작성 댓글 목록</a>
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

<div class="bs-docs-example">
	<p style="margin: 20px; font-weight: bold; font-size: 20px;">작성 한 댓글</p>
	
            <table class="table table-striped">
              <thead>
                <tr>
                  <th style="width: 10%;">게시글 번호</th>
                  <th>댓글 내용</th>
                  <th style="width: 20%;">작성 날짜</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach items="${rrList }" var="rrList">
                <tr class="gotoRecipe" data-num="${rrList.recipenum }">
                  <td>${rrList.recipenum }</td>
                  <td>${rrList.reply }</td>
                  <td><fmt:formatDate value="${rrList.regDate }" pattern="yyyy-MM-dd"/> </td>
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
			<form action="/myPage/replyList" method="get" id="replyPageForm">
				<sec:authentication property="principal" var="principal"/>
				<input type="hidden" name="userid" value="${principal.username }">
				<input type="hidden" name="pageNum" value="${paging.cri.pageNum }">
				<input type="hidden" name="amount" value="${paging.cri.amount }">
			</form>
</div>

<script>
	var replyPageForm = $("#replyPageForm");
	
	$(".paginate_button a").on("click", function(e){ // 댓글 페이지 버튼 클릭 시 진행
		e.preventDefault();
		replyPageForm.find("input[name='pageNum']").val($(this).attr("href"));
		replyPageForm.submit();
	});

	$(".gotoRecipe").on("click",function(e){ // 스크랩 목록 클릭 시 진행
		e.preventDefault();
		
		var recipenum = $(this).data("num");
		
		location.href='/recipe/get?recipenum=' + recipenum + '';
	});

	$("#infoTag").on("click", function(e){
		e.preventDefault();
		
		$("#infoForm").submit();
	});
	
	$("#myPageScrapTag").on("click",function(e){ // 스크랩 게시물 태그 클릭 시 진행
		e.preventDefault();
	
		var form = $("#scrapForm");
		form.submit();
	});
	
	$("#myPageBoardTag").on("click",function(e){
		e.preventDefault();
		
		$("#boardForm").submit();
	});
	
	$("#myPageQuestionTag").on("click",function(e){
		e.preventDefault();
		
		$("#questionForm").submit();
	});
</script>
</body>
</html>