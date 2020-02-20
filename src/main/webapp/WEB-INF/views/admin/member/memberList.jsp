<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지 - 회원 목록</title>
<!-- //for-mobile-apps -->
<link href="/resources/css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="/resources/css/style.css" rel='stylesheet' type='text/css' />
</head>
<body>
<jsp:include page="../adminBar.jsp"></jsp:include>

<div class="bs-docs-example" style="position: relative; left: 10px; top: 30px; display: inline-block; width: 75%;">
	<span style="margin-left: 20px; font-weight: bold; font-size: 20px;">전체 회원 목록 (
	<span class="memberNum"> ${count } </span> )</span>
	
	<div style="margin-bottom: 20px;">
	</div>
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>아이디</th>
                  <th>가입일</th>
                  <th>정지 여부</th>
                  <th style="width: 15%;">관리</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${mList }" var="mList">
                   <tr>
	                  <td><a href="#" class="memberInfoCheck" data-id="${mList.userid }" data-na="${mList.username }"
	                  data-ni="${mList.nickname }" data-ma="${mList.usermail }" data-rd='<fmt:formatDate value="${mList.regDate }" pattern="yyyy-MM-dd"/>' data-su="${mList.suspension }">
	                	${mList.userid }</a></td>
	                  <td><fmt:formatDate value="${mList.regDate }" pattern="yyyy-MM-dd"/></td>
	                  <td><c:if test="${mList.suspension eq 0 }"> 활동 가능 </c:if>
	                  	  <c:if test="${mList.suspension eq 1 }"> 활동 정지</c:if>	
	                  </td>
	                  <td style="width: 25%;">
	                  	  <button class="btn btn-warning btn-xs" name="deleteBtn" data-mem="${mList.userid }" style="display: inline; ">회원 탈퇴</button>
	                  	  <c:if test="${mList.suspension eq 0 }"> 
	                  	  <button class="btn btn-warning btn-xs" name="susBtn" data-mem="${mList.userid }" style="display: inline; margin-left: 10px;">회원 정지</button>	
	                      </c:if>
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
			<form action="/admin/memberList" method="get" id="memberPageForm">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
			</form>
			
			<!-- 회원 정보 모달 창 -->
              <div class="modal fade" id="myModal12" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                      <div class="modal-content">
                          <div class="modal-header">
                              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                              <h3 class="modal-title" id="myModalLabel">회원정보</h3>
                          </div>
                          <div class="modal-body">
                        		<form><div class="form-group">
						            <label>아이디</label>
						            <input class="form-control" id="infoId" name="userid" type="text" readonly="readonly">
						          </div>
						          <div class="form-group">
						            <label>이름</label>
						            <input class="form-control" name="username" type="text" readonly="readonly">
						          </div>
						          <div class="form-group">
						            <label>닉네임</label>
						            <input class="form-control" name="nickname" type="text" readonly="readonly">
						          </div>
						          <div class="form-group">
						            <label>이메일</label>
						            <input class="form-control" name="usermail" type="text" readonly="readonly">
						          </div>
						          <div class="form-group">
						            <label>가입 일자</label>
						            <input class="form-control" name="regDate" type="text" readonly="readonly">
						          </div>
						          <div class="form-group">
						            <label>정지 여부</label>
						            <input class="form-control" name="suspension" type="text" readonly="readonly">
						          </div>
						        </form>
                          </div>
                          <div class="modal-footer">
                              <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                          </div>
                      </div>
                      <!-- /.modal-content -->
                  </div>
                  <!-- /.modal-dialog -->
              </div>
              <!-- END 회원정보 모달 창  -->
              
              <!-- 회원 정지 모달 창 -->
              <div class="modal fade" id="myModal14" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                      <div class="modal-content">
                          <div class="modal-header">
                              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                              <h3 class="modal-title" id="myModalLabel">회원 정지</h3>
                          </div>
                          <div class="modal-body">
                        		<form><div class="form-group">
						            <label>아이디</label>
						            <input class="form-control" id="susId" name="userid" type="text" readonly="readonly">
						          </div>
						          <div class="form-group">
						            <label>정지 사유</label>
						            <input class="form-control" name="reason" type="text" placeholder="간단하게 입력하세요">
						          </div>
						        </form>
                          </div>
                          <div class="modal-footer">
                          	  <button type="button" class="btn btn-warning" id="goSus">회원 정지 시키기</button>
                              <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                          </div>
                      </div>
                      <!-- /.modal-content -->
                  </div>
                  <!-- /.modal-dialog -->
              </div>
              <!-- END 회원정지 모달 창  -->
              
              <form action="/admin/memberList" id="susForm">
              		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">
              		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
              </form>
</div>

<script>
	$(function(){
		var memberDelete = $("button[name='deleteBtn']");
		memberDelete.on("click",function(e){
			e.preventDefault();
			
			var userid = $(this).data("mem");
			var csrfHeaderName = "${_csrf.headerName}";
			var csrfTokenValue = "${_csrf.token}";
			
			if(confirm('정말 회원을 탈퇴 시키겠습니까?')){ // 예 를 누르면 진행
				$.ajax({
					url : '/admin/removeMember',
					data :{ userid : userid },
					type : 'post',
					beforeSend : function(xhr)
			           {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
			              xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			           },
					success : function(result){
						if(result == 'removeOk'){
							alert('회원이 정상적으로 탈퇴 처리 되었습니다.');
							modal12.modal("hide");
							$("#removeId").val(userid);
							$("#removeForm").submit();
						}
					}
				}); //END ajax()
			}
		});
		
		var modal12 = $('#myModal12');
		var memberInfoCheck = $('.memberInfoCheck');
		
		memberInfoCheck.on('click', function(e){ // 회원 목록에서 회원 아이디 클릭 시 진행
			e.preventDefault();
			
			$("#infoId").val($(this).data("id"));
			$("input[name='username']").val($(this).data("na"));
			$("input[name='nickname']").val($(this).data("ni"));
			$("input[name='usermail']").val($(this).data("ma"));
			$("input[name='regDate']").val($(this).data("rd"));
			var suspension = null;
			if($(this).data("su") == 0){
				suspension = '활동 가능'
			} else {
				suspension = '활동 정지'
			}
			
			$("input[name='suspension']").val(suspension);
			
			modal12.modal("show");
		});
		
		var memberPageForm = $("#memberPageForm");
		
		$(".paginate_button a").on("click", function(e){ // 댓글 페이지 버튼 클릭 시 진행
			e.preventDefault();
			memberPageForm.find("input[name='pageNum']").val($(this).attr("href"));
			memberPageForm.submit();
		});
		
		var modal14 = $("#myModal14");
		
		$("button[name='susBtn']").on("click",function(e){
			
			$("#susId").val($(this).data("mem"));
			modal14.modal("show");
			
			var susId = $(this).data("mem");
			
			$("#goSus").on("click",function(e){
				var csrfHeaderName = "${_csrf.headerName}";
				var csrfTokenValue = "${_csrf.token}";
				
				if(confirm('정말 회원을 정지 시키겠습니까?')){ // 예 를 누르면 진행
					$.ajax({
						url : '/admin/susMember',
						data :{ userid : susId , reason : $("input[name='reason']").val() },
						type : 'post',
						beforeSend : function(xhr)
				           {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				              xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				           },
						success : function(result){
							if(result == 'ok'){
								alert('회원이 정상적으로 정지 되었습니다');
								modal14.modal("hide");
								$("#susForm").submit();
							}
						}
					}); //END ajax()
				} // END if confirm();
			}); // END goSus();
		}); // END susBtn();
		
		
	});
</script>
</body>
</html>