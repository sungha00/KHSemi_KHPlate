<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<title>전체 가게 조회</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Roboto&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="allstore_inquiry.css" />

<style>
* {
	box-sizing: border-box;
	font-family: 'Noto Sans KR', sans-serif;
	font-family: 'Roboto', sans-serif;
}

body {
	width: 100%;
	height: 100%;
	margin: 0px;
}

.container {
	width: 1920px;
	height: 929px;
	overflow: hidden;
}

#map {
	float: right;
}

.searchForm {
	width: 100%;
	height: 10%;
}

.store_list {
	float: left;
	width: 518px;
	height: 100%;
}

.search_layout {
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.seachBox {
	width: 450px;
	height: 50px;
	line-height: 50px;
	position: relative;
	border-radius: 20px;
	border: 1px solid silver;
	display: flex;
	justify-content: space-evenly;
	align-items: center;
}

.seachBar {
	line-height: 140px;
}

#seach {
	width: 350px;
	height: 30px;
	border-radius: 15px;
	border: none;
}

#seachBtn {
	width: 40px;
	height: 35px;
	position: relative;
	font-size: 8px;
	padding: 0px;
	line-height: 35px;
	background-color: white;
	border: 1px solid silver;
	border-radius: 10px;
}

#seachBtn:hover {
	cursor: pointer;
}

.restaurant_list_layout {
	height: 90%;
}

.restaurant_list {
	width: 98%;
	height: 93%;
	list-style: none;
	padding: 0px;
	margin: 0px;
	margin-left: 10px;
}

.restaurant {
	width: 100%;
	height: 140px;
	margin-bottom: 10px;
	border: 1px solid silver;
	border-radius: 70px;
}

.restaurant_none {
	margin: auto;
	width: 100%;
	height: 100%;
	border: 1px solid silver;
}

