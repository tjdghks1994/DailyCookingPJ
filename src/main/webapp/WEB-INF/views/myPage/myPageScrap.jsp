<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 스크랩 게시물</title>
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
					<a href="#" class="forg2-left active">스크랩 게시물</a>
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
	<p style="margin: 20px; font-weight: bold; font-size: 20px;">스크랩 한 게시물</p>
	
            <table class="table table-striped">
              <thead>
                <tr>
                  <th style="width: 10%;">글 번호</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th style="width: 15%;">비고</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach items="${sList }" var="sList">
          
              	<tr class="gotoRecipe" data-num="${sList.recipenum}" }>
                  <td>${sList.recipenum }</td>
               	  <td>${sList.title }</td> 
                  <td>${sList.writer }</td>
                  <td></td>
                </tr>
          
              </c:forEach>
              </tbody>
            </table>
            <div style="text-align: center;">
	            <ul class="pagination pagination">
	            <c:if test="${pageMaker.prev }">
	            	<li class="disabled"><a href="#"><span aria-hidden="true">«</span></a></li>
	            </c:if>
	            <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
	            	<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":"" }"><a href="${num }">${num }</a></li>
	            </c:forEach>	
				<c:if test="${pageMaker.next }">
					<li><a href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
				</c:if>
				</ul>
			</div>
			<form action="/myPage/scrapList" method="get" id="scrapPageForm">
				<sec:authentication property="principal" var="principal"/>
				<input type="hidden" name="userid" value="${principal.username }">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
			</form>
</div>


<script>
	var scrapPageForm = $("#scrapPageForm");
	
	$(".paginate_button a").on("click", function(e){ // 스크랩 페이지 버튼 클릭 시 진행
		e.preventDefault();
		scrapPageForm.find("input[name='pageNum']").val($(this).attr("href"));
		scrapPageForm.submit();
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
	
	$("#myPageBoardTag").on("click",function(e){
		e.preventDefault();
		
		var form = $("#boardForm");
		form.submit();
	});
	
	$("#myPageReplyTag").on("click",function(e){
		e.preventDefault();
		
		$("#replyForm").submit();
	});
	
	$("#myPageQuestionTag").on("click",function(e){
		e.preventDefault();
		
		$("#questionForm").submit();
	});
</script>
</body>
</html>