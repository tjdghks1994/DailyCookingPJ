<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지 - 레시피 게시판 신고 목록</title>
<!-- //for-mobile-apps -->
<link href="/resources/css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="/resources/css/style.css" rel='stylesheet' type='text/css' />
</head>
<body>
<jsp:include page="../adminBar.jsp"></jsp:include>

<div class="bs-docs-example" style="position: relative; left: 10px; top: 30px; display: inline-block; width: 75%;">
	<span style="margin-left: 20px; font-weight: bold; font-size: 20px;">전체 레시판 신고 목록 (
	<span class="memberNum"> 3 </span> )</span>
	<div class="searchDiv">
      	<form id="searchForm" action="" method="get">
            <select name="type" style="height: 26px;">
               <option value="">닉네임</option>
               <option value="">제목</option>
            </select>
            <input type="text" name="keyword">
           <button class="btn btn-default" style="height: 30px; padding: 1px 5px;">검색</button>
        </form>
    </div>
	<div style="margin-bottom: 20px;">
	</div>
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>글 번호</th>
                  <th>제목</th>
                  <th>닉네임</th>
                  <th>신고 사유</th>
                  <th style="width: 15%;">관리</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1</td>
                  <td><a href="/recipeGet" target="_blank">메롱 ~~~~</a></td>
                  <td>크흐흐흐</td>
                  <td>전혀 관계없는 게시물 입니다</td>
                  <td><button class="btn btn-warning btn-xs" name="deleteRecipeSus">게시물 삭제</button> </td>
                </tr>
                <tr>
                  <td>2</td>
                  <td>도박 사이트 추천합니다~~~~다들 오세요!</td>
                  <td>토토쟁이</td>
                  <td>불법 사이트를 홍보합니다 게시물 삭제 해주세요</td>
                  <td><button class="btn btn-warning btn-xs" name="deleteRecipeSus">게시물 삭제</button></td>
                </tr>
                <tr>
                  <td>3</td>
                  <td>성인 사이트 공유합니다 컴온~~!</td>
                  <td>AV배우가될꺼야</td>
                  <td>음란물 사이트를 공유하고있어요 처리 부탁합니다.</td>
                  <td><button class="btn btn-warning btn-xs" name="deleteRecipeSus">게시물 삭제</button></td>
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

<script>
	$(function(){
		var recipeDeleteSus = $("button[name='deleteRecipeSus']");
		recipeDeleteSus.on("click",function(e){
			e.preventDefault();
			
			confirm('정말 게시물을 삭제 하시겠습니까?');
		});
	});
</script>
</body>
</html>