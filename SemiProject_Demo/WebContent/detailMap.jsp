<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html class="full-height">
<head>
<meta charset="UTF-8">
<title>detailmap</title>
<link rel="stylesheet" href="css/bootstrap.min.css">

<style>
	.full-height { height: 100%; } 
	.full-width { width: 100%; }
	.padding-none { padding-left:0px; padding-right:0px;}
	.overlay {position: absolute;width: 100%;min-height: 100%;left: 0;top: 0;}
	.map_wrap, .map_wrap * {margin:0; font-family:'Malgun Gothic',dotum,'돋움',sans-serif;}
	.map_wrap {position:relative;width:100%;}
	#category {position:relative; margin-left:auto; margin-right:auto; width:205px;top:10px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;}
	#category li {float:left;list-style: none;width:50px;px;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;}
	#category li.on {background: #eee;}
	#category li:hover {background: #ffe6e6;border-left:1px solid #acacac;margin-left: -1px;}
	#category li:last-child{margin-right:0;border-right:0;}
	#category li span {display: block;margin:0 auto 3px;width:27px;height: 28px;}
	#category li .category_bg {background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png) no-repeat;}
	#category li .restaurant {background:url(./icon/restaurant.png); background-size: contain;}
	#category li .lodgment {background:url(./icon/home-symbol.png); background-size: contain;}
	#category li .pharmacy {background-position: -10px -72px;}
	#category li .festival {background:url(./icon/festival.png); background-size: cover;}
	#category li .cafe {background-position: -10px -144px;}
	#category li .landmark {background:url(./icon/landmark.png); background-size: cover;}
	#category li.on .category_bg {background-position-x:-46px;}
	.placeinfo_wrap {position:absolute;bottom:28px;left:-150px;width:300px;}
	.placeinfo {position:relative;width:100%;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;padding-bottom: 10px;background: #fff;}
	.placeinfo:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
	.placeinfo_wrap .after {content:'';position:relative;margin-left:-12px;left:50%;width:22px;height:12px;background:url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
	.placeinfo a, .placeinfo a:hover, .placeinfo a:active{color:#fff;text-decoration: none;}
	.placeinfo a, .placeinfo span {display: block;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
	.placeinfo span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
	.placeinfo .title {font-weight: bold; font-size:14px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff;background: #d95050;background: #d95050 url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
	.placeinfo .tel {color:#0f7833;}
	.placeinfo .jibun {color:#999;font-size:11px;margin-top:0;}
	.placeinfo .close {position: absolute;top: 45px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
	.placeinfo .close:hover {cursor: pointer;}
	
	#menu_wrap {position:absolute;left:0;right:0;top:0;bottom:0;margin:10px 10px 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
	.bg_white {background:#fff;}
	#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
	#menu_wrap .option{text-align: center;}
	#menu_wrap .option p {margin:10px 0;}  
	#menu_wrap .option button {margin-left:5px;}
	#placesList {padding:0px;}
	#placesList li {list-style: none;}
	#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
	#placesList .item span {display: block;margin-top:4px;}
	#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
	#placesList .item .info{padding:10px 0 10px 55px;}
	#placesList .info .gray {color:#8a8a8a;}
	#placesList .info .jibun {padding-left:26px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
	#placesList .info .tel {color:#009900;}
	#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
	#placesList .item .markerplacebg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png) no-repeat;}
	#placesList .item .marker_1 {background-position: 0 -10px;}
	#placesList .item .marker_2 {background-position: 0 -56px;}
	#placesList .item .marker_3 {background-position: 0 -102px}
	#placesList .item .marker_4 {background-position: 0 -148px;}
	#placesList .item .marker_5 {background-position: 0 -194px;}
	#placesList .item .marker_6 {background-position: 0 -240px;}
	#placesList .item .marker_7 {background-position: 0 -286px;}
	#placesList .item .marker_8 {background-position: 0 -332px;}
	#placesList .item .marker_9 {background-position: 0 -378px;}
	#placesList .item .marker_10 {background-position: 0 -423px;}
	#placesList .item .marker_11 {background-position: 0 -470px;}
	#placesList .item .marker_12 {background-position: 0 -516px;}
	#placesList .item .marker_13 {background-position: 0 -562px;}
	#placesList .item .marker_14 {background-position: 0 -608px;}
	#placesList .item .marker_15 {background-position: 0 -654px;}
	#pagination {margin:10px auto;text-align: center;}
	#pagination a {display:inline-block;margin-right:10px;}
	#pagination .on {font-weight: bold; cursor: default;color:#777;}
	
	.label {margin-bottom: 96px;}
	.label * {display: inline-block;vertical-align: top;}
	.label .left {background: url("http://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_l.png") no-repeat;display: inline-block;height: 24px;overflow: hidden;vertical-align: top;width: 7px;}
	.label .center {background: url(http://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_bg.png) repeat-x;display: inline-block;height: 24px;font-size: 12px;line-height: 24px;}
	.label .right {background: url("http://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_r.png") -1px 0  no-repeat;display: inline-block;height: 24px;overflow: hidden;width: 6px;}
		
	.wrap {position: absolute;margin: 0 0 -10px -10px;left: 0;bottom: 40px;width: 300px;height: 142px;text-align: left;overflow: hidden ;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
	.wrap * {padding: 0;margin: 0;}
	.wrap .infomation {width: 286px;height: 130px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
	.wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
	.infomation .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 16px;font-weight: bold;}
	.infomation .close {position: absolute;top: 10px;right: 20px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
	.infomation .close:hover {cursor: pointer;}
	.infomation .body {position: relative;/* overflow: hidden; */}
	.infomation .desc {position: relative;margin: 13px 0 0 13px;height: 55px;}
	.desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
	.desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
	.infomation:after {content: '';position: absolute;bottom: 3px;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png') }
	.infomation .link {color: #5085BB;}

	.customButton {position:absolute;right:10px;bottom:0;margin:10px 10px 10px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;border-radius: 10px;}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js" integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l" crossorigin="anonymous"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js" integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c" crossorigin="anonymous"></script>

</head>
<body class="full-height">	
	<div class="container-fluid full-height">
		<div class="row full-height">
			<div class="col-sm-6 col-md-2 padding-none">
				<nav class="d-none d-sm-block bg-light sidebar full-width">
					<div class="customButton">
						<button type="button" class="btn btn-default btn-sm">
			        	  <span class="fas fa-plus"></span> 추가
			      	 	</button>
			        </div>
					<ul class="nav nav-pills flex-column">
						<li class="nav-item"><a class="nav-link active" href="#">Overview
								<span class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#">Reports</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="#">Analytics</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="#">Export</a>
						</li>
					</ul>

					<ul class="nav nav-pills flex-column">
						<li class="nav-item"><a class="nav-link" href="#">Nav
								item</a></li>
						<li class="nav-item"><a class="nav-link" href="#">Nav
								item again</a></li>
						<li class="nav-item"><a class="nav-link" href="#">One
								more nav</a></li>
						<li class="nav-item"><a class="nav-link" href="#">Another
								nav item</a></li>
					</ul>

					<ul class="nav nav-pills flex-column">
						<li class="nav-item"><a class="nav-link" href="#">Nav
								item again</a></li>
						<li class="nav-item"><a class="nav-link" href="#">One
								more nav</a></li>
						<li class="nav-item"><a class="nav-link" href="#">Another
								nav item</a></li>
					</ul>
				</nav>
			</div>
			<div class="col-sm-6 col-md-2">
				<div id="menu_wrap" class="full-width bg_white">
					<div class="option">
						<div>
							<form onsubmit="searchPlaces(); return false;">
								키워드 : <input type="text" value="역삼 맛집" id="keyword" size="15">
								<button type="submit">검색하기</button>
							</form>
						</div>
					</div>					
					<ul id="category" class="padding-none">
							<li id="FD6" data-order="0"><span class="restaurant"></span>음식점</li>
							<li id="AD5" data-order="1"><span class="lodgment"></span>숙박</li>
							<li id="AT4" data-order="2"><span class="landmark"></span>관광명소</li>
							<li id="AAA" data-order="3"><span class="festival"></span>축제정보</li>
					</ul>					
					<hr>
					<ul id="placesList"></ul>
					<div id="pagination"></div>					
				</div>
				<div class="customButton"><input class="btn btn-primary btn-sm" type="button" value="추가"></div>
			</div>
			<div class="map_wrap col-md-8 pull-right full-height">
				<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
				<div id="clustermap" class="overlay"></div>
				<div class="customButton">
					<input class="btn btn-primary btn-sm" type="button" value="저장">
					<input class="btn btn-primary btn-sm" type="button" value="다음으로">
				</div>
			</div>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2360278da0d0c6bd52ae10b4eaddaea5&libraries=services,clusterer,drawing"></script>
			<script type="text/javascript">
				// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
				var placeOverlay = new daum.maps.CustomOverlay({zIndex:1}), 
				    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
				    markers = [], // 마커를 담을 배열입니다
				    currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
				 
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = {
				        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
				        level: 5 // 지도의 확대 레벨
				    };  
				
				// 지도를 생성합니다    
				var map = new daum.maps.Map(mapContainer, mapOption); 				
				
				
			/*    지도 컨트롤러 */
				// 지도 타입 변경 컨트롤을 생성한다
				var mapTypeControl = new daum.maps.MapTypeControl();

				// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
				map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);	

				// 지도에 확대 축소 컨트롤을 생성한다
				var zoomControl = new daum.maps.ZoomControl();

				// 지도의 우측에 확대 축소 컨트롤을 추가한다
				map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);				
			
				
			/* 	카테고리 항목 지도 표시기능	 */		
				// 장소 검색 객체를 생성합니다
				var ps = new daum.maps.services.Places(map); 
					
				// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
				contentNode.className = 'placeinfo_wrap';
				
				// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
				// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 daum.maps.event.preventMap 메소드를 등록합니다 
				addEventHandle(contentNode, 'mousedown', daum.maps.event.preventMap);
				addEventHandle(contentNode, 'touchstart', daum.maps.event.preventMap);
				
				// 커스텀 오버레이 컨텐츠를 설정합니다
				placeOverlay.setContent(contentNode);  
				
				// 각 카테고리에 클릭 이벤트를 등록합니다
				addCategoryClickEvent();	
				
				$("#clustermap").fadeOut().delay(1000);
				
				// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
				function addEventHandle(target, type, callback) {
				    if (target.addEventListener) {
				        target.addEventListener(type, callback);
				    } else {
				        target.attachEvent('on' + type, callback);
				    }
				}
				
				// 카테고리 검색을 요청하는 함수입니다
				function searchPlacesCG() {					
				    if (!currCategory) {
				        return;
				    }				
				    
				    // 커스텀 오버레이를 숨깁니다 
				    placeOverlay.setMap(null);
				    searchOverlay.setMap(null);				
				    				    
				    ps.categorySearch(currCategory, placesSearchCG, {useMapBounds:true});				
				}
				
				// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
				function placesSearchCG(data, status, pagination) {
					if (status === daum.maps.services.Status.OK) {			    	
				    	
				        // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
				        displayPlacesCG(data);
				        
				     	// 페이지 번호를 표출합니다
				        displayPagination(pagination);
				   		
				    } else if (status === daum.maps.services.Status.ZERO_RESULT) {
				        // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요
				
				    } else if (status === daum.maps.services.Status.ERROR) {
				        // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
				        
				    }
				}
				
				// 지도에 마커를 표출하는 함수입니다
				function displayPlacesCG(places) {					
					
				    // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
				    // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
				    //var order = document.getElementById(currCategory).getAttribute('data-order');
									    
				    var listEl = document.getElementById('placesList'), 
				    menuEl = document.getElementById('menu_wrap'),
				    fragment = document.createDocumentFragment(), 
				    //bounds = new daum.maps.LatLngBounds(), 
				    listStr = '';			    	
				    				    
				    // 검색 결과 목록에 추가된 항목들을 제거합니다
				    removeAllChildNods(listEl);				
				    
					// 지도에 표시되고 있는 마커를 제거합니다
				    removeMarker();					
				    
				    for ( var i=0; i<places.length; i++ ) {
				
				            // 마커를 생성하고 지도에 표시합니다
					        var placePosition = new daum.maps.LatLng(places[i].y, places[i].x),
					            marker = addMarkerCG(placePosition), 
					            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

					        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
					        // LatLngBounds 객체에 좌표를 추가합니다
					       	//bounds.extend(placePosition);				    	
				            
					      	(function(marker, title, place) {
					            daum.maps.event.addListener(marker, 'mouseover', function() {
					            	displayPlaceInfoSC(marker,title);
					            });

					            daum.maps.event.addListener(marker, 'mouseout', function() {
					            	searchOverlay.setMap(null);
					            });								
					            
					            itemEl.onclick = function () {
					            	displayPlaceInfo(place);				            			            	
					            };
					            /* itemEl.onmouseover =  function () {
					            	displayPlaceInfoSC(marker,title);
					            };

					            itemEl.onmouseout =  function () {
					            	searchOverlay.setMap(null);
					            }; */
					        }
					        )(marker, places[i].place_name, places[i]);		   
				            
				            // 마커와 검색결과 항목을 클릭 했을 때
				            // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
				            (function(marker, place) {
				                daum.maps.event.addListener(marker, 'click', function() {
				                    displayPlaceInfo(place);
				                });
				            })(marker, places[i]);
					        
				            fragment.appendChild(itemEl);				            
				    }
				    
				    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
				    listEl.appendChild(fragment);
				    menuEl.scrollTop = 0;

				    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
				    //map.setBounds(bounds);	
				}
				
				// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
				function addMarkerCG(position) {
					
					var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
					// 마커 이미지의 이미지 크기 입니다
					var imageSize = new daum.maps.Size(24, 35); 					    
					// 마커 이미지를 생성합니다    
					var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
					    
				   /*  var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
				        imageSize = new daum.maps.Size(27, 28),  // 마커 이미지의 크기
				        imgOptions =  {
				            spriteSize : new daum.maps.Size(72, 208), // 스프라이트 이미지의 크기
				            spriteOrigin : new daum.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				            offset: new daum.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
				        },
				        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions), */
				      	var marker = new daum.maps.Marker({
				            position: position, // 마커의 위치
				            image: markerImage 
				        });
				
				    marker.setMap(map); // 지도 위에 마커를 표출합니다
				    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
				
				    return marker;
				}				
				
				// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
				function displayPlaceInfo (place) {
				    var content = '<div class="placeinfo">' +
				                    '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   
				
				    if (place.road_address_name) {
				        content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
				                    '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
				    }  else {
				        content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
				    }                
				   
				    content += '    <span class="tel">' + place.phone + '</span>' + 
				    '            <div class="close" onclick="closeOverlay()" title="닫기"></div>'+
				                '</div>' + 
				                '<div class="after"></div>';
				
				    contentNode.innerHTML = content;
				    placeOverlay.setPosition(new daum.maps.LatLng(place.y, place.x));
				    placeOverlay.setMap(map);  
				}
				
				
				// 각 카테고리에 클릭 이벤트를 등록합니다
				function addCategoryClickEvent() {
				    var category = document.getElementById('category'),
				        children = category.children;				
					 
				    for (var i=0; i<children.length; i++) {
				        children[i].onclick = onClickCategory;
				    }				    
				 	
				}
				
				// 카테고리를 클릭했을 때 호출되는 함수입니다
				function onClickCategory() {
				    var id = this.id,
				        className = this.className;
				    var listEl = document.getElementById('placesList');
				    
				 
				    placeOverlay.setMap(null);		
				    
				    daum.maps.event.removeListener(map, 'idle', searchPlacesCG);				    
				    	
				    if (className === 'on') {
				        currCategory = '';
				        changeCategoryClass();
				        removeMarker();
				        removeAllChildNods(listEl);
				        $("#pagination").hide();
				    } else if (id == 'AAA'){
					    currCategory = '';
					    changeCategoryClass();
					    removeMarker();
					    removeAllChildNods(listEl);
					    $("#map").hide();
					    $("#pagination").hide();
					    $("#clustermap").show();					    
					}else {				    
				        currCategory = id;
				        changeCategoryClass(this);			    	 
				      	searchPlacesCG();
				      	$("#map").show();
				      	$("#pagination").show();
				    	$("#clustermap").hide();
				     	// 지도에 idle 이벤트를 등록합니다
						daum.maps.event.addListener(map, 'idle', searchPlacesCG);
				    }		
				}
				
				// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
				function changeCategoryClass(el) {
				    var category = document.getElementById('category'),
				        children = category.children,
				        i;					
					 
				    for ( i=0; i<children.length; i++ ) {
				        children[i].className = '';
				    }
				
				    if (el) {
				        el.className = 'on';
					    
				    } 				    
				}
				
			/* 	키워드 검색 기능	 */			
				
			
				// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
				
				var searchOverlay = new daum.maps.CustomOverlay({
						xAnchor: 0.5, // 컨텐츠의 x 위치						
						yAnchor: 0 // 컨텐츠의 y 위치
					});
				//searchPlaces();
				    
				// 키워드 검색을 요청하는 함수입니다
				function searchPlaces() {

				    var keyword = document.getElementById('keyword').value;					
				    var category = document.getElementById('category'),
			        children = category.children;
				    
				    if (!keyword.replace(/^\s+|\s+$/g, '')) {
				        alert('키워드를 입력해주세요!');
				        return false;
				    }
				    
				 	// 커스텀 오버레이를 숨깁니다 
				 	placeOverlay.setMap(null);
				    searchOverlay.setMap(null);
				    
				    $("#map").show();
			    	$("#clustermap").hide();
								    
				    for (var i=0; i<children.length; i++) {
				    	if (children[i].className == 'on') {
					        currCategory = '';
					        changeCategoryClass();
					        removeMarker();
					        daum.maps.event.removeListener(map, 'idle', searchPlacesCG);
					    }
				    }				    
				    
				    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
				    ps.keywordSearch( keyword, placesSearchCB); 
				}
			
				// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
				function placesSearchCB(data, status, pagination) {
				    if (status === daum.maps.services.Status.OK) {

				        // 정상적으로 검색이 완료됐으면
				        // 검색 목록과 마커를 표출합니다
				        displayPlaces(data);

				        // 페이지 번호를 표출합니다
				        displayPagination(pagination);

				    } else if (status === daum.maps.services.Status.ZERO_RESULT) {

				        alert('검색 결과가 존재하지 않습니다.');
				        return;

				    } else if (status === daum.maps.services.Status.ERROR) {

				        alert('검색 결과 중 오류가 발생했습니다.');
				        return;

				    }
				}
				
				// 검색 결과 목록과 마커를 표출하는 함수입니다
				function displayPlaces(places) {

				    var listEl = document.getElementById('placesList'), 
				    menuEl = document.getElementById('menu_wrap'),
				    fragment = document.createDocumentFragment(), 
				    bounds = new daum.maps.LatLngBounds(), 
				    listStr = '';
				    
				    // 검색 결과 목록에 추가된 항목들을 제거합니다
				    removeAllChildNods(listEl);

				    // 지도에 표시되고 있는 마커를 제거합니다
				    removeMarker();
				    
				    for ( var i=0; i<places.length; i++ ) {

				        // 마커를 생성하고 지도에 표시합니다
				        var placePosition = new daum.maps.LatLng(places[i].y, places[i].x),
				            marker = addMarker(placePosition, i), 
				            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

				        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				        // LatLngBounds 객체에 좌표를 추가합니다
				        bounds.extend(placePosition);

				        // 마커와 검색결과 항목에 mouseover 했을때
				        // 해당 장소에 인포윈도우에 장소명을 표시합니다
				        // mouseout 했을 때는 인포윈도우를 닫습니다
				        (function(marker, title, place) {
				            daum.maps.event.addListener(marker, 'mouseover', function() {
				            	displayPlaceInfoSC(marker,title);
				            });

				            daum.maps.event.addListener(marker, 'mouseout', function() {
				            	searchOverlay.setMap(null);
				            });						
				            
				            itemEl.onclick = function () {
				            	displayPlaceInfo(place);				            			            	
				            };

				            /* itemEl.onmouseover =  function () {
				            	displayPlaceInfoSC(marker,title);
				            };

				            itemEl.onmouseout =  function () {
				            	searchOverlay.setMap(null);
				            }; */
				        }
				        )(marker, places[i].place_name, places[i]);
				        
				    	// 마커와 검색결과 항목을 클릭 했을 때
			            // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
			            (function(marker, place) {
			                daum.maps.event.addListener(marker, 'click', function() {
			                    displayPlaceInfo(place);
			                });
			            })(marker, places[i]);

				        fragment.appendChild(itemEl);
				    }

				    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
				    listEl.appendChild(fragment);
				    menuEl.scrollTop = 0;

				    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
				    map.setBounds(bounds);
				}
				
				// 검색결과 항목을 Element로 반환하는 함수입니다
				function getListItem(index, places) {

				    var el = document.createElement('li'),
				    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
				                '<div class="info">' +
				                '   <h5>' + places.place_name + '</h5>';

				    if (places.road_address_name) {
				        itemStr += '    <span>' + places.road_address_name + '</span>' +
				                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
				    } else {
				        itemStr += '    <span>' +  places.address_name  + '</span>'; 
				    }
				                 
				      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
				                '</div>';           

				    el.innerHTML = itemStr;
				    el.className = 'item';

				    return el;
				}

				// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
				function addMarker(position, idx, title) {
				    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
				        imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
				        imgOptions =  {
				            spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
				            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				            offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
				        },
				        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
				            marker = new daum.maps.Marker({
				            position: position, // 마커의 위치
				            image: markerImage 
				        });

				    marker.setMap(map); // 지도 위에 마커를 표출합니다
				    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

				    return marker;
				}
				
				// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
				function displayPagination(pagination) {
				    var paginationEl = document.getElementById('pagination'),
				        fragment = document.createDocumentFragment(),
				        i; 

				    // 기존에 추가된 페이지번호를 삭제합니다
				    while (paginationEl.hasChildNodes()) {
				        paginationEl.removeChild (paginationEl.lastChild);
				    }

				    for (i=1; i<=pagination.last; i++) {
				        var el = document.createElement('a');
				        el.href = "#";
				        el.innerHTML = i;

				        if (i===pagination.current) {
				            el.className = 'on';
				        } else {
				            el.onclick = (function(i) {
				                return function() {
				                    pagination.gotoPage(i);
				                }
				            })(i);
				        }

				        fragment.appendChild(el);
				    }
				    paginationEl.appendChild(fragment);
				}
				
				// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
				function displayPlaceInfoSC (marker,title) {
				    var content = '<div class ="label"><span class="left"></span><span class="center">'+title+'</span><span class="right"></span></div>';
									    
				    searchOverlay.setPosition(marker.getPosition());
				    searchOverlay.setMap(map); 
				    searchOverlay.setContent(content);				    				     
				}

				 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
				function removeAllChildNods(el) {   
				    while (el.hasChildNodes()) {
				        el.removeChild (el.lastChild);
				    }
				}
				 
				// 지도 위에 표시되고 있는 마커를 모두 제거합니다
				function removeMarker() {
				    for ( var i = 0; i < markers.length; i++ ) {
				        markers[i].setMap(null);
				    }   
				    markers = [];
				}
			</script>			
			<script type="text/javascript">
				var mapContainerCl = document.getElementById('clustermap'); // 지도를 표시할 div
				var mapOptionsCl = {
					center: new daum.maps.LatLng(37.4796525493038, 126.98064883021), // 지도의 중심좌표
					level: 12 // 지도의 확대 레벨
				};
				
				// 지도를 생성합니다
				var clustermap = new daum.maps.Map(mapContainerCl, mapOptionsCl);			
				
				// 지도 타입 변경 컨트롤을 생성한다
				var mapTypeControl = new daum.maps.MapTypeControl();
	
				// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
				clustermap.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);	
	
				// 지도에 확대 축소 컨트롤을 생성한다
				var zoomControl = new daum.maps.ZoomControl();
	
				// 지도의 우측에 확대 축소 컨트롤을 추가한다
				clustermap.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
				
							
				// 마커 클러스터러를 생성합니다
			    // 마커 클러스터러를 생성할 때 disableClickZoom 값을 true로 지정하지 않은 경우
			    // 클러스터 마커를 클릭했을 때 클러스터 객체가 포함하는 마커들이 모두 잘 보이도록 지도의 레벨과 영역을 변경합니다
			    // 이 예제에서는 disableClickZoom 값을 true로 설정하여 기본 클릭 동작을 막고
			    // 클러스터 마커를 클릭했을 때 클릭된 클러스터 마커의 위치를 기준으로 지도를 1레벨씩 확대합니다
			    var clusterer = new daum.maps.MarkerClusterer({
			        map: clustermap, // 마커들을 클러스터로 관리하고 표시할 지도 객체
			        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
			        minLevel: 10, // 클러스터 할 최소 지도 레벨
			        minClusterSize: 4,
			        disableClickZoom: true // 클러스터 마커를 클릭했을 때 지도가 확대되지 않도록 설정한다
			    });
				
			    var overlay = new daum.maps.CustomOverlay({zIndex:1});
	
			    // 데이터를 가져오기 위해 jQuery를 사용합니다
			    // 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
			    $.get("json/festival.json", function(data) {
			        // 데이터에서 좌표 값을 가지고 마커를 표시합니다
			        // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
			        var markers = $(data.records).map(function(i, record) {
			        	
			        	// 마커 이미지의 이미지 주소입니다
			        	var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
			        	// 마커 이미지의 이미지 크기 입니다
			            var imageSize = new daum.maps.Size(24, 35); 
			            // 마커 이미지를 생성합니다    
			            var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
			        	
			        	var marker = new daum.maps.Marker({
			                position : new daum.maps.LatLng(record.위도, record.경도),
			        		title : record.축제명,
			        		image : markerImage
			            });
		        	    
			        	 // 마커에 클릭이벤트를 등록합니다
		        	    daum.maps.event.addListener(marker, 'click', function() {
		        	    	displayPlaceInfoFe(marker,record);
		                });
		        		
			            return marker;
			        });
	
			        // 클러스터러에 마커들을 추가합니다
			        clusterer.addMarkers(markers);
			    });
	
			    // 마커 클러스터러에 클릭이벤트를 등록합니다
			    // 마커 클러스터러를 생성할 때 disableClickZoom을 true로 설정하지 않은 경우
			    // 이벤트 헨들러로 cluster 객체가 넘어오지 않을 수도 있습니다
			    daum.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {
	
			        // 현재 지도 레벨에서 1레벨 확대한 레벨
			        var level = clustermap.getLevel()-1;		        
			        			        
			        var listEl = document.getElementById('placesList'), 
				    menuEl = document.getElementById('menu_wrap'),
				    fragment = document.createDocumentFragment(),
				    listStr = '';			    	
				    				
				    // 검색 결과 목록에 추가된 항목들을 제거합니다
				    removeAllChildNods(listEl);
				    
				    var mark = cluster.getMarkers();
				    for ( var i=0; i< cluster.getSize() ; i++ ) {		            
						var itemEl = getListItemCl(mark[i].getTitle()); // 검색 결과 항목 Element를 생성합니다			            
					        			            
				        (function(marker, title) {
					   		itemEl.onmouseover = function () {
					           displayPlaceInfoCl(marker,title);				            			            	
					        };
					            
					        itemEl.onmouseout = function () {
					            overlay.setMap(null);
					        };
					    })(mark[i], mark[i].getTitle());
				            
				        fragment.appendChild(itemEl);
				   	}
				   
				    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
				    listEl.appendChild(fragment);
				    menuEl.scrollTop = 0;			    

				 	// 지도를 클릭된 클러스터의 마커의 위치를 기준으로 확대합니다
			        clustermap.setLevel(level, {anchor: cluster.getCenter()});
			    });
			    
			 	// 클러스터 마커 항목을 Element로 반환하는 함수입니다
				function getListItemCl(title) {
				    var el = document.createElement('li'),
				    itemStr = '<span class="markerplacebg"></span>' +
				                '<div class="info">' +
				                '   <h5>' + title + '</h5></div>';

				    el.innerHTML = itemStr;
				    el.className = 'item';

				    return el;
				}
				
				/* // 마커를 생성합니다
				var marker = new daum.maps.Marker({
					position: map.getCenter()
				});
				
				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);
				// 마커가 드래그 가능하도록 설정합니다 
				marker.setDraggable(true); 
				
				daum.maps.event.addListener(map, 'click', function(mouseEvent) {        
				    
				    // 클릭한 위도, 경도 정보를 가져옵니다 
				    var latlng = mouseEvent.latLng;				    
				    
					// 마커 위치를 클릭한 위치로 옮깁니다
				    marker.setPosition(latlng);									
				}); */
				
				function displayPlaceInfoCl (marker,title) {
				    var content = '<div class ="label"><span class="left"></span><span class="center">'+title+'</span><span class="right"></span></div>';
									    
				    overlay.setPosition(marker.getPosition());
				    overlay.setMap(clustermap); 
				    overlay.setContent(content);				    				     
				}
				
				// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
				function displayPlaceInfoFe (marker,record) {
					var content = 	'<div class="wrap">' + 
	                '    <div class="infomation">' + 
	                '        <div class="title">' + 
	              				 record.축제명 + 
	                '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
	                '        </div>' + 
	                '        <div class="body">' + 
	                '            <div class="desc">'+
	                '                <div class="ellipsis">축제 기간: '+record.축제시작일자+'~'+record.축제종료일자+'</div>';
	                if(record.소재지도로명주소){
	                	content +=	
	                '                <div class="ellipsis">'+record.소재지도로명주소+'</div>';
	                } else if (record.소재지지번주소){
	                	content +=	
	                '                <div class="jibun ellipsis">'+record.소재지지번주소+'</div>';
	                }
	                if(record.홈페이지주소){
	                	content +=
	                '                <div><a href="'+record.홈페이지주소+'" target="_blank" class="link">홈페이지</a></div>';
		       		}
	                if(record.전화번호){ 
	                	content += '                <div>전화번호 : '+record.전화번호+'</div>';
	                }
	                '            </div>' + 
	                '        </div>' + 
	                '    </div>' +    
	                '</div>';
	        	    
	        	    overlay.setPosition(marker.getPosition());
	        	    overlay.setMap(clustermap);
	        	    overlay.setContent(content);							    		    				     
				}
				
				// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
	    	    function closeOverlay() {
	    	        overlay.setMap(null);
	    	        placeOverlay.setMap(null);
				    searchOverlay.setMap(null);
	    	    }			
				
			</script>
		</div>
	</div>


</body>
</html>