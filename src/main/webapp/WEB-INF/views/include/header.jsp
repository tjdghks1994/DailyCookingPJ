<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
<!-- //for-mobile-apps -->
<link href="/resources/css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="/resources/css/style.css" rel='stylesheet' type='text/css' />
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<!-- js -->
<script src="/resources/js/jquery-1.11.1.min.js"></script>
<!-- //js -->
<!-- start-smoth-scrolling -->
<script type="text/javascript" src="/resources/js/move-top.js"></script>
<script type="text/javascript" src="/resources/js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
</script>
<!-- start-smoth-scrolling -->
<link href='//fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Noto+Sans:400,700' rel='stylesheet' type='text/css'>

</head>
<div class="header">
		<sec:authorize access="isAuthenticated()">
		<div class="small-menu2">
			<h5><a id="questionLink">관리자에게 문의/건의 하기</a> </h5>
		</div>
		</sec:authorize>
		<div class="small-menu">
			<sec:authorize access="isAnonymous()">
				<h5><a href="/customLogin">로그인</a><label>/</label><a href="#" id="joinLink2">회원가입</a></h5>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
			<form action="/customLogout" method="post" style="display: inline;" class="logoutForm">
				<h5 style="display: inline;"><a href="#" class="logoutLink">로그아웃</a></h5>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">
			</form>
				<h5 style="display: inline;"><label>/</label><a href="#" id="joinLink2">마이페이지</a></h5>
			</sec:authorize>
		</div>
		<div class="container">
			<div class="logo">
				<h1><a href="index.html"><img src="/resources/images/logo.png" class="logoImg"> 
										Daily Cooking</a></h1>
			</div>

				<div class="nav-top">
					<nav class="navbar navbar-default" style="width: 100%; margin-top: 30px;">
					
					<div class="navbar-header nav_2">
						<button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						

					</div> 
					<div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
						<ul class="nav navbar-nav ">
							<li class="dropdown"><a href="index" class="hyper"><span>Home</span></a></li>	
							<li class="dropdown">
								<a href="#" class="hyper" id="menuRec"><span>메뉴 추천</span></a>
							</li>
							<li class="dropdown">
								<a href="/recipe/list" class="hyper"><span> 음식 레시피  </span></a>
							</li>
							<li class="dropdown">
								<a href="#" class="hyper"><span>추천 음식점</span></a>
							</li>
						</ul>
					</div>
					</nav>
				</div>
					
				</div>			
</div>
<!-- 회원가입 약관 모달 창 -->
              <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                      <div class="modal-content">
                          <div class="modal-header">
                              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                              <h3 class="modal-title" id="myModalLabel">회원가입 약관</h3>
                          </div>
                          <div class="modal-body">
                        		<textarea rows="20" cols="75">
정보통신망법 규정에 따라 Daily Cooking에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.

1. 수집하는 개인정보
이용자는 회원가입을 하지 않아도 정보 검색, 게시판 보기 등 대부분의 오늘뭐먹지 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 게시글 추천, 댓글, 게시글 작성 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 오늘뭐먹지는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.
회원가입 시점에 오늘뭐먹지가 이용자로부터 수집하는 개인정보는 아래와 같습니다.
- 회원 가입 시에 ‘아이디, 비밀번호, 이름, 이메일, 휴대전화번호’를 필수항목으로 수집합니다.  그리고 선택항목으로 이메일 주소, 프로필 정보를 수집합니다. 
서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다.
오늘뭐먹지 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다. 추가로 개인정보를 수집할 경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를 받습니다.
구체적으로 1) 서비스 이용 과정에서 이용자에 관한 정보를 자동화된 방법으로 생성하여 이를 저장(수집)하거나, 
2) 이용자 기기의 고유한 정보를 원래의 값을 확인하지 못 하도록 안전하게 변환하여 수집합니다. 서비스 이용 과정에서 위치정보가 수집될 수 있으며,
이와 같이 수집된 정보는 개인정보와의 연계 여부 등에 따라 개인정보에 해당할 수 있고, 개인정보에 해당하지 않을 수도 있습니다. 

