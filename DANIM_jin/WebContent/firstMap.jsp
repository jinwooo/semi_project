<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html class="full-height">
<head>
<meta charset="UTF-8">
<title>selectmap</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-timepicker.min.css" />
<link rel='stylesheet' href='css/fullcalendar.min.css' />
<link rel='stylesheet' href='css/fullcalendar.print.min.css' media='print' />

<style type="text/css">
	.full-height { height: 100%; } 
	.full-width { width: 100%; }
	.padding-none { padding-left:0px; padding-right:0px;}
	#text {	height: 50px;}
	#list {	margin : 10px;}
	.area {position: absolute;background: #fff;border: 1px solid #888;border-radius: 3px;font-size: 12px;top: -5px;left: 15px;padding:2px;}
	#mapwrap{position:relative;overflow:hidden;}
	#menu {cursor:pointer;background-image:url('./icon/icon.png');position:absolute;overflow:hidden;top:10px;left:10px;width:100px;height:180px;z-index:10;border:1px solid black;background-color:#fff;}
	
	.calendarLayout {width: 70%; margin: 20px 10px; padding: 0; font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif; font-size: 14px;} */
 	#calendar {max-width: 900px; margin: 0 auto;}
 	#schedule {width: 80%; max-width: 900px;}
 	
 	#my_tbody tr td {vertical-align:middle;}
 	#my_tbody tr td input{border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;}
 	.customButton {position:absolute;right:10px;bottom:0;margin:10px 10px 10px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;border-radius: 10px;}
 	
 	.dotOverlay {position:relative;bottom:10px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;font-size:12px;padding:5px;background:#fff;}
	.dotOverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
	.number {font-weight:bold;color:#ee6152;}
	.dotOverlay:after {content:'';position:absolute;margin-left:-6px;left:50%;bottom:-8px;width:11px;height:8px;background:url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')}
	.distancelabel {margin-bottom: 96px;}
	.distancelabel * {display: inline-block;vertical-align: top;}
	.distancelabel .left {background: url("http://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_l.png") no-repeat;display: inline-block;height: 24px;overflow: hidden;vertical-align: top;width: 7px;}
	.distancelabel .center {background: url(http://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_bg.png) repeat-x;display: inline-block;height: 24px;font-size: 12px;line-height: 24px;}
	.distancelabel .right {background: url("http://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_r.png") -1px 0  no-repeat;display: inline-block;height: 24px;overflow: hidden;width: 6px;}
	 	 	
</style>

	<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/bPolygon.js"></script>	
	<script type="text/javascript" src='lib/moment.min.js'></script>
	<script type="text/javascript" src='js/fullcalendar.min.js'></script>
	<script type="text/javascript" src="js/bootstrap-timepicker.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2360278da0d0c6bd52ae10b4eaddaea5&libraries=services,clusterer,drawing"></script>
	<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js" integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l" crossorigin="anonymous"></script>
	<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js" integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c" crossorigin="anonymous"></script>

	<script type="text/javascript">
		var cnt = 0;
		var myStartDate = '';
		var myEndDate = '';
		var mySelectPlace = '';
		
		$(document).ready(function() {
			$('#calendar').fullCalendar(
					{
						aspectRatio : 1.5,
						selectable : true,
						eventLimit : false,
						editable : true,
						header : {
							left : 'prev,next today',
							center : 'title',
							right : 'month'
						},
						select : function(startDate, endDate) {
							//alert('selected ' + startDate.format() + ' to '+ endDate.format());
							if (!$("#tmpPlace").val().replace(/^\s+|\s+$/g, '') || !$("#tmpPlace").val().replace('전국', '')) {
							        alert('장소를 선택해주세요!');
							        return false;
							}							
							myTitle = $("#tmpPlace").val();
							
							if (startDate.isValid() & endDate.isValid()) {
								$('#calendar').fullCalendar('renderEvent', {
									id : (++cnt),
									title : myTitle,
									start : startDate,
									end : endDate,
									allDay : true,
									color : "#" + Math.round(Math.random()*0xffffff).toString(16)
								});
								myStartDate = startDate.format();
								myEndDate = endDate.subtract(1, 'days').format();
								$("#addrow").click();
							} else {
								alert('Invalid date.');
							}
						},
						eventClick : function(event) {
							if (confirm('일정을 삭제하시겠습니까?')) {
								$('#calendar').fullCalendar('removeEvents',	event._id);
								$('#my_tbody > tr > td:nth-child(5n+2):contains("'+event.id+'")').parent().remove();
								reCalculate();
							}
						},
						eventDrop: function(event, delta, revertFunc) {
							//alert(event.title + " was dropped on " + event.start.format());
						    if (!confirm("일정을 이동하시겠습니까?")) {
						      revertFunc();
						    }
						    $('#my_tbody > tr > td:nth-child(5n+2):contains("'+event.id+'")').next().next().text(event.start.format()+' ~ '+event.end.subtract(1, 'days').format());
						},
						eventResize: function(event, delta, revertFunc) {
						    //alert(event.title + " end is now " + event.end.format());
						    if (!confirm("일정을 변경하시겠습니까?")) {
						      revertFunc();
						    }
						    $('#my_tbody > tr > td:nth-child(5n+2):contains("'+event.id+'")').next().next().text(event.start.format()+' ~ '+event.end.subtract(1, 'days').format());
						}						
					});		

			/* setTimeout(function() {
				$('#timeDisplay').text($('#timepicker1').val());
			}, 100);

			$('#timepicker1').on('changeTime.timepicker', function(e) {
				$('#timeDisplay').text(e.time.value);
			}); */
			
			$('#showdistance').on('click', function() {
			    //Find the child check box. 
			    var $input = $(this).find('input'); 

			    $(this).toggleClass('btn-danger btn-success');
			    if ($(this).hasClass('btn-danger')) {
			    	if ($("#my_tbody tr td:nth-child(6)").text() == null || !$("#my_tbody tr td:nth-child(6)").text().replace(/^\s+|\s+$/g, '')) {
				        alert('일정을 선택해주세요!');
				        return false;
				    }
			   		$input.removeAttr('checked');
			     	searchPlaces();
			    } else { 
			     $input.attr('checked', '');
			     showCalendar();
			    } 

			    return false; //Click event is triggered twice and this prevents re-toggling of classes 
			});
			
			$("body").on( "click", "#addrow", function() {							
				var my_tbody = document.getElementById('my_tbody');
			    				
			    // var row = my_tbody.insertRow(0); // 상단에 추가
			    var row = my_tbody.insertRow( my_tbody.rows.length-1 ); // 하단에 추가
			    var cell1 = row.insertCell(0);
			    var cell2 = row.insertCell(1);
			    var cell3 = row.insertCell(2);
			    var cell4 = row.insertCell(3);
			    var cell5 = row.insertCell(4);
			    var cell6 = row.insertCell(5);
			    //cell1.innerHTML = '<input type="checkbox" name="chk" value="'+cnt+'" />';
			    //cell1.innerHTML = "<td><input type='button' value='삭제' id='del_btn' class='btn btn-default btn-sm' /></td>"
			    cell1.innerHTML = '<button type="button" id="del_btn" class="btn btn-link btn-sm black"><span style="color:black;" class="glyphicon glyphicon-remove"></span></button>';
			    cell2.setAttribute('style','display:none;');
			    cell2.innerHTML = cnt;
			    cell3.innerHTML = '';			    
			    //cell4.innerHTML = '<input type="text" readonly id="date" name="date">'+myStartDate+' ~ '+myEndDate+'</input>';
			    cell4.innerHTML = '<input type="text" readonly id="date" name="date" value="'+myStartDate+'~'+myEndDate+'"></input>';
			    cell5.setAttribute('style','display:none;');
			    cell5.innerHTML = '<div class="input-group bootstrap-timepicker timepicker">'+
	           						'<input id="timepicker'+cnt+'" type="text" class="form-control input-small">'+
	         						'<span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span></div>';			        
			    //cell6.innerHTML = '<td><input type="text" readonly id="place" name="place">'+$("#tmpPlace").val()+'</input></td>';
			    cell6.innerHTML = '<td><input type="text" readonly id="place" name="place" value="'+$("#tmpPlace").val()+'"></input></td>';
			    
			    $('#timepicker'+cnt).timepicker('setTime', '12:00 AM');			    
			    
			    reCalculate();
			    showCalendar();
			});
			
			$('#my_tbody').on('click', '#del_btn', function(){
				if (confirm('일정을 삭제하시겠습니까?')) {
					$(this).closest('tr').remove();
					$('#calendar').fullCalendar('removeEvents', $(this).closest('tr').children('td:nth-child(5n+2)').text());
			 	   	reCalculate();
				}				
			});
		});
		
		function showCalendar() {
			$('#distancemap').hide();
			$('#map').show();
			$('#list').show();
			$("#menu").click();
		}
		
		/* function row_del(){
			var my_tbody = document.getElementById('my_tbody');
		    if (my_tbody.rows.length < 2) return;
		    my_tbody.deleteRow(0); // 상단부터 삭제
		    // my_tbody.deleteRow( my_tbody.rows.length-1 ); // 하단부터 삭제
		} */
		
		// 테이블 번호 순서대로 할당하는 함수
		function reCalculate() {
		    $('#my_tbody tr').each(function(i) {
		      $(this).find('td:nth-child(3)').text(i+1);
		    });
		}
	</script>

</head>
<body class="full-height">
	<div class="container-fluid full-height">
		<div class="row full-height">
			<div class="col-lg-6 full-height">
				<div id="mapwrap" style="width: 100%; height: 80%;">
					<div id="map" style="width: 70%; height: 100%; margin: 0 auto; text-align:center;">
						<div id="menu"></div>
					</div>
					<div id="distancemap" style="width: 70%; height: 100%; margin: 0 auto;"></div>						
						<script>
						    var mapContainerDistance = document.getElementById('distancemap'), // 지도를 표시할 div  
						    mapOptionDistance = {
						       	center : new daum.maps.LatLng(36.301614332354404,127.45483762383972), // 지도의 중심좌표
						        level : 12
						    // 지도의 확대 레벨
						    };
						 
						    var distancemap = new daum.maps.Map(mapContainerDistance, mapOptionDistance); // 지도를 생성합니다
						    var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다 
						    var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.
													   
						    var markers = [],
						    	lines = [],
						    	customOverlays = [];
						 	// 마커를 표시할 위치와 title 객체 배열입니다 
						    var placePosition = new Array();
						 	// 주소 정보를 가져올 객체 배열입니다 
					    	var searchplace = new Array();	
						    
						    var lineLine = new daum.maps.Polyline();
						    
						    // 일정 주소 검색하여 위치 마커표시
						    function searchPlaces(){						    				    	
						    	placePosition = [];
						    	searchplace = [];
						    	
						    	$("#my_tbody tr td:nth-child(6)").each(function(i){
						    	    searchplace.push($(this).text());
						    	});
						    	
						    	$('#map').hide();
								$('#list').hide();
								$('#distancemap').show();
								
						    	// 커스텀 오버레이를 숨깁니다
						    	removeCustomOverlay();
						    	
						    	addPlacePosition(searchplace);
						    	//console.log(placePosition);	
						    						    	
								//displayMarker(geocoder);
						    }	
						    
							// 주소 정보로  좌표값 검색. delay time: 200
						    function addPlacePosition (searchplace) {
						    	var i = 0;
						    	function sleeptimer() {
						    		var geocoder = new daum.maps.services.Geocoder();
						    		geocoder.addressSearch(searchplace[i], addressSearchCB);
						    	    i++;
						    	    if( i < searchplace.length ){
						    	        setTimeout( sleeptimer, 200 );
						    	    }
						    	}
						    	sleeptimer();
						    }
						    
						    function addressSearchCB (data, status, pagination) {
						        if (status === daum.maps.services.Status.OK) {
						                        
						            var obj = {								        
								   		title : data[0].address_name,
							       		latlng : new daum.maps.LatLng(data[0].y, data[0].x)
								    };				
						            placePosition.push(obj);
						            
						            //console.log(placePosition);
						            
						            if (searchplace.length == placePosition.length){
							            setTimeout(function() {
							            	
								            displayMarker(placePosition);								            
							            }, 200);
						            }
						            
						         	
								    /* var placePosition = [ {
								    	title : "수목원",
								        latlng : new daum.maps.LatLng(33.4696849, 126.493305)
								    }, {
								        title : "제주공항",
								        latlng : new daum.maps.LatLng(33.5066211, 126.492810)
								    }, {
								        title : "테마파크",
								        latlng : new daum.maps.LatLng(33.2906595, 126.322529)
								    }, {								        
								   		title : data[0].address_name,
							       		latlng : new daum.maps.LatLng(data[0].y, data[0].x)
								    } ];  	*/
						        } 
						    }
						 
						    function displayCircleDot(position, distance) {
						        if (distance > 0) {
						            // 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
						            distanceOverlayInfo(position,distance);						           
						            // 지도에 표시합니다
						            //distanceOverlay.setMap(distancemap);
						        }
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
						                map : distancemap,
						                position: position, // 마커의 위치
						                title: title,
						                image: markerImage 
						            });						        
							    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
							    
								// 마커의 이름을 표시할 커스텀 오버레이 생성
							    customOverlayInfo(marker,title);
						    }
						 	
						    function customOverlayInfo (marker,title) {
						    	var customOverlay = new daum.maps.CustomOverlay({
									xAnchor: 0.5, // 컨텐츠의 x 위치
									yAnchor: 0 // 컨텐츠의 y 위치
								});
						    	
						    	var content = '<div class ="distancelabel"><span class="left"></span><span class="center">'+title+'</span><span class="right"></span></div>';
												    
						    	customOverlay.setPosition(marker.getPosition()); // 커스텀 오버레이를 표시할 좌표
							    customOverlay.setContent(content);
							    customOverlay.setMap(distancemap); 
							    
							    customOverlays.push(customOverlay);
							}
						    
						    function distanceOverlayInfo (position,distance) {
						    	var distanceOverlay = new daum.maps.CustomOverlay({
					                //xAnchor : 1.2, // 컨텐츠의 x 위치
					                yAnchor : 2.4 , // 컨텐츠의 y 위치
					                zIndex : 2
					            });
						    	
						    	var content = '<div class="dotOverlay">거리 <span class="number">' + distance + '</span>m</div>';
												    
						    	distanceOverlay.setPosition(position); // 커스텀 오버레이를 표시할 좌표
						    	distanceOverlay.setContent(content);
						    	distanceOverlay.setMap(distancemap);

						    	customOverlays.push(distanceOverlay);
							}
						 	
						 	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
							function removeMarker() {
							    for ( var i = 0; i < markers.length; i++ ) {
							        markers[i].setMap(null);
							    }   
							    markers = [];
							}
						 	
							// 지도 위에 표시되고 있는 선을 모두 제거합니다
							function removeLine() {
							    for ( var i = 0; i < lines.length; i++ ) {
							    	lines[i].setMap(null);
							    }   
							    lines = [];
							}
							
							// 지도 위에 표시되고 있는 오버레이를 모두 제거합니다
							function removeCustomOverlay() {
							    for ( var i = 0; i < customOverlays.length; i++ ) {
							    	customOverlays[i].setMap(null);
							    }   
							    customOverlays = [];
							}
						 	
						 	// 지도에 마커를 표시하는 함수입니다
						    function displayMarker(placePosition) {
								
						    	bounds = new daum.maps.LatLngBounds();
						    	
						    	// 지도에 표시되고 있는 마커를 제거합니다
							    removeMarker();		
							 	// 지도에 표시되고 선을 제거합니다
							    removeLine();
							 	
								for (var i = 0; i < placePosition.length; i++) {							      	
							    	// 마커를 생성합니다 (addMarker)
							    	addMarker(placePosition[i].latlng, i, placePosition[i].title);
							    	// LatLngBounds 객체에 좌표를 추가합니다
							    	bounds.extend(placePosition[i].latlng);	    	
							    }
								
								var linePath;							    
							    var distance;
							    
							    for (var i = 0; i < placePosition.length; i++) {
							        if (i != 0) {
							            linePath = [ placePosition[i - 1].latlng, placePosition[i].latlng ] //라인을 그리려면 두 점이 있어야하니깐 두 점을 지정
							        };
							        
							        lineLine.setPath(linePath); // 선을 그릴 라인을 세팅합니다
							        
							        disPlayLine(linePath); // 지도에 선을 표시
							 
							        distance = Math.round(lineLine.getLength());
							        displayCircleDot(placePosition[i].latlng, distance);							     
							    }
							    
							    distancemap.setBounds(bounds);
						 	}
						 	
						 	// 지도에 선을 표시 하는 함수
						    function disPlayLine(linePath){
						    	var drawLine = new daum.maps.Polyline({
						    		strokeWeight : 3, // 선의 두께입니다 
						            strokeColor : '#db4040', // 선의 색깔입니다
						            strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
						            strokeStyle : 'solid' // 선의 스타일입니다
						    	});
						    	
						    	drawLine.setPath(linePath);		
						    	drawLine.setMap(distancemap);
						    	
						    	lines.push(drawLine);
						    }
						</script>				
					</div>
				<div id="list" style="text-align:center;">
					<input class="btn" type="button" code="0" value="전국" />
					<input class="btn" type="button" code="11" value="서울" />
					<input class="btn" type="button" code="26" value="부산" />
					<input class="btn" type="button" code="28" value="인천" />
					<input class="btn" type="button" code="41" value="경기" />
					<input class="btn" type="button" code="50" value="제주" />
				</div>
				<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					mapOption = {
						center : new daum.maps.LatLng(36.301614332354404,
								127.45483762383972), // 지도의 중심좌표
						level : 13
					// 지도의 확대 레벨
					};
					map = new daum.maps.Map(mapContainer, mapOption);

					var bPolygons = new bPolygon(map);
					bPolygons.init();

					$("#list input").click(function() {
						bPolygons.show($(this).attr('code'));
					});

					// 클릭 시, 정보 가져오기
					$("#mapwrap").click(function() {
						var info = bPolygons.getInfo();
						var text = '';
						if (info.code == 0) {
							text = info.pname;
						} else if (info.pcode == 0) {
							text = info.name;
						} else {
							text = info.pname + " " + info.name;
						}
						$("#tmpPlace").val(text);
					});

					// 지도 위 메뉴
					$("#menu").click(function() {
						bPolygons.show('0');
						$("#mapwrap").trigger('click');
					});

					$("#mapwrap").trigger('click');
				</script>
			</div>
			<div class="col-lg-6 full-height">
				<div id='calendar' class="calendarLayout"></div>				
				
				<div id='schedule'>
					<div class="table-responsive">
						<form action="detailMap.jsp" method="post">
							<input type="hidden" id="tmpPlace"/>
							<table class="table table-striped">							
								<col width="10">
								<col width="20">
								<col width="170">
								<!-- <col width="135"> -->
								<col width="300">				
								<thead>
									<tr>
										<th><!-- <input type="checkbox" name="all" value="#" onclick="allChk(this.checked)"> --></th>
										<th>NO.</th>
										<th>날짜</th>
										<!-- <th>시간</th> -->	
										<th>장소</th>
									</tr>
								</thead>
								<tbody id="my_tbody">								
									<tr>
										<td colspan="5" align="right">
											<input class="btn btn-primary btn-sm" type="hidden" value="삭제" onclick="row_del()">
											<input class="btn btn-primary btn-sm" type="hidden" id="addrow" value="일정추가">
											<input class="btn btn-primary btn-sm" type="button" id="showdistance" data-toggle="button" aria-pressed="false" autocomplete="off" value="경로보기">
											<input class="btn btn-primary btn-sm" type="submit" value="다음으로">										
										</td>
									</tr>								
								</tbody>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>