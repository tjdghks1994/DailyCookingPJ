<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지 - 레시피 게시판 목록</title>
<!-- //for-mobile-apps -->
<link href="/resources/css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="/resources/css/style.css" rel='stylesheet' type='text/css' />
</head>
<body>
<jsp:include page="../adminBar.jsp"></jsp:include>

<div class="bs-docs-example" style="position: relative; left: 10px; top: 30px; display: inline-block; width: 75%;">
	<span style="margin-left: 20px; font-weight: bold; font-size: 20px;">전체 레시판 게시물 목록 (
	<span class="memberNum"> 5 </span> )</span>
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
                  <th>작성자(닉네임)</th>
                  <th style="width: 15%;">관리</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1</td>
                  <td><a href="/recipeGet" target="_blank">부대찌개 존맛탱 레시피</a></td>
                  <td>요리사가될거야</td>
                  <td><button class="btn btn-warning btn-xs" name="deleteRecipe">게시물 삭제</button> </td>
                </tr>
                <tr>
                  <td>2</td>
                  <td>치즈김치볶음밥 황금 레시피</td>
                  <td>원주토박이</td>
                  <td><button class="btn btn-warning btn-xs" name="deleteRecipe">게시물 삭제</button></td>
                </tr>
                <tr>
                  <td>3</td>
                  <td>김치찌개 JMT 레시피</td>
                  <td>그루트</td>
                  <td><button class="btn btn-warning btn-xs" name="deleteRecipe">게시물 삭제</button></td>
                </tr>
                 <tr>
                  <td>4</td>
                  <td>꿀맛 보장하는 화채</td>
                  <td>백종원아들</td>
                  <td><button class="btn btn-warning btn-xs" name="deleteRecipe">게시물 삭제</button></td>
                </tr> <tr>
                  <td>5</td>
                  <td>안주로 먹기에 좋은 골뱅이 소면 레시피 입니다</td>
                  <td>술꾼</td>
                  <td><button class="btn btn-warning btn-xs" name="deleteRecipe">게시물 삭제</button></td>
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
		var recipeDelete = $("button[name='deleteRecipe']");
		recipeDelete.on("click",function(e){
			e.preventDefault();
			
			confirm('정말 게시물을 삭제 하시겠습니까?');
		});
	});
</script>
</body>
</html>