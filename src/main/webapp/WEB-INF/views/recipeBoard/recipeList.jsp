<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 목록</title>
<style type="text/css">
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<div style="background-color: #eaeaea; padding-top: 20px; padding-bottom: 20px">
		<div style="width: 95%; margin: auto; background-color: white;">
			<div class="content-top">
				<div class="container ">
					<div style="margin-bottom: 20px;">
						<span style="font-size: 18px;">총 
						 <span class="recipeBoardCount"></span>
						개의 레시피가 있습니다 </span>
						<button id="regWriteBtn" type="button" class="btn btn-success btn-sm pull-right">레시피 작성하기</button>
					</div>
				</div>
			</div>
			<div class="content-mid" style="padding: 0px;">
				<div class="container">
					<!-- 검색설정 -->
					<div>
						<ul class="nav navbar-nav" style="float: left;">
							<li style="font-size: 14px;"><a href="/recipe/list" style="font-weight: ${Newest}">최신순</a></li>
							<li style="font-size: 14px;"><a href="/recipe/viewBy" style="font-weight: ${viewBy}">조회순</a></li>
							<li style="font-size: 14px;"><a href="">인기순</a></li>
						</ul>
						<div style="width: 100%; text-align: right; margin-bottom: 20px;">
					      	<form id="searchForm" action="/recipe/list" method="get">
					            <select name="type" style="height: 26px;">
					               <option value="" ${pageMaker.cri.type == null?'selected':'' }>--------</option>
					               <option value="I" ${pageMaker.cri.type eq 'I'?'selected':'' }>아이디</option>
					               <option value="T" ${pageMaker.cri.type eq 'T'?'selected':'' }>제목</option>
					               <option value="C" ${pageMaker.cri.type eq 'C'?'selected':'' }>태그</option>
					            </select>
					            <input type="text" name="keyword" value="${pageMaker.cri.keyword }" style="width: 200px;">
					            <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
					            <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
					           <button class="btn btn-default" style="height: 30px; padding: 1px 5px;">검색</button>
					        </form>
					    </div>
					</div>
					<!-- 게시물 목록 뿌려주는곳 -->
			
				<div>	
				<c:if test="${list.size() == 0 }">
					<h3 style="color: red; margin: 30px;">해당 검색 결과에 맞는 게시물이 존재 하지 않습니다</h3>
				</c:if>
				<c:forEach items="${list }" var="recipe">
					<div class="col-md-3 m-wthree" style="margin-bottom : 20px; height: 340px;">
						<div class="col-m" style="margin-bottom: 20px; height: 340px;">
							<a href="${recipe.recipenum }" class="offer-img">
							 <img src="/resources/images/gooksu.jpg" class="img-responsive">
							</a>
							<div class="mid-1">
								<div class="women">
									<h6>
										<a href="${recipe.recipenum }" class="move"><c:out value="${recipe.title }"></c:out> </a>
									</h6>
								</div>
								<div class="mid-2">
									<p><c:out value="${recipe.userid }"></c:out> </p>
									<div class="block">
										<div class="starbox small ghosting"></div>
									</div>
									<div class="clearfix"></div>
									<hr>
									<div class="clearfix">
											<p style="height: 36px;"><c:out value="${recipe.cookingTag }"></c:out> </p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				</div>
			
				</div>
				
				<nav style="text-align: center;">
					<ul class="pagination">
					<c:if test="${pageMaker.prev }">
						<li class="pagePrevBtn"><a href="${pageMaker.startPage -1}" aria-label="Previous"> <span
								aria-hidden="true">«</span></a></li>
					</c:if>
					<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
						<li class="pageBtn ${pageMaker.cri.pageNum == num ? "active" : "" }"><a href="${num }">${num }</a></li>
					</c:forEach>
					<c:if test="${pageMaker.next }">
						<li class="pageNextBtn"><a href="${pageMaker.endPage +1}" aria-label="Next"><span
								aria-hidden="true">»</span></a></li>
					</c:if>
						
					</ul>
				</nav>
				 <!-- 실제 페이지를 클릭하면 동작을 하는 부분  -->
                 <form id="actionForm" action="/recipe/list" method="get">
                     <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
                     <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
     				 <input type="hidden" name="type" value="${pageMaker.cri.type }">
     				 <input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
                 </form>
                 
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp"></jsp:include>
<script>
	$(function(){
		var register = $("#regWriteBtn"); // 레시피 작성하기 버튼
		register.on("click",function(){ // 레시피 작성하기 버튼 클릭 시 진행
			location.href = '/recipe/register'; 
		});	
	});
	
	var recipeBoardCnt = '${pageMaker.total}';// 게시물의 div태그 갯수 저장
	$(".recipeBoardCount").html(recipeBoardCnt); // 게시물의 전체 갯수를 알리는 span태그의 내용을 변경
	
	var actionForm = $("#actionForm"); // 페이징 처리를 위해 전송할 폼 태그
	$(".pageBtn a").on("click", function(e){ // 페이징 버튼 숫자를 클릭시 진행
		e.preventDefault();
		console.log("click");
		actionForm.find("input[name='pageNum']").val($(this).attr("href")); // hidden태그의 페이지 번호를 클릭한 번호의 href속성값으로 변경
		actionForm.submit(); // 폼 전송
	});
	
	$(".offer-img").on("click",function(e){ // 게시물의 이미지 클릭 시 진행
		e.preventDefault();
		actionForm.append("<input type='hidden' name='recipenum' value='"+$(this).attr("href")+"'>");
		actionForm.attr("action","/recipe/get");
		actionForm.submit();
	});
	
	$(".move").on("click",function(e){ // 게시물의 제목 클릭 시 진행
		e.preventDefault();
		actionForm.append("<input type='hidden' name='recipenum' value='"+$(this).attr("href")+"'>");
		actionForm.attr("action","/recipe/get");
		actionForm.submit();
	});
	
	var searchForm = $("#searchForm"); // 검색 form 태그
	
	$("#searchForm button").on("click",function(e){ // 검색 버튼 클릭 시 진행
		if(!searchForm.find("option:selected").val()){ // 검색 종류가 선택되어있지 않을 때
			alert("검색 종류를 선택하세요");
			return false;
		}
	
		if(!searchForm.find("input[name='keyword']").val()) { // 키워드 입력이 안되었을 때
			alert("키워드를 입력하세요");
			return false;
		}
		
		searchForm.find("input[name='pageNum']").val("1"); // 검색후 페이지 번호는 1로 이동시키기위해
		e.preventDefault();
		
		searchForm.submit(); // 폼 전송
	});
</script>
<c:if test="${registerResult != null }"> <!-- 게시글 등록 시 null값이 아니게됨  -->
	<script>
		$(function(){
			var result = '${registerResult}';
			alert(result + " 게시글이 등록되었습니다");
		});
	</script>
</c:if>
<c:if test="${removeResult != null }"> <!-- 게시글 등록 시 null값이 아니게됨  -->
	<script>
		$(function(){
			var result = '${removeResult}';
			alert(result);
		});
	</script>
</c:if>
<c:if test="${modifyResult != null }"> <!-- 게시글 등록 시 null값이 아니게됨  -->
	<script>
		$(function(){
			var result = '${modifyResult}';
			alert(result);
		});
	</script>
</c:if>
</body>
</html>