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
	<form action="/recipe/modify" method="post" name="formModify">
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
	  		<span style="color: green; font-weight: bold;">1 번째 순서</span>
	  		<input type="text" class="form-control" placeholder="예) 고기는(500g) 적당크기 썰어 물을 갈아가며 2시간 이상 핏물을 빼주세요"
	  				style="margin-top: 10px; margin-bottom: 10px;">
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
			<input type="submit" value="수정 완료">
			<input type="button" value="취소" id="cancleBtn">
		</div>
    </div><!--/recipe Div -->
	</form>
	</div>
</div>

<script>
	var addSeq = $('.seqAdd'); // 순서 추가 a태그
	var cookOrder = $('.cookorder'); // 조리 순서 div 태그
	var cancleBtn = $('#cancleBtn'); // 취소 버튼
	var i = 1;
	
	addSeq.on("click", function(e) { // 순서 추가 클릭시 진행(태그 추가함)
		e.preventDefault();
		var addSpan2 = $('<span style="color: green; font-weight: bold;"></span>');
		var addInput = $('<input type="text" class="form-control" placeholder="예) 고기는(500g) 적당크기 썰어 물을 갈아가며 2시간 이상 핏물을 빼주세요" style="margin-top: 10px; margin-bottom: 10px;">');
		i = i + 1;
		var text = i + ' 번째 순서';
		
		cookOrder.append(addSpan2.text(text));
		cookOrder.append(addInput);
	});
	
	cancleBtn.on('click', function(e) { // 취소 버튼 클릭 시 진행
		e.preventDefault();
		history.back();
	});
</script>
</body>

</html>