<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지 - 정지회원 목록</title>
<!-- //for-mobile-apps -->
<link href="/resources/css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="/resources/css/style.css" rel='stylesheet' type='text/css' />
</head>
<body>
<jsp:include page="../adminBar.jsp"></jsp:include>

<div class="bs-docs-example" style="position: relative; left: 10px; top: 30px; display: inline-block; width: 75%;">
	<span style="margin-left: 20px; font-weight: bold; font-size: 20px;">정지 회원 목록 ( 
	<span class="suspendNum"> ${count } </span> )</span>
	
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
              <c:forEach items="${bList }" var="bList" varStatus="status">
                <tr>
                  <td><a href="#" class="suspendMemberInfo"  data-id="${mList[status.index].userid }" data-na="${mList[status.index].username }"
	                  data-ni="${mList[status.index].nickname }" data-ma="${mList[status.index].usermail }" data-rd='<fmt:formatDate value="${mList[status.index].regDate }" pattern="yyyy-MM-dd"/>' data-su="${mList[suspension.index] }">
	                	${bList.userid }</a>
	               </td>
                  <td><fmt:formatDate value="${bList.suspensionDate }" pattern="yyyy-MM-dd"/> </td>
                  <td>활동 정지</td>
                  <td><button class="btn btn-warning btn-xs" id="freezeBtn" data-id="${bList.userid }">정지 해제</button> </td>
                </tr>
              </c:forEach> 
              </tbody>
            </table>
            
             <form action="/admin/susList" id="susForm">
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
			<form action="/admin/susList" method="get" id="susPageForm">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
			</form>
			
			
			<!-- 회원 정보 모달 창 -->
              <div class="modal fade" id="myModal13" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
</div>

<script>
	$(function(){
		
		var modal13 = $('#myModal13');
		var suspendMember = $('.suspendMemberInfo');
		suspendMember.on('click',function(e){
			e.preventDefault();
			
			$("#infoId").val($(this).data("id"));
			$("input[name='username']").val($(this).data("na"));
			$("input[name='nickname']").val($(this).data("ni"));
			$("input[name='usermail']").val($(this).data("ma"));
			$("input[name='regDate']").val($(this).data("rd"));
			$("input[name='suspension']").val('활동 정지된 회원입니다');
			
			modal13.modal('show');
		});
		
		$("#freezeBtn").on("click",function(e){
			var userid = $(this).data("id");
			var csrfHeaderName = "${_csrf.headerName}";
			var csrfTokenValue = "${_csrf.token}";
			
			e.preventDefault();
			if(confirm("정말 정지를 해제 하시겠습니까?")){
				$.ajax({
					url : '/admin/susFreeze',
					data : {userid : userid},
					type : 'post',
					beforeSend : function(xhr)
			           {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
			              xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			           },
			        success : function(result){
			        	if(result == 'ok'){
			        		alert("정상적으로 정지가 해제되었습니다");
			        		$("#susForm").submit();
			        	}
			        }
				});
			}
		
		});
	});
</script>
</body>
</html>