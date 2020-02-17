<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home</title>
</head>
<body>
	<jsp:include page="include/header.jsp"></jsp:include>
	<div class="searchDivImg">
		<div class="container">
			<div class="banner-info">
			</div>
		</div>
	</div>

	<script src="js/jquery.vide.min.js"></script>
	<div class="content-top">
		<div class="container ">
			<div class="spec ">
				<h3>TOP 4</h3>
				<div class="ser-t">
					<b></b> <span><i></i></span> <b class="line"></b>
				</div>
			</div>
			<div class="tab-pane active text-style" id="tab1">
				<div class=" con-w3l">
				<c:forEach items="${topList }" var="top">
					<div class="col-md-3 m-wthree" style="margin-bottom : 20px; height: 340px;">
						<div class="col-m" style="margin-bottom: 20px; height: 340px;">
							<a href="${top.recipenum }" class="offer-img">
							 <img src="/resources/images/gooksu.jpg" class="img-responsive">
							</a>
							<div class="mid-1">
								<div class="women">
									<h6>
										<a href="${top.recipenum }" class="move"><c:out value="${top.title }"></c:out> </a>
									</h6>
								</div>
								<div class="mid-2">
									<p><c:out value="${top.userid }"></c:out> </p>
									<div class="block">
										<div class="starbox small ghosting"></div>
									</div>
									<div class="clearfix"></div>
									<hr>
									<div class="clearfix">
											<p style="height: 36px;"><c:out value="${top.cookingTag }"></c:out> </p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>	
				</div>
			</div>
		</div>
	</div>
	
	<div class="product">
		<div class="container">
			<div class="spec ">
				<h3>최근 등록된 레시피</h3>
				<div class="ser-t">
					<b></b> <span><i></i></span> <b class="line"></b>
				</div>
			</div>
			<div class="tab-pane active text-style" id="tab1">
			<div class=" con-w3l">
			<c:forEach items="${list }" var="list">
					<div class="col-md-3 m-wthree" style="margin-bottom : 20px; height: 340px;">
						<div class="col-m" style="margin-bottom: 20px; height: 340px;">
							<a href="${list.recipenum }" class="offer-img">
							 <img src="/resources/images/gooksu.jpg" class="img-responsive">
							</a>
							<div class="mid-1">
								<div class="women">
									<h6>
										<a href="${list.recipenum }" class="move"><c:out value="${list.title }"></c:out> </a>
									</h6>
								</div>
								<div class="mid-2">
									<p><c:out value="${list.userid }"></c:out> </p>
									<div class="block">
										<div class="starbox small ghosting"></div>
									</div>
									<div class="clearfix"></div>
									<hr>
									<div class="clearfix">
											<p style="height: 36px;"><c:out value="${list.cookingTag }"></c:out> </p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>	
				</div>
			</div>
		</div>
	</div>
	
	<form id="actionForm" method="get">
	</form>
	
	<script>
		var actionForm = $("#actionForm");
	
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
	</script>
</body>
</html>