.none {
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.img_layout {
	float: left;
	width: 30%;
	height: 100%;
	border: 1px solid silver;
}

img {
	width: 100%;
	height: 100%;
}

.info_layout {
	float: left;
	height: 100%;
	width: 70%;
	display:flex;
	flex-direction:column;
	justify-content:center;
	align-items:center;
}

.info_layout_topside{
	width:100%;
	height:65%;
}
.info_layout_bottomside{
	width:100%;
	height:35%;
}

.info_layout_left {
	height: 100%;
	width: 60%;
	float: left;
	padding-top: 10px;
}

.info_layout_right {
	height: 100%;
	width: 40%;
	float: left;
	text-align: right;
	padding-top: 12px;
	padding-right: 20px;
}

.restaurant_info {
	margin: 15px;
}

.restaurant_name {
	font-size: 18px;
}

.restaurant_address {
	font-size: 16px;
}

.restaurant_score {
	font-size: 16px;
}

.restaurant_category {
	font-size: 16px;
}

.stars {
	padding: 0px;
	margin: 0px;
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.stars__link {
	text-decoration: none;
	padding: 2px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.stars__icon {
	color: #b2b2b2;
	display: inline-block;
	cursor: pointer;
}

.js-clear {
	color: #b2b2b2;
}

.js-fill {
	color: gold;
}

@media ( max-width : 27em) {
	.stars__icon {
		font-size: 2.5em;
	}
	.stars-phrase {
		font-size: 1em;
	}
}

.navigator {
	height: 7%;
	width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	padding-bottom: 10px;
	font-size: 20px;
	padding: 0px;
}

.navigator_list {
	list-style-type: none;
	padding-left: 0px;
	margin: 0px;
}

.navigator_list_item {
	width: 30px;
	height: 30px;
	float: left;
	margin-left: 5px;
	margin-right: 5px;
}

.navigator_list_item_btn_layout {
	width: 30px;
	height: 30px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.item {
	text-decoration: none;
}
</style>
</head>

<body>
	<div class=container>
		<div class="store_list">
			<form class="searchForm" action="/search.store">
				<div class="search_layout">
					<div class="seachBox">
						<input type="text" id="seach" name="search"> <input
							type="submit" id="seachBtn" value="검색">
					</div>
				</div>
			</form>
			<div class="restaurant_list_layout">
				<ul class="restaurant_list">
					<c:choose>
						<c:when test="${search_store_list==null}">
							<li class="restaurant_none">
								<div class="none">표시할 내용이 없습니다.<br>검색을 진행해주세요.</div>
							</li>

						</c:when>
						<c:otherwise>
							<c:forEach var='i' items='${search_store_list}'>
								<li class="restaurant">
									<div class="img_layout">
										<img src="/restaurant_img1.jpg">
									</div>
									<div class="info_layout">
										<div class=info_layout_topside>
											<div class="info_layout_left">
												<p class="restaurant_info restaurant_name">${i.name}</p>				
											</div>
											<div class="info_layout_right">
												<div class="restaurant_info restaurant_score">
													<ul class="stars">
														<a class="stars__link"><i
															class="stars__icon fas fa-star"></i></a>
														<a class="stars__link"><i
															class="stars__icon fas fa-star"></i></a>
														<a class="stars__link"><i
															class="stars__icon fas fa-star"></i></a>
														<a class="stars__link"><i
															class="stars__icon fas fa-star"></i></a>
														<a class="stars__link"><i
															class="stars__icon fas fa-star"></i></a>
													</ul>
												</div>
												<p class="restaurant_info restaurant_category">#${i.category}</p>
											</div>
										</div>
										<div class=info_layout_bottomside>
											<p class="restaurant_info restaurant_address">${i.address}</p>
										</div>
									</div>
								</li>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</ul>

				<div class="navigator">
					<ul class="navigator_list">
						<li class="navigator_list_item">
							<div class=navigator_list_item_btn_layout>
								<button class="navigator_direction_btn">
									<i class="fa-solid fa-angle-left"></i>
								</button>
							</div>
						</li>
						<li class="navigator_list_item">
							<div class=navigator_list_item_btn_layout>
								<a class="item" href="/searchResult.html">1</a>
							</div>
						</li>
						<li class="navigator_list_item">
							<div class=navigator_list_item_btn_layout>
								<a class="item" href="/searchResult.html">2</a>
							</div>
						</li>
						<li class="navigator_list_item">
							<div class=navigator_list_item_btn_layout>
								<a class="item" href="/searchResult.html">3</a>
							</div>
						</li>
						<li class="navigator_list_item">
							<div class=navigator_list_item_btn_layout>
								<a class="item" href="/searchResult.html">4</a>
							</div>
						</li>
						<li class="navigator_list_item">
							<div class=navigator_list_item_btn_layout>
								<a class="item" href="/searchResult.html">5</a>
							</div>
						</li>
						<li class="navigator_list_item">
							<div class=navigator_list_item_btn_layout>
								<a class="item" href="/searchResult.html">6</a>
							</div>
						</li>
						<li class="navigator_list_item">
							<div class=navigator_list_item_btn_layout>
								<a class="item" href="/searchResult.html">7</a>
							</div>
						</li>
						<li class="navigator_list_item">
							<div class=navigator_list_item_btn_layout>
								<a class="item" href="/searchResult.html">8</a>
							</div>
						</li>
						<li class="navigator_list_item">
							<div class=navigator_list_item_btn_layout>
								<a class="item" href="/searchResult.html">9</a>
							</div>
						</li>
						<li class="navigator_list_item">
							<div class=navigator_list_item_btn_layout>
								<a class="item" href="/searchResult.html">10</a>
							</div>
						</li>
						<li class="navigator_list_item">
							<div class=navigator_list_item_btn_layout>
								<button class="navigator_direction_btn">
									<i class="fa-solid fa-angle-right"></i>
								</button>
							</div>
						</li>
					</ul>
				</div>

			</div>

		</div>
		<div id="map" style="width: 1400px; height: 929px"></div>
	</div>




	<!-- 별점 등록 Script -->
	<script>
        let stars = document.querySelectorAll('.stars__link');
        let phrase = document.querySelector('.stars-phrase');

        /* using a variation of Chris Ferdinandi's get-siblings.js script (https://gist.github.com/cferdinandi/6203237)  */
        var getNextSiblings = function (elem) {
            var siblings = [];
            var sibling = elem;
            for (; sibling; sibling = sibling.nextElementSibling)
                siblings.push(sibling);
            return siblings;
        }

        var getPrevSiblings = function (elem) {
            var siblings = [];
            var sibling = elem;
            for (; sibling; sibling = sibling.previousElementSibling)
                siblings.push(sibling);
            console.log(siblings);
            return siblings;
        }

        stars.forEach((el, idx) => {
            el.addEventListener('click', (e) => {
                let nextSibs = getNextSiblings(el);
                nextSibs.forEach((sib) => {
                    sib.children[0].classList.add('js-clear');
                    sib.children[0].classList.remove('js-fill');
                });
                let prevSibs = getPrevSiblings(el);
                prevSibs.forEach((sib) => {
                    sib.children[0].classList.add('js-fill');
                });
            });
        });

    </script>


	<!-- 지도 Script -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2504febed8c67836e8db1a31bda054e9"></script>
	<script>
        var container = document.getElementById('map');
        var options = {
            center: new kakao.maps.LatLng(37.567917, 126.983043),
            level: 1
        };

        var map = new kakao.maps.Map(container, options);

        // 지도를 클릭한 위치에 표출할 마커입니다
        var marker = new kakao.maps.Marker({
            // 지도 중심좌표에 마커를 생성합니다 
            position: map.getCenter()
        });
        // 지도에 마커를 표시합니다
        marker.setMap(map);

        // 지도에 클릭 이벤트를 등록합니다
        // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
        kakao.maps.event.addListener(map, 'click', function (mouseEvent) {

            // 클릭한 위도, 경도 정보를 가져옵니다 
            var latlng = mouseEvent.latLng;

            // 마커 위치를 클릭한 위치로 옮깁니다
            marker.setPosition(latlng);

            var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
            message += '경도는 ' + latlng.getLng() + ' 입니다';

            var resultDiv = document.getElementById('x');
            resultDiv.innerHTML = message;
        });

        // 마커가 지도 위에 표시되도록 설정합니다
        marker.setMap(map);
        // 마커가 드래그 가능하도록 설정합니다 
        marker.setDraggable(true);
        // 아래 코드는 지도 위의 마커를 제거하는 코드입니다
        // marker.setMap(null);    
    </script>


</body>

</html>