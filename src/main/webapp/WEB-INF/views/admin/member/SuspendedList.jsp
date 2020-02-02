<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<span class="suspendNum"> 5 </span> )</span>
	<div class="searchDiv">
      	<form id="searchForm" action="" method="get">
            <select name="type" style="height: 26px;">
               <option value="">ID</option>
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
                  <th>아이디</th>
                  <th>가입일</th>
                  <th>정지 여부</th>
                  <th style="width: 15%;">관리</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td><a href="#" class="suspendMemberInfo"> dasdf11</a></td>
                  <td>2020/01/01</td>
                  <td>활동정지</td>
                  <td><button class="btn btn-warning btn-xs" name="suspendBtn">정지 해제</button> </td>
                </tr>
                <tr>
                  <td>asdfasdf</td>
                  <td>2020/01/02</td>
                  <td>활동정지</td>
                  <td><button class="btn btn-warning btn-xs" name="suspendBtn">정지 해제</button></td>
                </tr>
                <tr>
                  <td>asdf2314</td>
                  <td>2020/01/03</td>
                  <td>활동정지</td>
                  <td><button class="btn btn-warning btn-xs" name="suspendBtn">정지 해제</button></td>
                </tr>
                 <tr>
                  <td>asdfzxcv12</td>
                  <td>2020/01/03</td>
                  <td>활동정지</td>
                  <td><button class="btn btn-warning btn-xs" name="suspendBtn">정지 해제</button></td>
                </tr> <tr>
                  <td>user02</td>
                  <td>2020/01/03</td>
                  <td>활동정지</td>
                  <td><button class="btn btn-warning btn-xs" name="suspendBtn">정지 해제</button></td>
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
						            <input class="form-control" type="text" readonly="readonly" value="dasdf11">
						          </div>
						          <div class="form-group">
						            <label>이름</label>
						            <input class="form-control" type="text" readonly="readonly" value="최영우">
						          </div>
						          <div class="form-group">
						            <label>닉네임</label>
						            <input class="form-control" type="text" readonly="readonly" value="진주love영우">
						          </div>
						          <div class="form-group">
						            <label>이메일</label>
						            <input class="form-control" type="text" readonly="readonly" value="youngwoo@naver.com">
						          </div>
						          <div class="form-group">
						            <label>가입 일자</label>
						            <input class="form-control" type="text" readonly="readonly" value="2020/01/01">
						          </div>
						          <div class="form-group">
						            <label>정지 여부</label>
						            <input class="form-control" type="text" readonly="readonly" value="정지 된 아이디 입니다.">
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
		var memberDelete = $("button[name='suspendBtn']");
		memberDelete.on("click",function(e){
			e.preventDefault();
			
			confirm('정말 정지를 해제 하시겠습니까?');
		});
		
		var modal13 = $('#myModal13');
		var suspendMember = $('.suspendMemberInfo');
		suspendMember.on('click',function(e){
			e.preventDefault();
			
			modal13.modal('show');
		});
	});
</script>
</body>
</html>