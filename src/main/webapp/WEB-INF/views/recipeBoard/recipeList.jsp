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
						 <span class="recipeBoardCount">35</span>
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
							<li style="font-size: 14px;"><a href="">최신순</a></li>
							<li style="font-size: 14px;"><a href="">조회순</a></li>
							<li style="font-size: 14px;"><a href="">인기순</a></li>
						</ul>
						<div style="width: 100%; text-align: right; margin-bottom: 20px;">
					      	<form id="searchForm" action="" method="get">
					            <select name="type" style="height: 26px;">
					               <option value="">--------</option>
					               <option value="">닉네임</option>
					               <option value="">제목</option>
					               <option value="">태그</option>
					            </select>
					            <input type="text" name="keyword" style="width: 200px;">
					           <button class="btn btn-default" style="height: 30px; padding: 1px 5px;">검색</button>
					        </form>
					    </div>
					</div>
					<!-- 게시물 목록 뿌려주는곳 -->
			
				<div>	
				<c:forEach items="${list }" var="recipe">
					<div class="col-md-3 m-wthree" style="margin-bottom : 20px; height: 340px;">
						<div class="col-m" style="margin-bottom: 20px; height: 340px;">
							<a href="/recipe/get?recipenum=${recipe.recipenum }" class="offer-img">
							 <img src="/resources/images/gooksu.jpg" class="img-responsive">
							</a>
							<div class="mid-1">
								<div class="women">
									<h6>
										<a href="/recipe/get?recipenum=${recipe.recipenum }"><c:out value="${recipe.title }"></c:out> </a>
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
						<li><a href="#" aria-label="Previous"> <span
								aria-hidden="true">«</span></a></li>
						<li><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#" aria-label="Next"><span
								aria-hidden="true">»</span></a></li>
					</ul>
				</nav>
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
	
	var recipeBoardCnt = $(".col-m").length; // 게시물의 div태그 갯수 저장
	$(".recipeBoardCount").html(recipeBoardCnt); // 게시물의 전체 갯수를 알리는 span태그의 내용을 변경
	
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