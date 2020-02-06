<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 페이지</title>
<!-- //for-mobile-apps -->
<link href="/resources/css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="/resources/css/style.css" rel='stylesheet' type='text/css' />
</head>
<jsp:include page="include/header.jsp"></jsp:include>
<body>
<div class="banner-top">
	<div class="container">
		<h3>아이디 찾기</h3>
		<div class="clearfix"> </div>
	</div>
</div>
		<div class="login">
			<div class="main-agileits">
				<div class="form-w3agile">
					<h3>아이디 찾기</h3>
					<form action="/idSearch" method="post">
						<p style="font-size: 20px; margin-bottom: 10px;">이름</p>
						<div class="key">
							<i class="fa fa-envelope" aria-hidden="true"></i>
							<input  type="text" name="username">
							<div class="clearfix"></div>
						</div>
						<p style="font-size: 20px; margin-bottom: 10px;">이메일</p>
						<div class="key">
							<i class="fa fa-envelope" aria-hidden="true"></i>
							<input  type="text" name="usermail">
							<div class="clearfix"></div>
						</div>
						<input type="submit" value="찾기">
						<input type="button" value="취소" id="cancleBtn">
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
					</form>
				</div>
			</div>
		</div>

<script>
	$(function(){
		var cancle = $("#cancleBtn");
		cancle.on("click", function(e){
			e.preventDefault();
			location.href="/customLogin";
		});
	});
</script>

<c:if test="${searchResult != null }">
	<script>
		$(function(){
			alert("존재하는 아이디가 없습니다! 다시 확인바랍니다");
		});
	</script>
</c:if>

</body>
</html>