2. 수집한 개인정보의 이용
Daily Cooking의 회원관리, 서비스 개발・제공 및 향상, 안전한 인터넷 이용환경 구축 등 아래의 목적으로만 개인정보를 이용합니다.
- 회원 가입 의사의 확인,  이용자 식별, 회원탈퇴 의사의 확인 등 회원관리를 위하여 개인정보를 이용합니다.
- 콘텐츠 등 기존 서비스 제공(광고 포함)에 더하여, 인구통계학적 분석, 서비스 방문 및 이용기록의 분석, 개인정보 및 관심에 기반한 이용자간 관계의 형성, 지인 및 관심사 등에 기반한 맞춤형 서비스 제공 등 신규 서비스 요소의 발굴 및 기존 서비스 개선 등을 위하여 개인정보를 이용합니다.
- 법령 및 네이버 이용약관을 위반하는 회원에 대한 이용 제한 조치, 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재, 계정도용 및 부정거래 방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록 보존, 민원처리 등 이용자 보호 및 서비스 운영을 위하여 개인정보를 이용합니다.
- 유료 서비스 제공에 따르는 본인인증, 구매 및 요금 결제, 상품 및 서비스의 배송을 위하여 개인정보를 이용합니다.
- 이벤트 정보 및 참여기회 제공, 광고성 정보 제공 등 마케팅 및 프로모션 목적으로 개인정보를 이용합니다.
- 서비스 이용기록과 접속 빈도 분석, 서비스 이용에 대한 통계, 서비스 분석 및 통계에 따른 맞춤 서비스 제공 및 광고 게재 등에 개인정보를 이용합니다.
- 보안, 프라이버시, 안전 측면에서 이용자가 안심하고 이용할 수 있는 서비스 이용환경 구축을 위해 개인정보를 이용합니다.

3. 개인정보의 파기
Daily Cooking은 원칙적으로 이용자의 개인정보를 회원 탈퇴 시 지체없이 파기하고 있습니다.                			
                        		</textarea>
                          </div>
                          <div class="modal-footer">
							  <input type="checkbox" class="forg-left" id="joinCk"> 
							  <label class="forg-left">회원가입 약관에 동의합니다</label>					
                              <button type="button" class="btn btn-info" id="joinBtn">회원가입</button>
                              <button type="button" class="btn btn-default" id="modalCloseBtn" data-dismiss="modal">취소</button>
                          </div>
                      </div>
                      <!-- /.modal-content -->
                  </div>
                  <!-- /.modal-dialog -->
              </div>
              <!-- END 회원가입 약관 모달 창  -->
              
              
        <!-- 메뉴 추천 모달 창 -->
              <div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                      <div class="modal-content">
                          <div class="modal-header">
                              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                              <h3 class="modal-title" style="color: #5bc0de;">회원님을 위한 오늘의 추천 음식</h3>
                          </div>
                          <div class="modal-body">
                        		<img src="/resources/images/gooksu.jpg" class="recImg">
                        		<p class="recName">잔치 국수</p>
                          </div>
                          <div class="modal-footer">
							  <a href="#" class="recLink">추천 음식 레시피 보러 가기</a>
                          </div>
                      </div>
                      <!-- /.modal-content -->
                  </div>
                  <!-- /.modal-dialog -->
              </div>
              <!-- END 메뉴추천 모달 창  -->
              
             <sec:authorize access="isAuthenticated()">
              
              <sec:authentication property="principal" var="principal"/>
              
             </sec:authorize>
          <!-- 관리자에게 건의/문의 모달 창 -->
              <div class="modal fade" id="myModal6" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                      <div class="modal-content">
                          <div class="modal-header">
                              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                              <h3 class="modal-title" style="color: #5bc0de;">관리자에게 문의/건의 하기</h3>
                          </div>
                          <div class="modal-body">
                        	<form action="/questionInsert" method="post" name="questionForm">
                        		<label>문의 / 건의 제목</label>
                        		<input class="form-control" name="title" id="questionTitle">
                        		<label>작성자</label>
						        <input class="form-control" value="${principal.username }" name="userid" readonly="readonly">
						        <label>문의 / 건의 내용</label>
						        <textarea class="form-control" name="content" id="questionContent" style="margin-bottom: 10px;"></textarea>	
                        	</form>
                          </div>
                          <div class="modal-footer">
							  <button type="button" class="btn btn-info" id="questionSubmit">관리자에게 보내기</button>
                              <button type="button" class="btn btn-default" id="questionClose" data-dismiss="modal">닫기</button>
                          </div>
                      </div>
                      <!-- /.modal-content -->
                  </div>
                  <!-- /.modal-dialog -->
              </div>
              <!-- END 관리자에게 건의/문의 모달 창  -->    
              
