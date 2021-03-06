<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 수정 페이지</title>
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
		<h3>레시피 수정</h3>
		<div class="clearfix"> </div>
	</div>
</div>

<div style="background-color: lightgray;">
	<div class="recipeInsert">
	<form action="/recipe/modify" method="post" name="formModify" role="form">
	<div class="recipeDiv">
	    <div class="recipeSemiDiv">
	      <div>
	      	<p class="titles">레시피 제목</p>
	      	<input type="text" id="cokTitle" class="form-control" placeholder="예) 소고기 미역국 끓이기"
	      			value="${recipe.title }" name="title">
	      </div>
	      <div class="">
	      	<p class="titles">재료 </p>
	      	<textarea class="form-control step_cont" name="material" placeholder="예) 소고기 500g, 설탕 1/2 스푼, 물 300ml (재료가 남거나 부족하지 않도록 정확한 계량정보를 적어주세요!)">${recipe.material }
	      	</textarea>
	      </div>
	
	      <div>
	      	<p class="titles">요리정보</p>
	        <select id="cookInfo"  text="인원" name="personnel">
				<option value="">인원</option>
				<option value="1" <c:if test="${recipe.personnel == 1 }">selected</c:if>>1인분</option>
				<option value="2" <c:if test="${recipe.personnel == 2 }">selected</c:if>>2인분</option>
				<option value="3" <c:if test="${recipe.personnel == 3 }">selected</c:if>>3인분</option>
				<option value="4" <c:if test="${recipe.personnel == 4 }">selected</c:if>>4인분</option>
				<option value="5" <c:if test="${recipe.personnel == 5 }">selected</c:if>>5인분</option>
				<option value="6" <c:if test="${recipe.personnel == 6 }">selected</c:if>>6인분이상</option>
			</select>
	      	
	      	<span>시간 </span>
	        <select id="cookTime"  text="요리시간" name="cookingTime">
				<option value="" >시간</option>
				<option value="10" <c:if test="${recipe.cookingTime == 10 }">selected</c:if>>10분이내</option>
				<option value="20" <c:if test="${recipe.cookingTime == 20 }">selected</c:if>>20분이내</option>
				<option value="30" <c:if test="${recipe.cookingTime == 30 }">selected</c:if>>30분이내</option>
				<option value="60" <c:if test="${recipe.cookingTime == 60 }">selected</c:if>>60분이내</option>
				<option value="90" <c:if test="${recipe.cookingTime == 90 }">selected</c:if>>90분이내</option>
				<option value="120" <c:if test="${recipe.cookingTime == 120 }">selected</c:if>>2시간이상</option>
			</select>
	     	
	     	<span>난이도 </span>
	        <select id="cookLevel" text="난이도" name="cookingLevel">
				<option value="" >난이도</option>
				<option value="1" <c:if test="${recipe.cookingLevel == 1 }">selected</c:if>>매우 쉬움</option>
				<option value="2" <c:if test="${recipe.cookingLevel == 2 }">selected</c:if>>쉬움</option>
				<option value="3" <c:if test="${recipe.cookingLevel == 3 }">selected</c:if>>보통</option>
				<option value="4" <c:if test="${recipe.cookingLevel == 4 }">selected</c:if>>어려움</option>
				<option value="5" <c:if test="${recipe.cookingLevel == 5 }">selected</c:if>>매우 어려움</option>
			</select>
	      </div>
	    </div><!--/cont_box-->
	  	
	  	<div class="recipeSemiDiv2">
	  	<div class="cookorder">
	  		<p class="titles">조리 순서</p>
	  		
	  	</div>
	  	<div style="width: 60%; text-align: center;">	
	  		<a class="seqAdd">+ 순서 추가</a>
	  	</div>
	  	
	    <div>
		    <p class="titles">요리팁</p>
		    <textarea class="form-control step_cont" name="cookingTip" placeholder="예) 고기요리에는 소금보다 설탕을 먼저 넣어야 단맛이 겉돌지 않고 육질이 부드러워요.">${recipe.cookingTip }</textarea>
	    </div><!--/cont_box-->
	
	    <div>
		    <p class="titles">태그</p>
		    <input type="text" name="cookingTag" class="form-control" placeholder="예) 돼지고기, 다이어트, 비만, 칼슘, 감기예방, 이유식, 초간단" value="${recipe.cookingTag }">
		    <span style="display:block; padding-bottom: 20px; padding-top: 10px;">주재료, 목적, 효능, 대상 등을 태그로 남겨주세요.</span>
	    </div>
	    
	    <p class="titles">완성된 요리 사진</p>
	    
		<div class="form-group uploadDiv">
			<input type="file" name="uploadFile" multiple="multiple">
		</div>
						
		<div class="uploadResult"> <!-- 사진 업로드한 것  출력되는 공간  -->
			<ul>
							
			</ul>
		</div>
			
		</div><!--recipeSemiDiv2-->
		<div class="recipeBtn">
		<sec:authentication property="principal" var="principal"/>
		<sec:authorize access="isAuthenticated()">
		<c:if test="${principal.username eq recipe.userid }">
			<input type="submit" id="modifyRecipeBtn" value="수정 완료">
			<input type="button" value="취소" id="cancleBtn">
		</c:if>
		</sec:authorize>
		</div>
    </div><!--/recipe Div -->
    <input type="hidden" name="recipenum" value="${recipe.recipenum }">
    <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
    <input type="hidden" name="userid" value="${recipe.userid }">
    <input type="hidden" name="pageNum" value="${cri.pageNum }">
    <input type="hidden" name="amount" value="${cri.amount }">
    <input type="hidden" name="type" value="${cri.type }">
    <input type="hidden" name="keyword" value="${cri.keyword }">
	</form>
	</div>
