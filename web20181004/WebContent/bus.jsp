<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%> <!-- 선언부 밑에 위치해야한다. -->
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
<title>Insert title here</title>
<style>
	*{
		margin : 0px;
		padding : 0px;
	}
	#code {
		margin : 20px;
		width : 200px;
		height : 25px;
	}
	#bnt{
		width : 80px;
		height : 33px;
		border : none;
		background-color : black;
		color : white;
		font-size : 16px;
	}
	#map {
		margin : 0px 20px 20px 20px;
		width : 500px;
		height : 350px;
	}
	#text{
		margin-left : 20px;
	}
	#tspan{
		color : red;
	}
	.customoverlay {position:relative;bottom:85px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
	.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
	.customoverlay a {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;font-weight:bold;overflow:hidden;background: #000 url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
	.customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:bold;}
	.customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
</style>
</style>
</head>
<body>
<input type = "text" id = "code">
<input type = "button" id = "bnt" name = "bnt" value = "검색">
<div id="map" ></div>
<div id = "info"></div>

</body>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ba55cb9d686a55d06d979bad1dba4411"></script>

<script>
	$(document).ready(function() {
		$('#bnt').on('click', function(){
		
		var code = $('#code').val();
		var staName; // 지하철역 이름
		var line = []; // 라인
		var lati; // 위도
		var longi; // 경도
		var list = [];
		
		var imageSrc = 'images/train.png', // 마커이미지의 주소입니다    
	    imageSize = new daum.maps.Size(50, 50), // 마커이미지의 크기입니다
	    imageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
		
	    $.ajax({
	    	url : "http://openapi.seoul.go.kr:8088/77466652517165743938726f73634a/xml/SearchInfoBySubwayNameService/1/5/" + code,
	    	success : function(value){
	    		var names = []; //역이름, 역코드, 역라인을 모두담는 배열
	    		$(value).find('row').each(function(){ // 역이름과 관련된 row줄을 다 찾음
	    			var name = {title : $(this).find('STATION_NM').text(), //역이름
	    						frCode : $(this).find('FR_CODE').text(), //역 코드
	    						line : $(this).find('LINE_NUM').text() //역 라인
	    						};
	    			names.push(name); //배열에 데이터를 넣음
	    		});
	    			alert(names[1].frCode);
	    		if(code == names[0].title){
	    			var staCode = names[0].frCode;
	    			alert(staCode);
				$.ajax({
					url : "http://openapi.seoul.go.kr:8088/77466652517165743938726f73634a/xml/SearchLocationOfSTNByFRCodeService/1/5/" + staCode,
					success : function(data) {
						$(data).find('row').each(function(){
							lati = $(this).find('XPOINT_WGS').text();
							longi = $(this).find('YPOINT_WGS').text();
						});
							var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
							mapOption = {
								center : new daum.maps.LatLng(lati, longi), // 지도의 중심좌표
								level : 3 // 지도의 확대 레벨
								
							};
							var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
							// 마커가 표시될 위치입니다 
							var markerPosition = new daum.maps.LatLng(lati, longi);
					
							//마커 이미지 등록
							var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption)
					
							// 마커를 생성합니다
							var marker = new daum.maps.Marker({
							position : markerPosition,
							image: markerImage
							});

							// 마커가 지도 위에 표시되도록 설정합니다
							marker.setMap(map);
					
							var content = '<div class="customoverlay">' +
						    '  <a href="http://map.daum.net/link/map/" target="_blank">' +
						    '    <span class="title">' + staName + '</span>' +
				    		'  </a>' +
				    		'</div>';

						// 커스텀 오버레이가 표시될 위치입니다 
						var position = new daum.maps.LatLng(lati, longi);  

						// 커스텀 오버레이를 생성합니다
						var customOverlay = new daum.maps.CustomOverlay({
						    map: map,
				    		position: position,
				    		content: content,
				    		yAnchor: 1 
						});

							// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
							// marker.setMap(null);
					
						//});
						$('#info').html("<h2 id = 'text'> 지하철 호선 : <span id = 'tspan'>" + line + "호선</span> 지하철 역 : <span id = 'tspan'>" + staName + "역</span></h2>");
					}
				});
			    		} else{
	    					alert("올바른 역명을 입력하세요");
			    		}
	    				//});
	    			}
	    		});
	    
	


	});
	});
</script>
</html>