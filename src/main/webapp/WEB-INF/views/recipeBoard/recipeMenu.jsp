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
		<div style="width: 80%; margin: auto; background-color: white;">
			<div class="content-top">
				<div class="container ">
					<div class="spec ">
						<h3>Recipe</h3>
						<div class="ser-t">
							<b></b> <span><i></i></span> <b class="line"></b>
						</div>
					</div>
				</div>
			</div>
			<div class="content-mid">
				<div class="container">
					<!-- 검색설정 -->
					<div>
						<ul class="nav navbar-nav">
							<li><a href="">최신순</a></li>
							<li><a href="">조회순</a></li>
							<li><a href="">인기순</a></li>
						</ul>
						<div style="text-align: right;" class="search1">
							<fieldset class="field-container">
								<select>
									<option>---</option>
									<option>글쓴이</option>
									<option>제목</option>
									<option>태그</option>
								</select> <input type="text" placeholder="Search..." class="field" />
								<button>검색</button>
							</fieldset>
						</div>
					</div>
					<!-- 게시물 목록 뿌려주는곳 -->
					<div class=" con-w3l agileinf">
						<div class="col-md-3 pro-1">
							<div class="col-m">
								<a href="#" data-toggle="modal" data-target="#myModal1"
									class="offer-img"> <img src="images/of24.png"
									class="img-responsive" alt="">
								</a>
								<div class="mid-1">
									<div class="women">
										<h6>
											<a href="single.html">Wheat</a>(500 g)
										</h6>
									</div>
									<div class="mid-2">
										<p>
											<label>$7.00</label><em class="item_price">$6.00</em>
										</p>
										<div class="block">
											<div class="starbox small ghosting"></div>
										</div>
										<div class="clearfix"></div>
									</div>
									<div class="add">
										<button class="btn btn-danger my-cart-btn my-cart-b"
											data-id="24" data-name="Wheat" data-summary="summary 24"
											data-price="6.00" data-quantity="1"
											data-image="images/of24.png">Add to Cart</button>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-3 pro-1">
							<div class="col-m">
								<a href="#" data-toggle="modal" data-target="#myModal2"
									class="offer-img"> <img src="images/of25.png"
									class="img-responsive" alt="">
								</a>
								<div class="mid-1">
									<div class="women">
										<h6>
											<a href="single.html"> Peach Halves</a>(250 g)
										</h6>
									</div>
									<div class="mid-2">
										<p>
											<label>$5.00</label><em class="item_price">$4.50</em>
										</p>
										<div class="block">
											<div class="starbox small ghosting"></div>
										</div>
										<div class="clearfix"></div>
									</div>
									<div class="add">
										<button class="btn btn-danger my-cart-btn my-cart-b"
											data-id="25" data-name="Peach Halves"
											data-summary="summary 25" data-price="4.50" data-quantity="1"
											data-image="images/of25.png">Add to Cart</button>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-3 pro-1">
							<div class="col-m">
								<a href="#" data-toggle="modal" data-target="#myModal3"
									class="offer-img"> <img src="images/of26.png"
									class="img-responsive" alt="">
								</a>
								<div class="mid-1">
									<div class="women">
										<h6>
											<a href="single.html">Banana</a>(1 kg)
										</h6>
									</div>
									<div class="mid-2">
										<p>
											<label>$4.00</label><em class="item_price">$3.50</em>
										</p>
										<div class="block">
											<div class="starbox small ghosting"></div>
										</div>
										<div class="clearfix"></div>
									</div>
									<div class="add">
										<button class="btn btn-danger my-cart-btn my-cart-b"
											data-id="26" data-name="Banana" data-summary="summary 26"
											data-price="3.50" data-quantity="1"
											data-image="images/of26.png">Add to Cart</button>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-3 pro-1">
							<div class="col-m">
								<a href="#" data-toggle="modal" data-target="#myModal4"
									class="offer-img"> <img src="images/of27.png"
									class="img-responsive" alt="">
								</a>
								<div class="mid-1">
									<div class="women">
										<h6>
											<a href="single.html">Rice</a>(500 g)
										</h6>
									</div>
									<div class="mid-2">
										<p>
											<label>$1.00</label><em class="item_price">$0.80</em>
										</p>
										<div class="block">
											<div class="starbox small ghosting"></div>
										</div>
										<div class="clearfix"></div>
									</div>
									<div class="add">
										<button class="btn btn-danger my-cart-btn my-cart-b"
											data-id="27" data-name="Rice" data-summary="summary 27"
											data-price="0.80" data-quantity="1"
											data-image="images/of27.png">Add to Cart</button>
									</div>
								</div>
							</div>
						</div>

						<div class="col-md-3 pro-1">
							<div class="col-m">
								<a href="#" data-toggle="modal" data-target="#myModal5"
									class="offer-img"> <img src="images/of28.png"
									class="img-responsive" alt="">
								</a>
								<div class="mid-1">
									<div class="women">
										<h6>
											<a href="single.html">Oil</a>(500 g)
										</h6>
									</div>
									<div class="mid-2">
										<p>
											<label>$7.00</label><em class="item_price">$6.00</em>
										</p>
										<div class="block">
											<div class="starbox small ghosting"></div>
										</div>
										<div class="clearfix"></div>
									</div>
									<div class="add">
										<button class="btn btn-danger my-cart-btn my-cart-b"
											data-id="28" data-name="Oil" data-summary="summary 28"
											data-price="6.00" data-quantity="1"
											data-image="images/of28.png">Add to Cart</button>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-3 pro-1">
							<div class="col-m">
								<a href="#" data-toggle="modal" data-target="#myModal6"
									class="offer-img"> <img src="images/of29.png"
									class="img-responsive" alt="">
								</a>
								<div class="mid-1">
									<div class="women">
										<h6>
											<a href="single.html">Biscuits</a>(250 g)
										</h6>
									</div>
									<div class="mid-2">
										<p>
											<label>$5.00</label><em class="item_price">$4.50</em>
										</p>
										<div class="block">
											<div class="starbox small ghosting"></div>
										</div>
										<div class="clearfix"></div>
									</div>
									<div class="add">
										<button class="btn btn-danger my-cart-btn my-cart-b"
											data-id="29" data-name="Biscuits" data-summary="summary 29"
											data-price="4.50" data-quantity="1"
											data-image="images/of29.png">Add to Cart</button>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-3 pro-1">
							<div class="col-m">
								<a href="#" data-toggle="modal" data-target="#myModal7"
									class="offer-img"> <img src="images/of30.png"
									class="img-responsive" alt="">
								</a>
								<div class="mid-1">
									<div class="women">
										<h6>
											<a href="single.html">Nuts</a>(1 kg)
										</h6>
									</div>
									<div class="mid-2">
										<p>
											<label>$4.00</label><em class="item_price">$3.50</em>
										</p>
										<div class="block">
											<div class="starbox small ghosting"></div>
										</div>
										<div class="clearfix"></div>
									</div>
									<div class="add">
										<button class="btn btn-danger my-cart-btn my-cart-b"
											data-id="30" data-name="Nuts" data-summary="summary 30"
											data-price="3.50" data-quantity="1"
											data-image="images/of30.png">Add to Cart</button>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-3 pro-1">
							<div class="col-m">
								<a href="#" data-toggle="modal" data-target="#myModal8"
									class="offer-img"> <img src="images/of31.png"
									class="img-responsive" alt="">
								</a>
								<div class="mid-1">
									<div class="women">
										<h6>
											<a href="single.html">Rice</a>(500 g)
										</h6>
									</div>
									<div class="mid-2">
										<p>
											<label>$1.00</label><em class="item_price">$0.80</em>
										</p>
										<div class="block">
											<div class="starbox small ghosting"></div>
										</div>
										<div class="clearfix"></div>
									</div>
									<div class="add">
										<button class="btn btn-danger my-cart-btn my-cart-b"
											data-id="31" data-name="Rice" data-summary="summary 31"
											data-price="0.80" data-quantity="1"
											data-image="images/of31.png">Add to Cart</button>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-3 pro-1">
							<div class="col-m">
								<a href="#" data-toggle="modal" data-target="#myModal9"
									class="offer-img"> <img src="images/of32.png"
									class="img-responsive" alt="">
								</a>
								<div class="mid-1">
									<div class="women">
										<h6>
											<a href="single.html">Noodles</a>(500 g)
										</h6>
									</div>
									<div class="mid-2">
										<p>
											<label>$7.00</label><em class="item_price">$6.00</em>
										</p>
										<div class="block">
											<div class="starbox small ghosting"></div>
										</div>
										<div class="clearfix"></div>
									</div>
									<div class="add">
										<button class="btn btn-danger my-cart-btn my-cart-b"
											data-id="32" data-name="Noodles" data-summary="summary 32"
											data-price="6.00" data-quantity="1"
											data-image="images/of32.png">Add to Cart</button>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-3 pro-1">
							<div class="col-m">
								<a href="#" data-toggle="modal" data-target="#myModal10"
									class="offer-img"> <img src="images/of33.png"
									class="img-responsive" alt="">
								</a>
								<div class="mid-1">
									<div class="women">
										<h6>
											<a href="single.html">Tea</a>(250 g)
										</h6>
									</div>
									<div class="mid-2">
										<p>
											<label>$5.00</label><em class="item_price">$4.50</em>
										</p>
										<div class="block">
											<div class="starbox small ghosting"></div>
										</div>
										<div class="clearfix"></div>
									</div>
									<div class="add">
										<button class="btn btn-danger my-cart-btn my-cart-b"
											data-id="33" data-name="Tea" data-summary="summary 33"
											data-price="4.50" data-quantity="1"
											data-image="images/of33.png">Add to Cart</button>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-3 pro-1">
							<div class="col-m">
								<a href="#" data-toggle="modal" data-target="#myModal11"
									class="offer-img"> <img src="images/of34.png"
									class="img-responsive" alt="">
								</a>
								<div class="mid-1">
									<div class="women">
										<h6>
											<a href="single.html">Seafood</a>(1 kg)
										</h6>
									</div>
									<div class="mid-2">
										<p>
											<label>$4.00</label><em class="item_price">$3.50</em>
										</p>
										<div class="block">
											<div class="starbox small ghosting"></div>
										</div>
										<div class="clearfix"></div>
									</div>
									<div class="add">
										<button class="btn btn-danger my-cart-btn my-cart-b"
											data-id="34" data-name="Seafood" data-summary="summary 34"
											data-price="3.50" data-quantity="1"
											data-image="images/of34.png">Add to Cart</button>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-3 pro-1">
							<div class="col-m">
								<a href="#" data-toggle="modal" data-target="#myModal12"
									class="offer-img"> <img src="images/of35.png"
									class="img-responsive" alt="">
								</a>
								<div class="mid-1">
									<div class="women">
										<h6>
											<a href="single.html">Oats Idli</a>(500 g)
										</h6>
									</div>
									<div class="mid-2">
										<p>
											<label>$1.00</label><em class="item_price">$0.80</em>
										</p>
										<div class="block">
											<div class="starbox small ghosting"></div>
										</div>
										<div class="clearfix"></div>
									</div>
									<div class="add">
										<button class="btn btn-danger my-cart-btn my-cart-b"
											data-id="35" data-name="Oats Idli" data-summary="summary 35"
											data-price="0.80" data-quantity="1"
											data-image="images/of35.png">Add to Cart</button>
									</div>
								</div>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
				<div style="text-align: right;">
					<a href="">글 등록</a>
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