</div>

<script>
	var addSeq = $('.seqAdd'); // 순서 추가 a태그
	var cookOrder = $('.cookorder'); // 조리 순서 div 태그
	var cancleBtn = $('#cancleBtn'); // 취소 버튼
	
	var orderDbValue = '${recipe.cookingOrder}'; // 조리순서 db에서 가져온값
	var orderArrays = orderDbValue.split("@"); // 조리순서 @기준으로 배열에 담은 변수
	var orderLength = orderArrays.length; // 조리순서 배열의 길이 값
	var i = orderLength-1; // 조리 순서의 순서를 나타내는 변수
	var orderTagText = ""; 
	
	addSeq.on("click", function(e) { // 순서 추가 클릭시 진행(태그 추가함)
		e.preventDefault();
		i = i +1;
		var addSpan2 = $('<span style="color: green; font-weight: bold;"></span>');
		var addInput = $('<input type="text" id="cookOrder" name="cookOrder'+i+'" class="form-control" placeholder="예) 고기는(500g) 적당크기 썰어 물을 갈아가며 2시간 이상 핏물을 빼주세요" style="margin-top: 10px; margin-bottom: 10px;">');
		
		var text = i + ' 번째 순서';
		
		cookOrder.append(addSpan2.text(text)); // 동적 span태그 착
		cookOrder.append(addInput); // 동적 input태그 부착
	});
	
	for (var j = 1; j < orderLength; j++) { // 조리순서 태그 동적으로 생성(기존 게시물의 내용 그대로)
		orderTagText += '<span style="color: green; font-weight: bold;">'+j+' 번째 순서</span>';
		orderTagText += '<input type="text" id="cookOrder" name="cookOrder'+j+'" value="'+orderArrays[j-1]+'" class="form-control" placeholder="예) 고기는(500g) 적당크기 썰어 물을 갈아가며 2시간 이상 핏물을 빼주세요" style="margin-top: 10px; margin-bottom: 10px;">';
    }
	cookOrder.append(orderTagText); // 조리순서 태그 view에 부착
	
	var modifyBtn = $("#modifyRecipeBtn"); // 수정완료 버튼
	
	modifyBtn.on("click",function(e){ // 수정완료 버튼 클릭시 진행
		
		var order = $("input[id=cookOrder]").length; // 조리순서 생성된 태그 갯수
		var textOrder = "";
		for (var o = 1; o <= order; o++) {
			textOrder += $("input[name=cookOrder"+o+"]").val() + "@";
        }
		
		var addOrder = $('<input type="hidden" name="cookingOrder">'); // 동적 태그생성 vo변수와 같은 name값을 가진 조리순서 
		addOrder.val(textOrder); // 조리순서 모든 값들을 태그에 부착
		cookOrder.append(addOrder); // view페이지에 태그 부착 - 조리순서 값을 전부 합쳐서 vo값에 넣기위함
		
		var attachLists = "";
		
		$(".uploadResult ul li").each(function(i,obj){
			var jobj = $(obj);
			console.dir(jobj);
			
			attachLists += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
			attachLists += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
			attachLists += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
			attachLists += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
		});
		
		$("form[role='form']").append(attachLists);
		
		$("form[role='form']").submit(); // 폼 전송
	});
	
	cancleBtn.on('click', function(e) { // 취소 버튼 클릭 시 진행
		e.preventDefault();
		history.back();
	});
	
	$(function(e){
		var recipenum = '${recipe.recipenum}';
		
		$.getJSON("/recipe/getAttachList", {recipenum : recipenum}, function(arr){
			console.log(arr);
			
			var arrAttach = "";
			
			$(arr).each(function(i,attach){
				var fileCallPath = encodeURIComponent(attach.uploadPath+ "/s_"+attach.uuid+"_"+attach.fileName);
				arrAttach += "<li data-path='"+attach.uploadPath+"'";
				arrAttach += " data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.image+"'";
				arrAttach += " ><div>";
				arrAttach += "<span class='attachName'>" + attach.fileName + "</span>";
				arrAttach += "<button type='button' data-file=\'"+fileCallPath+"\ '";
				arrAttach += "data-type='image' class='btn btn-warning btn-xs btn=circle'><i class='fa fa-times'>x</i></button><br>";
				arrAttach += "<img class='attachImg' src='/display?fileName="+fileCallPath+"'>";
				arrAttach += "</div></li>";
			});
			
			$(".uploadResult ul").html(arrAttach);
		});
		
		$(".uploadResult").on("click","button", function(e){ // 첨부파일 삭제를 위한 x버튼 클릭 시 진행
			console.log("delete File");
			if(confirm("정말 첨부파일을 삭제하시겠습니까?")){
				var targetLi = $(this).closest("li");
				targetLi.remove();
			}
		});
		
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz|pdf|doc|exe|xlsx|pptx|txt)$"); // 파일 정규표현식
		var maxSize = 5242880; // 파일 최대 사이즈
		
		function checkExtension(fileName, fileSize){ // 파일 정규표현식과 최대 사이즈 체크 함수
			if(fileSize >= maxSize){
				alert("파일 사이즈 초과");
				return false;
			}
			
			if(regex.test(fileName)){
				alert("이미지 파일만 첨부해주세요");
				return false;
			}
			return true;
		}
		
		var cloneObj = $(".uploadDiv").clone();
		
		$("input[type='file']").change(function(e){ // 파일 첨부 태그가 변경 될 시 진행
			var formData = new FormData(); // formdata 객체 생성
			
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			
			console.log(files);
			
			for(var i=0; i< files.length; i++){
				if(!checkExtension(files[i].name, files[i].size)){ // 확장자명과 파일 체크 함수값이 false일 때 
					return false;
				}
				formData.append("uploadFile", files[i]); // formdata 객체에 붙임
			}
			
			$.ajax({
				url : '/uploadAjaxAction',
				processData : false,
				contentType : false,
				data : formData,
				type : 'post',
				dataType : 'json',
				beforeSend : function(xhr)
	            {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
	                xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	            },
				success : function(result){
					console.log(result);
					
					showUploadResult(result);
					
					$(".uploadDiv").html(cloneObj.html());
				}
			});
		}); // end change	
		
		function showUploadResult(uploadResultArr){
			
			if(!uploadResultArr || uploadResultArr.length == 0){return;}
			
			var uploadUL = $(".uploadResult ul");
			var uploadLists = "";
			
			$(uploadResultArr).each(function(i,obj){
				var fileCallPath = encodeURIComponent(obj.uploadPath+ "/s_"+obj.uuid+"_"+obj.fileName);
				uploadLists += "<li data-path='"+obj.uploadPath+"'";
				uploadLists += " data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'";
				uploadLists += " ><div>";
				uploadLists += "<span class='attachName'>" + obj.fileName + "</span>";
				uploadLists += "<button type='button' data-file=\'"+fileCallPath+"\ '";
				uploadLists += "data-type='image' class='btn btn-warning btn-xs btn=circle'><i class='fa fa-times'>x</i></button><br>";
				uploadLists += "<img class='attachImg' src='/display?fileName="+fileCallPath+"'>";
				uploadLists += "</div></li>";
			});
			uploadUL.append(uploadLists);
		} // end showUploadResult
	});
	
</script>
</body>

</html>