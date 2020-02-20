<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 사이드 메뉴 바, 상단 바</title>
<!-- //for-mobile-apps -->
<link href="/resources/css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="/resources/css/style.css" rel='stylesheet' type='text/css' />
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<!-- start-smoth-scrolling -->
<link href="/resources/css/font-awesome.css" rel="stylesheet"> 
<link href='//fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Noto+Sans:400,700' rel='stylesheet' type='text/css'>

<script src="/resources/js/jquery-1.11.1.min.js"></script>
</head>
<body>
	<div class="adminHeader">
		<img src="/resources/images/logo.png" class="adminHeaderLogo">
		<span style="color: white; margin-left: 15px; font-size: 20px;">Daily Cooking </span>
		<div style="padding-top: 25px; display: inline-block;">
		<a href="#" style="color: white; font-size: 20px; margin-left: 15px;">관리자 페이지</a>
		</div>
	</div>
	
	<div class="adminSideBar">
		<div class="adminMenu">
			<div class="menuItemDiv">
				<p class="menuItem">회원 관리</p>
				<form action="/admin/memberList" id="memTagForm">
				<a href="#" class="menuList ${mBold }" id="memListTag">회원 목록</a>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">
              		<input type="hidden" name="pageNum" value="1">
					<input type="hidden" name="amount" value="10">
				</form>
				
				<form action="/admin/susList" id="susTagForm">
				<a href="#" class="menuList ${sBold }" id="susListTag" style="margin-bottom: 10px;">정지회원 목록</a>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">
              		<input type="hidden" name="pageNum" value="1">
					<input type="hidden" name="amount" value="10">
				</form>
			</div>
			<div class="menuItemDiv">
				<p class="menuItem">게시물 관리</p>
				<form action="/admin/getRecipeList" id="recipeTagForm">
				<a href="#" class="menuList ${rBold }" id="recipeListTag" style="margin-bottom: 10px;">레시피 게시판 목록</a>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">
              		<input type="hidden" name="pageNum" value="1">
					<input type="hidden" name="amount" value="10">
				</form>
				<form action="/admin/getReportList" id="reportTagForm">
				<a href="#" class="menuList ${rpBold }" id="reportListTag" style="margin-bottom: 10px;">레시피 게시판 신고 목록</a>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">
              		<input type="hidden" name="pageNum" value="1">
					<input type="hidden" name="amount" value="10">
				</form>
				<a href="/adminStore" class="menuList">추천음식점 게시판 목록</a>
				<a href="/adminSuspendStore" class="menuList" style="margin-bottom: 10px;">추천음식점 게시판 신고 목록</a>
			</div>
			<div class="menuItemDiv">
				<p class="menuItem">문의/건의사항</p>
				<form action="/admin/getQuestionList" id="questionTagForm">
				<a href="#" class="menuList ${qBold }" id="questionListTag" style="margin-bottom: 10px;">문의/건의사항 목록</a>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">
              		<input type="hidden" name="pageNum" value="1">
					<input type="hidden" name="amount" value="10">
				</form>
			</div>
			<div class="menuItemDiv">
				<p class="menuItem">관리자 정보</p>
				<a href="/admin/info ${aBold }" class="menuList" style="margin-bottom: 10px;">정보 수정하기</a>
			</div>
			<div style="height: 350px;">
			
			</div>
		</div>
	</div>
	
	<!-- for bootstrap working -->
<script src="/resources/js/bootstrap.js"></script>
</body>

<script>
	$("#memListTag").on("click",function(e){
		$("#memTagForm").submit();
	});
	
	$("#susListTag").on("click",function(e){
		$("#susTagForm").submit();
	});
	$("#recipeListTag").on("click",function(e){
		$("#recipeTagForm").submit();
	});
	$("#reportListTag").on("click",function(e){
		$("#reportTagForm").submit();
	})
	$("#questionListTag").on("click",function(e){
		$("#questionTagForm").submit();
	});
</script>
</html>