<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 등록 페이지</title>
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
		<h3>레시피 등록</h3>
		<div class="clearfix"> </div>
	</div>
</div>

<div style="background-color: #EAEAEA; padding-top: 20px; padding-bottom: 20px;">
	<div class="recipeInsert">
	<form action="/recipe/register" method="post" role="form">
	<div class="recipeDiv">
	    <div class="recipeSemiDiv">
	      <div>
	      	<p class="titles">레시피 제목</p>
	      	<input type="text" name="title" id="cokTitle" class="form-control" placeholder="예) 소고기 미역국 끓이기">
	      </div>
	      <div class="">
	      	<p class="titles">재료 </p>
	      	<textarea name="material" class="form-control step_cont" placeholder="예) 소고기 500g, 설탕 1/2 스푼, 물 300ml (재료가 남거나 부족하지 않도록 정확한 계량정보를 적어주세요!)"></textarea>
	      </div>
	
	      <div>
	      	<p class="titles">요리정보</p>
	        <select name="personnel" id="cookInfo"  text="인원">
				<option value="" >인원</option>
				<option value="1">1인분</option>
				<option value="2">2인분</option>
				<option value="3">3인분</option>
				<option value="4">4인분</option>
				<option value="5">5인분</option>
				<option value="6">6인분이상</option>
			</select>
	      	
	      	<span>시간 </span>
	        <select name="cookingTime" id="cookTime"  text="요리시간">
				<option value="" >시간</option>
				<option value="10">10분이내</option>
				<option value="20">20분이내</option>
				<option value="30">30분이내</option>
				<option value="60">60분이내</option>
				<option value="90">90분이내</option>
				<option value="120">2시간이상</option>
			</select>
	     	
	     	<span>난이도 </span>
	        <select name="cookingLevel" id="cookLevel" text="난이도">
				<option value="" >난이도</option>
				<option value="1">매우 쉬움</option>
				<option value="2">쉬움</option>
				<option value="3">보통</option>
				<option value="4">어려움</option>
				<option value="5">매우 어려움</option>
			</select>
	      </div>
	    </div><!--/cont_box-->
	  	
	  	<div class="recipeSemiDiv2">
	  	<div class="cookorder">
	  		<p class="titles">조리 순서</p>
	  		<span style="color: green; font-weight: bold;">1 번째 순서</span>
	  		<input type="text" name="cookOrder1" id="cookOrder" class="form-control" placeholder="예) 고기는(500g) 적당크기 썰어 물을 갈아가며 2시간 이상 핏물을 빼주세요"
	  				style="margin-top: 10px; margin-bottom: 10px;">
	  	</div>
	  	<div style="width: 60%; text-align: center;">	
	  		<a class="seqAdd">+ 순서 추가</a>
	  	</div>
	  	
	    <div>
		    <p class="titles">요리팁</p>
		    <textarea name="cookingTip" class="form-control step_cont" placeholder="예) 고기요리에는 소금보다 설탕을 먼저 넣어야 단맛이 겉돌지 않고 육질이 부드러워요."></textarea>
	    </div><!--/cont_box-->
	
	    <div>
		    <p class="titles">태그</p>
		    <input name="cookingTag" type="text" class="form-control" placeholder="예) #돼지고기, #다이어트, #비만, #칼슘, #감기예방, #이유식, #초간단">
		    <span style="display:block; padding-bottom: 20px; padding-top: 10px;">주재료, 목적, 효능, 대상 등을 태그로 남겨주세요.</span>
	    </div>
	    
	    <p class="titles">완성된 요리 사진</p>
	    
		<div class="form-group uploadDiv">
			<input type="file" name="uploadFile" multiple="multiple">
		</div>
						
		<div class="uploadResult"> <!-- 사진 업로드할 시 사진 출력되는 공간  -->
			<ul>
							
			</ul>
		</div>
			
		</div><!--recipeSemiDiv2-->
		<div class="recipeBtn">
			<input type="submit" id="recipeInsert" value="레시피 등록">
			<input type="button" value="취소" id="cancleBtn">
		</div>
    </div><!--/recipe Div -->
    <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
    <input type="hidden" name="userid" value="admin">
	</form>
	</div>
</div>

<script>
	var addSeq = $('.seqAdd'); // 순서 추가 a태그
	var cookOrder = $('.cookorder'); // 조리 순서 div 태그
	var i = 1;
	
	addSeq.on("click", function(e) { // 순서 추가 클릭시 진행(태그 추가함)
		e.preventDefault();
		var addSpan2 = $('<span style="color: green; font-weight: bold;"></span>');
		var addInput = $('<input type="text" id="cookOrder" name="cookOrder" class="form-control" placeholder="예) 고기는(500g) 적당크기 썰어 물을 갈아가며 2시간 이상 핏물을 빼주세요" style="margin-top: 10px; margin-bottom: 10px;">');
		i = i + 1;
		var text = i + ' 번째 순서';
		
		cookOrder.append(addSpan2.text(text)); // span태그에 추가
		cookOrder.append(addInput); // view페이지에 태그 부착
		$("input[name='cookOrder']").attr("name","cookOrder"+i); // name 속성값 변경
	});
	
	var insert = $("#recipeInsert");

	insert.on("click",function(e){ // 레시피 등록버튼 클릭 시 진행
		e.preventDefault();
		
		var textOrder ="";
		
		var order = $("input[id=cookOrder]").length; // 조리순서 생성된 태그 갯수
		for (var i = 1; i <= order; i++) {
			textOrder += $("input[name=cookOrder"+i+"]").val() + "@";
        }
		
		var addOrder = $('<input type="hidden" name="cookingOrder">');
		addOrder.val(textOrder);
		cookOrder.append(addOrder); // view페이지에 태그 부착 - 조리순서 값을 전부 합쳐서 vo값에 넣기위함
		
		var attachInfo = "";
		
		$(".uploadResult ul li").each(function(i,obj){
			var jobj = $(obj);
			console.dir(jobj);
			
			attachInfo += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
			attachInfo += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
			attachInfo += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
			attachInfo += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
		});
		
		$("form[role='form']").append(attachInfo);
		$("form[role='form']").submit(); // 폼 전송

	});
	
	$(function(e){
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
			var str = "";
			
			$(uploadResultArr).each(function(i,obj){
				var fileCallPath = encodeURIComponent(obj.uploadPath+ "/s_"+obj.uuid+"_"+obj.fileName);
				str += "<li data-path='"+obj.uploadPath+"'";
				str += " data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'";
				str += " ><div>";
				str += "<span class='attachName'>" + obj.fileName + "</span>";
				str += "<button type='button' data-file=\'"+fileCallPath+"\ '";
				str += "data-type='image' class='btn btn-warning btn-xs btn=circle'><i class='fa fa-times'>x</i></button><br>";
				str += "<img class='attachImg' src='/display?fileName="+fileCallPath+"'>";
				str += "</div></li>";
			});
			uploadUL.append(str);
		} // end showUploadResult
		
		$(".uploadResult").on("click", "button", function(e){ // 첨부파일 사진에서 x버튼 클릭 시 진행
			console.log("delete File");
		
			var targetFile = $(this).data("file");
			var type = $(this).data("type");
			
			var targerLi = $(this).closest("li");
			
			$.ajax({
				url : 'deleteFile',
				data : {fileName : targetFile, type : type},
				dataType : 'text',
				type : 'post',
				success : function(result){
					alert(result);
					targetLi.remove();
				}
			});
		});
		
	});
</script>
</body>

</html>