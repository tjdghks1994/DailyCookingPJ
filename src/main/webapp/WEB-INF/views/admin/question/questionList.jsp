<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지 - 건의/문의 사항 목록</title>
<!-- //for-mobile-apps -->
<link href="/resources/css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="/resources/css/style.css" rel='stylesheet' type='text/css' />
</head>
<body>
<jsp:include page="../adminBar.jsp"></jsp:include>

<div class="bs-docs-example" style="position: relative; left: 10px; top: 30px; display: inline-block; width: 75%;">
	<span style="margin-left: 20px; font-weight: bold; font-size: 20px;">전체 건의/문의 사항 목록 (
	<span class="memberNum"> ${total } </span> )</span>
	<div style="margin-bottom: 20px;">
	</div>
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>번호</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th>문의/건의 한 날짜 </th>
                  <th style="width: 15%;">답변 상태</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach items="${qList }" var="li">
                <tr class="questionList" data-ti="${li.title }" data-id="${li.userid }" data-co="${li.content }" data-st="${li.status }"
                data-an="${li.answer }" data-num="${li.questionNum }">
                  <td>${li.questionNum }</td>
                  <td>${li.title }</td>
                  <td>${li.userid }</td>
                  <td><fmt:formatDate value="${li.questionDate }" pattern="yyyy-MM-dd"/> </td>
                  <td>
	                  <c:if test="${li.status eq 0 }">답변 대기중</c:if>
	                  <c:if test="${li.status eq 1 }">답변 완료</c:if>
                  </td>
                </tr>
              </c:forEach>
              </tbody>
            </table>
            
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
			<form action="/admin/getQuestionList" method="get" id="questionPageForm">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
			</form>
</div>

<!-- 관리자에게 건의/문의 모달 창 -->
              <div class="modal fade" id="myModal9" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                      <div class="modal-content">
                          <div class="modal-header">
                              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                              <h3 class="modal-title" style="color: #5bc0de;">관리자에게 문의/건의 하기</h3>
                          </div>
                          <div class="modal-body">
                        	
                        		<label>문의 / 건의 제목</label>
                        		<input class="form-control" name="title" readonly="readonly">
                        		<label>작성자</label>
						        <input class="form-control" name="userid" readonly="readonly">
						        <label>문의 / 건의 내용</label>
						        <textarea class="form-control" name="content" style="margin-bottom: 10px;">
						        
						        </textarea>	
                        		<div>
                        			<label>관리자 답변</label>
                        			<textarea class="form-control" name="answer" style="margin-bottom: 10px;"></textarea>
                        		</div>
                          </div>
                          <div class="modal-footer">
                          	  <button type="button" class="btn btn-info" id="modalAnswerBtn">답변하기</button>
                              <button type="button" class="btn btn-default" id="modalCloseBtn" data-dismiss="modal">닫기</button>
                          </div>
                      </div>
                      <!-- /.modal-content -->
                  </div>
                  <!-- /.modal-dialog -->
              </div>
              <!-- END 관리자에게 건의/문의 모달 창  -->   
              
<script>
$(function(){

		var question = $('.questionList');
		var modal9 = $('#myModal9');
		
		question.on("click",function(e){
			e.preventDefault();
			$('#myModal9').modal('show');
			var num = $(this).data("num");
			var csrfHeaderName = "${_csrf.headerName}";
			var csrfTokenValue = "${_csrf.token}";
			
			$("input[name='title']").val($(this).data("ti"));
			$("input[name='userid']").val($(this).data("id"));
			$("textarea[name='content']").html($(this).data("co"));
			$("textarea[name='content']").attr("readonly","readonly");
			
			if($(this).data("st") == 0){
				$("textarea[name='answer']").html("");
			} else {
				$("textarea[name='answer']").html($(this).data("an"));
				$("textarea[name='answer']").attr("readonly","readonly");
			}
			
			$("#modalAnswerBtn").on("click",function(e){ // 답변 완료시 진행
				
				$.ajax({
					url : '/admin/answerQuestion',
					data : {answer : $("textarea[name='answer']").val(), questionNum : num},
					type : 'post',
					beforeSend : function(xhr)
			           {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
			              xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			           },
					success : function(result){
						if(result == 'ok'){
							alert("문의/건의 사항에 답변을 완료했습니다");
							modal9.modal('hide');
							$("#questionPageForm").submit();
						}
					}
				});
			});
		});
		
	
		
		var questionPageForm = $("#questionPageForm");
		
		$(".paginate_button a").on("click", function(e){ // 페이지 버튼 클릭 시 진행
			e.preventDefault();
			questionPageForm.find("input[name='pageNum']").val($(this).attr("href"));
			questionPageForm.submit();
		});
});
</script>
</body>
</html>