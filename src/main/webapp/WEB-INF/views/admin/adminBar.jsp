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
				<a href="/adminMemberList" class="menuList">회원 목록</a>
				<a href="/adminSuspendMember" class="menuList" style="margin-bottom: 10px;">정지회원 목록</a>
			</div>
			<div class="menuItemDiv">
				<p class="menuItem">게시물 관리</p>
				<a href="#" class="menuList">레시피 게시판 목록</a>
				<a href="#" class="menuList" style="margin-bottom: 10px;">추천음식점 게시판 목록</a>
			</div>
			<div class="menuItemDiv">
				<p class="menuItem">문의/건의사항</p>
				<a href="#" class="menuList" style="margin-bottom: 10px;">문의/건의사항 목록</a>
			</div>
			<div class="menuItemDiv">
				<p class="menuItem">관리자 정보</p>
				<a href="#" class="menuList" style="margin-bottom: 10px;">정보 수정하기</a>
			</div>
			<div style="height: 350px;">
			
			</div>
		</div>
	</div>
	
	<!-- for bootstrap working -->
<script src="/resources/js/bootstrap.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</body>

</html>