<script>
$(function(){
	var join = $("#joinLink2"); // 회원가입 a태그
	var modal = $("#myModal1"); // 회원가입 모달창
	var modal3 = $("#myModal4"); // 메뉴추천 모달창
	var menuRec = $("#menuRec"); // 메뉴추천 메뉴 버튼
	
	menuRec.on("click", function(e){ // 메뉴바의 메뉴추천 메뉴를 클릭하면 진행
		e.preventDefault();
		console.log(modal3.css("text-align"));
		modal3.modal("show"); // 메뉴추천 모달창 보여주기
	});
	
	join.on("click", function(e){ // 회원가입 a태그를 클릭하면 진행
		e.preventDefault();
		modal.modal('show'); // 모달창 보이기
	});
	
	var joinCk = $("#joinCk"); // 회원가입 약관 동의 체크박스
	var joinBtn = $("#joinBtn"); // 회원가입 버튼
	
	joinBtn.on("click", function(){ // 회원가입 버튼 클릭시 진행
		if(joinCk.is(":checked") == true) { // 회원가입 약관 동의에 체크를 했다면 진행
			  location.href="/join"; // 회원가입 페이지로 이동
			} else { // 회원가입 약관 동의에 체크를 하지 않았다면 진행
				alert("회원가입 약관 동의에 체크하신 후 회원가입을 하실 수 있습니다"); 
			}
	});
	
	var logoutLink = $('.logoutLink'); // 로그아웃 링크 a 태그
	var logoutForm = $('.logoutForm'); // 로그아웃 폼 태그
	logoutLink.on("click",function(e){ // 로그아웃 링크 클릭시 진행
		e.preventDefault();
	
		logoutForm.submit();
	});
	
	var memberExistence = null; // 회원 아이디 확인을 위한 변수
	
	<sec:authorize access="isAuthenticated()">
	
	memberExistence = '<sec:authentication property="principal.username"/>';
	
	</sec:authorize>
	
	console.log('회원의 아이디 : ' + memberExistence);

	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	var questionLink = $('#questionLink'); // 관리자 문의/건의하기 a태그
	var modal6 = $('#myModal6'); // 관리자 문의/건의 모달창
	var questionSubmit = $("#questionSubmit"); // 문의 보내기 버튼
	
	questionLink.on('click', function(e) { // 관리자 문의/건의하기 클릭 시 진행
		e.preventDefault();
		modal6.modal('show');
	});
	questionSubmit.on('click',function(e){ // 문의/건의 보내기 버튼 클릭 시 진행
		var questionTitle = $("#questionTitle").val();
		var questionContent = $("#questionContent").val();
		
		var question = {
				userid : memberExistence, title : questionTitle, content : questionContent
		}
		
		$.ajax({
			url : '/questionInsert',
			data : question,
			type : 'post',
			beforeSend : function(xhr)
            {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
            },
			success : function(result){
				modal6.modal('hide');
				alert('관리자에게 문의/건의 내용이 전달되었습니다');
			}
		}); // END ajax
	});
	
	
});

</script>
<!-- for bootstrap working -->
<script src="/resources/js/bootstrap.js"></script>
