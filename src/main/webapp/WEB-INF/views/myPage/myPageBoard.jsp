<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 게시물</title>
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
					<a href="/myPageInfo" class="forg2-left">회원 정보</a>
					<a href="#" class="forg2-left active">스크랩/작성 게시물</a>
					<a href="/myPageComment" class="forg2-left" id="joinLink">작성 댓글/관리자 문의 목록</a>
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
                <tr>
                  <td>1</td>
                  <td>아아아아</td>
                  <td>Test</td>
                  <td></td>
                </tr>
                <tr>
                  <td>2</td>
                  <td>우우우</td>
                  <td>Park</td>
                  <td></td>
                </tr>
                <tr>
                  <td>3</td>
                  <td>요요요</td>
                  <td>Yoo</td>
                  <td></td>
                </tr>
              </tbody>
            </table>
            <div style="text-align: center;">
	            <ul class="pagination pagination">
					<li class="disabled"><a href="#"><span aria-hidden="true">«</span></a></li>
					<li class="active"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
				</ul>
			</div>
</div>

<div class="bs-docs-example">
	<p style="margin: 20px; font-weight: bold; font-size: 20px;">작성 한 게시물</p>
	
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
                <tr>
                  <td>1</td>
                  <td>아아아아</td>
                  <td>Test</td>
                  <td></td>
                </tr>
                <tr>
                  <td>4</td>
                  <td>우우우</td>
                  <td>Test</td>
                  <td></td>
                </tr>
                <tr>
                  <td>6</td>
                  <td>요요요</td>
                  <td>Test</td>
                  <td></td>
                </tr>
              </tbody>
            </table>
            <div style="text-align: center;">
	            <ul class="pagination pagination">
					<li class="disabled"><a href="#"><span aria-hidden="true">«</span></a></li>
					<li class="active"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
				</ul>
			</div>
</div>

</body>
</html>