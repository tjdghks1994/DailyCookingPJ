<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 목록</title>
<style type="text/css">
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<div style="background-color: #eaeaea; padding-top: 20px; padding-bottom: 20px">
		<div style="width: 95%; margin: auto; background-color: white;">
			<div class="content-top">
				<div class="container ">
					<div style="margin-bottom: 20px;">
						<span style="font-size: 18px;">총 
						 <span class="recipeBoardCount">35</span>
						개의 레시피가 있습니다 </span>
						<button id="regBtn" type="button" class="btn btn-success btn-sm pull-right">레시피 작성하기</button>
					</div>
				</div>
			</div>
			<div class="content-mid" style="padding: 0px;">
				<div class="container">
					<!-- 검색설정 -->
					<div>
						<ul class="nav navbar-nav" style="float: left;">
							<li style="font-size: 14px;"><a href="">최신순</a></li>
							<li style="font-size: 14px;"><a href="">조회순</a></li>
							<li style="font-size: 14px;"><a href="">인기순</a></li>
						</ul>
						<div style="width: 100%; text-align: right; margin-bottom: 20px;">
					      	<form id="searchForm" action="" method="get">
					            <select name="type" style="height: 26px;">
					               <option value="">--------</option>
					               <option value="">닉네임</option>
					               <option value="">제목</option>
					               <option value="">태그</option>
					            </select>
					            <input type="text" name="keyword" style="width: 200px;">
					           <button class="btn btn-default" style="height: 30px; padding: 1px 5px;">검색</button>
					        </form>
					    </div>
					</div>
					<!-- 게시물 목록 뿌려주는곳 -->
				<div>	
					<div class="col-md-3 m-wthree" style="margin-bottom: 20px;">
						<div class="col-m">
							<a href="#" data-toggle="modal" data-target="#myModal1"
								class="offer-img"> <img src="/resources/images/gooksu.jpg"
								class="img-responsive" alt="">
							</a>
							<div class="mid-1">
								<div class="women">
									<h6>
										<a href="single.html">음식이름1</a>
									</h6>
								</div>
								<div class="mid-2">
									<p>글쓴이</p>
									<div class="block">
										<div class="starbox small ghosting"></div>
									</div>
									<div class="clearfix"></div>
									<hr>
									<div class="clearfix">
										<a href="single.html">#맛잇</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-md-3 m-wthree" style="margin-bottom: 20px;">
						<div class="col-m">
							<a href="#" data-toggle="modal" data-target="#myModal1"
								class="offer-img"> <img src="/resources/images/gooksu.jpg"
								class="img-responsive" alt="">
							</a>
							<div class="mid-1">
								<div class="women">
									<h6>
										<a href="single.html">음식이름1</a>
									</h6>
								</div>
								<div class="mid-2">
									<p>글쓴이</p>
									<div class="block">
										<div class="starbox small ghosting"></div>
									</div>
									<div class="clearfix"></div>
									<hr>
									<div class="clearfix">
										<a href="single.html">#맛잇</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-md-3 m-wthree" style="margin-bottom: 20px;">
						<div class="col-m">
							<a href="#" data-toggle="modal" data-target="#myModal1"
								class="offer-img"> <img src="/resources/images/gooksu.jpg"
								class="img-responsive" alt="">
							</a>
							<div class="mid-1">
								<div class="women">
									<h6>
										<a href="single.html">음식이름1</a>
									</h6>
								</div>
								<div class="mid-2">
									<p>글쓴이</p>
									<div class="block">
										<div class="starbox small ghosting"></div>
									</div>
									<div class="clearfix"></div>
									<hr>
									<div class="clearfix">
										<a href="single.html">#맛잇</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-md-3 m-wthree" style="margin-bottom: 20px;">
						<div class="col-m">
							<a href="#" data-toggle="modal" data-target="#myModal1"
								class="offer-img"> <img src="/resources/images/gooksu.jpg"
								class="img-responsive" alt="">
							</a>
							<div class="mid-1">
								<div class="women">
									<h6>
										<a href="single.html">음식이름1</a>
									</h6>
								</div>
								<div class="mid-2">
									<p>글쓴이</p>
									<div class="block">
										<div class="starbox small ghosting"></div>
									</div>
									<div class="clearfix"></div>
									<hr>
									<div class="clearfix">
										<a href="single.html">#맛잇</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-md-3 m-wthree" style="margin-bottom: 20px;">
						<div class="col-m">
							<a href="#" data-toggle="modal" data-target="#myModal1"
								class="offer-img"> <img src="/resources/images/gooksu.jpg"
								class="img-responsive" alt="">
							</a>
							<div class="mid-1">
								<div class="women">
									<h6>
										<a href="single.html">음식이름1</a>
									</h6>
								</div>
								<div class="mid-2">
									<p>글쓴이</p>
									<div class="block">
										<div class="starbox small ghosting"></div>
									</div>
									<div class="clearfix"></div>
									<hr>
									<div class="clearfix">
										<a href="single.html">#맛잇</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-md-3 m-wthree" style="margin-bottom: 20px;">
						<div class="col-m">
							<a href="#" data-toggle="modal" data-target="#myModal1"
								class="offer-img"> <img src="/resources/images/gooksu.jpg"
								class="img-responsive" alt="">
							</a>
							<div class="mid-1">
								<div class="women">
									<h6>
										<a href="single.html">음식이름1</a>
									</h6>
								</div>
								<div class="mid-2">
									<p>글쓴이</p>
									<div class="block">
										<div class="starbox small ghosting"></div>
									</div>
									<div class="clearfix"></div>
									<hr>
									<div class="clearfix">
										<a href="single.html">#맛잇</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-md-3 m-wthree" style="margin-bottom: 20px;">
						<div class="col-m">
							<a href="#" data-toggle="modal" data-target="#myModal1"
								class="offer-img"> <img src="/resources/images/gooksu.jpg"
								class="img-responsive" alt="">
							</a>
							<div class="mid-1">
								<div class="women">
									<h6>
										<a href="single.html">음식이름1</a>
									</h6>
								</div>
								<div class="mid-2">
									<p>글쓴이</p>
									<div class="block">
										<div class="starbox small ghosting"></div>
									</div>
									<div class="clearfix"></div>
									<hr>
									<div class="clearfix">
										<a href="single.html">#맛잇</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-md-3 m-wthree" style="margin-bottom: 20px;">
						<div class="col-m">
							<a href="#" data-toggle="modal" data-target="#myModal1"
								class="offer-img"> <img src="/resources/images/gooksu.jpg"
								class="img-responsive" alt="">
							</a>
							<div class="mid-1">
								<div class="women">
									<h6>
										<a href="single.html">음식이름1</a>
									</h6>
								</div>
								<div class="mid-2">
									<p>글쓴이</p>
									<div class="block">
										<div class="starbox small ghosting"></div>
									</div>
									<div class="clearfix"></div>
									<hr>
									<div class="clearfix">
										<a href="single.html">#맛잇</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-md-3 m-wthree" style="margin-bottom: 20px;">
						<div class="col-m">
							<a href="#" data-toggle="modal" data-target="#myModal1"
								class="offer-img"> <img src="/resources/images/gooksu.jpg"
								class="img-responsive" alt="">
							</a>
							<div class="mid-1">
								<div class="women">
									<h6>
										<a href="single.html">음식이름1</a>
									</h6>
								</div>
								<div class="mid-2">
									<p>글쓴이</p>
									<div class="block">
										<div class="starbox small ghosting"></div>
									</div>
									<div class="clearfix"></div>
									<hr>
									<div class="clearfix">
										<a href="single.html">#맛잇</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-md-3 m-wthree" style="margin-bottom: 20px;">
						<div class="col-m">
							<a href="#" data-toggle="modal" data-target="#myModal1"
								class="offer-img"> <img src="/resources/images/gooksu.jpg"
								class="img-responsive" alt="">
							</a>
							<div class="mid-1">
								<div class="women">
									<h6>
										<a href="single.html">음식이름1</a>
									</h6>
								</div>
								<div class="mid-2">
									<p>글쓴이</p>
									<div class="block">
										<div class="starbox small ghosting"></div>
									</div>
									<div class="clearfix"></div>
									<hr>
									<div class="clearfix">
										<a href="single.html">#맛잇</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-md-3 m-wthree" style="margin-bottom: 20px;">
						<div class="col-m">
							<a href="#" data-toggle="modal" data-target="#myModal1"
								class="offer-img"> <img src="/resources/images/gooksu.jpg"
								class="img-responsive" alt="">
							</a>
							<div class="mid-1">
								<div class="women">
									<h6>
										<a href="single.html">음식이름1</a>
									</h6>
								</div>
								<div class="mid-2">
									<p>글쓴이</p>
									<div class="block">
										<div class="starbox small ghosting"></div>
									</div>
									<div class="clearfix"></div>
									<hr>
									<div class="clearfix">
										<a href="single.html">#맛잇</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-md-3 m-wthree" style="margin-bottom: 20px;">
						<div class="col-m">
							<a href="#" data-toggle="modal" data-target="#myModal1"
								class="offer-img"> <img src="/resources/images/gooksu.jpg"
								class="img-responsive" alt="">
							</a>
							<div class="mid-1">
								<div class="women">
									<h6>
										<a href="single.html">음식이름1</a>
									</h6>
								</div>
								<div class="mid-2">
									<p>글쓴이</p>
									<div class="block">
										<div class="starbox small ghosting"></div>
									</div>
									<div class="clearfix"></div>
									<hr>
									<div class="clearfix">
										<a href="single.html">#맛잇</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				</div>
				
				<nav style="text-align: center;">
					<ul class="pagination">
						<li><a href="#" aria-label="Previous"> <span
								aria-hidden="true">«</span></a></li>
						<li><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#" aria-label="Next"><span
								aria-hidden="true">»</span></a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>