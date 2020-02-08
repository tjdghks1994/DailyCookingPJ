<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 등록 페이지</title>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<div class="banner-top">
		<div class="container">
			<h3>음식점 등록</h3>
			<div class="clearfix"></div>
		</div>
	</div>

	<div
		style="background-color: #EAEAEA; padding-top: 20px; padding-bottom: 20px;">
		<div class="recipeInsert">
			<div class="recipeDiv">
				<div class="recipeSemiDiv">
					<div>
						<p class="titles">제목</p>
						<input type="text" id="cokTitle" class="form-control"
							placeholder="제목을 작성해 주세요">
					</div>
					<p class="titles">사진을 추가해주세요</p>
					<div>
						<img src="images/ki.jpg"> 
						<img src="images/ki1.jpg">
						<img src="images/ki2.jpg">
					</div>
				</div>
			</div>
			<!--/cont_box-->
			<div class="recipeSemiDiv2">
				<div>
					<p class="titles">음식점 검색</p>
					<input type="text" id="cokTitle" class="form-control"
						placeholder="음식점 이름을 적어주세요">
				</div>
				<div class="location_food form-control step_cont">
					<!-- 지도 표시할 div  -->
					지도를 표시해야되는데 어케하누 시발
				</div>
				<div>
					<p class="titles">간단한 후기를 작성해 주세요</p>
					<textarea class="form-control step_cont" placeholder="예) 든든한 국밥보다는 탐짜면!"></textarea>
				</div>
				<div>
					<p class="titles">태그</p>
					<input type="text" class="form-control"
						placeholder="예) 중국집,진짜루?,맛잇,동교로맛집"> <span
						style="display: block; padding-bottom: 20px; padding-top: 10px;">
						주재료,목적, 효능, 대상 등을 태그로 남겨주세요.</span>
				</div>
			</div>
			<!--recipeSemiDiv2-->
			<div class="recipeBtn">
				<input type="submit" value="글 등록"> <input type="button"
					value="취소" id="cancleBtn">
			</div>
		</div>
		<!--/recipe Div -->
	</div>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>

</html>