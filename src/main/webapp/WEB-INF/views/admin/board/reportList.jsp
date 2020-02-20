<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
	<span style="margin-left: 20px; font-weight: bold; font-size: 20px;">전체 레시피 게시물 신고 목록 (
	<span class="memberNum"> ${total } </span> )</span>
	
	<div style="margin-bottom: 20px;">
	</div>
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>글 번호</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th>신고자</th>
                  <th style="width: 15%;">관리</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach items="${rpList }" var="li">
                <tr>
                  <td>${li.recipenum }</td>
                  <td><a href="#" id="gotoRecipe" data-num="${li.recipenum }">${li.title }</a></td>
                  <td>${li.userid }</td>
                  <td>${li.reporter }</td>
                  <td><button class="btn btn-warning btn-xs" name="deleteRecipeSus" data-num="${li.recipenum }">게시물 삭제</button> </td>
                </tr>
              </c:forEach>
              </tbody>
            </table>
            
            <form action="/admin/getReportList" id="getForm">
            	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">
              	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
            </form>
            
            <div style="text-align: center;">
	            <ul class="pagination pagination">
	            <c:if test="${pageMaker.prev }">
	            	<li class="disabled"><a href="#"><span aria-hidden="true">«</span></a></li>
	            </c:if>
	            <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
	            	<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":"" }"><a href="${num }">${num }</a></li>
	            </c:forEach>	
				<c:if test="${pageMaker.next }">
					<li><a href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
				</c:if>
				</ul>
			</div>
			<form action="/admin/getReportList" method="get" id="reportPageForm">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
			</form>
</div>

<script>
	$(function(){
		var recipeDeleteSus = $("button[name='deleteRecipeSus']");
		recipeDeleteSus.on("click",function(e){
			e.preventDefault();
			
			var num = $(this).data("num");
			var csrfHeaderName = "${_csrf.headerName}";
			var csrfTokenValue = "${_csrf.token}";
			
			if(confirm('정말 게시물을 삭제 하시겠습니까?')){
				
				$.ajax({
					url : '/admin/removeReport',
					data : {recipenum : num},
					type : 'post',
					beforeSend : function(xhr)
			           {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
			              xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			           },
					success : function(result){
						if(result == 'ok'){
							alert(num + "번 의 게시물이 정상적으로 삭제처리 되었습니다.");
							$("#getForm").submit();
						}
					}
				});
				
			}
		});
		
		var reportPageForm = $("#reportPageForm");
		
		$(".paginate_button a").on("click", function(e){ // 페이지 버튼 클릭 시 진행
			e.preventDefault();
			reportPageForm.find("input[name='pageNum']").val($(this).attr("href"));
			reportPageForm.submit();
		});
		
		$("#gotoRecipe").on("click",function(e){ // 게시물 목록 클릭 시 진행
			e.preventDefault();
			
			var recipenum = $(this).data("num");
			
			location.href='/recipe/get?recipenum=' + recipenum + '';
		});
	});
</script>
</body>
</html>