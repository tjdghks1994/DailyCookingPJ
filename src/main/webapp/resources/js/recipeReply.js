console.log("reply module...");

var replyService= (function(){

	function add(reply, callback, error){ // 댓글 등록 ajax 처리
		
		$.ajax({
			type : 'post',
			url : '/reply/new',
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			beforeSend : function(xhr)
            {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
            },
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	function getList(param, callback, error){ // 해당 게시물의 전체 댓글 목록 ajax처리
		var recipeNum = param.recipenum;
		var page = param.page || 1;
		
		$.getJSON("/reply/pages/"+ recipeNum + "/" + page + ".json",
				function(data){
					if(callback){
						callback(data.replyCnt, data.list);
					}
				}).fail(function(xhr,status,err){
					if(error){
						error();
					}
				});
	}
	
	function remove(replynum, callback, error){ // 댓글 삭제 ajax처리
		$.ajax({
			type : 'delete',
			url : '/reply/'+ replynum,
			beforeSend : function(xhr)
            {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
            },
			success : function(deleteResult, status, xhr){
				if(callback){
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	function update(reply, callback, error){ // 댓글 수정 ajax 처리
		console.log("replyNum : " + reply.replynum);
		
		$.ajax({
			type : 'put',
			url : "/reply/"+reply.replynum,
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			beforeSend : function(xhr)
            {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
            },
            success : function(result, status, xhr){
            	if(callback){
            		callback(result);
            	}
            },
            error : function(xhr, status, er){
            	if(error){
            		error(er);
            	}
            }
		});
	}
	
	function get(replynum, callback, error){ // 댓글 조회 ajax 처리
		$.get("/reply/"+replynum+".json", function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr,status, err){
			if(error){
				error();
			}
		});
	}
	
	function displayTime(timeValue){
		var today = new Date(); // 오늘 날짜
		var todayDate = today.getDate(); // 오늘 날짜가 몇일 인지 저장하는 변수
		console.log(todayDate);
		var reply = new Date(timeValue); // 작성된 댓글의 날짜
		var replyDate = reply.getDate(); // 작성된 댓글의 날짜가 몇일 인지 저장하는 변수
		console.log(replyDate);

		var str = "";
		
		if(todayDate == replyDate){ // 댓글 날짜의 일 과 현재 날짜의 일 이 동일하면 진행
			var hh = reply.getHours();
			var mi = reply.getMinutes();
			var ss = reply.getSeconds();
			
			return [ (hh > 9 ? '' : '0') + hh, '시', (mi > 9 ? '':'0') + mi,
				'분', (ss > 9 ? '' : '0') + ss, '초'].join('');
		} else {
			var yy = reply.getFullYear();
			var mm = reply.getMonth() + 1;
			var dd = reply.getDate();
			
			return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/', (dd > 9 ? '': '0') + dd].join('');
		}
	};
	
	return {add:add, getList : getList, remove:remove, update:update, get:get,
			displayTime:displayTime};
})();