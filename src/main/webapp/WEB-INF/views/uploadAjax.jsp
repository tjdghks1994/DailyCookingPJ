<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>upload 연습</title>
</head>
<body>
	<h1>Upload with Ajax Practice</h1>

	<div class="uploadDiv">
		<input type="file" name="uploadFile" multiple="multiple">
	</div>
	<div class="uploadResult">
		<ul>
		
		</ul>
	</div>
	
	<button id="uploadBtn">Upload</button>

	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	
	<script>
	$(function(e){
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz|pdf|doc|exe|xlsx|pptx|txt)$"); // 파일 정규표현식
		var maxSize = 5242880;
		
		function checkExtension(fileName, fileSize){
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
		
		$("#uploadBtn").on("click", function(e){
			var formData = new FormData();
			
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			
			console.log(files);
			
			for(var i=0; i< files.length; i++){
				if(!checkExtension(files[i].name, files[i].size)){
					return false;
				}
				formData.append("uploadFile", files[i]);
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
					
					showUploadedFile(result);
					
					$(".uploadDiv").html(cloneObj.html());
				}
			});
		});
		
		var uploadResult = $(".uploadResult ul");
		
		function showUploadedFile(uploadResultArr){
			var str = "";
			
			$(uploadResultArr).each(function(i,obj){
				str += "<li>" + obj.fileName + "</li>";
				var fileCallPath = encodeURIComponent(obj.uploadPath+ "/s_"+obj.uuid+"_"+obj.fileName);
				var originPath = obj.uploadPath + "\\"+obj.uuid + "_"+obj.fileName;
				originPath = originPath.replace(new RegExp(/\\/g),"/");
				str += "<li><img src='/display?fileName="+fileCallPath+"'>"
				str += "<span data-file=\'"+fileCallPath+"\' data-type='image'> x </span></li>";
			});
			uploadResult.append(str);
		}
		
		$(".uploadResult").on("click", "span", function(e){
			var targetFile = $(this).data("file");
			var type = $(this).data("type");
			console.log(targetFile);
			
			$.ajax({
				url : '/deleteFile',
				data : {fileName : targetFile, type : type},
				dataType : 'text',
				type : 'post',
				success : function(result){
					alert(result);
				}
			});
		});
	});
		
	</script>
</body>
</html>