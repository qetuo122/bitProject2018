<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
<input type = "button" id = "bnt" name = "bnt" value = "�˻�">
<div id="map" ></div>
<div id = "info"></div>

</body>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ba55cb9d686a55d06d979bad1dba4411"></script>

<script>
	$(document).ready(function() {
		$('#bnt').on('click', function(){
		
		var code = $('#code').val();
		var staName; // ����ö�� �̸�
		var line; // ����
		var lati; // ����
		var longi; // �浵
		
		var imageSrc = 'images/train.png', // ��Ŀ�̹����� �ּ��Դϴ�    
	    imageSize = new daum.maps.Size(50, 50), // ��Ŀ�̹����� ũ���Դϴ�
	    imageOption = {offset: new daum.maps.Point(27, 69)}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.
		
	    $.ajax({
	    	url : "http://openapi.seoul.go.kr:8088/77466652517165743938726f73634a/xml/SearchInfoBySubwayNameService/1/5/" + code,
	    	success : function(value){
	    		alert($(value).find('STATION_NM').text());
	    		if(code == $(value).find('STATION_NM').text()){
	    			var staCode = $(value).find('FR_CODE').text();
	    			alert(staCode);
		$.ajax({
			url : "http://openapi.seoul.go.kr:8088/77466652517165743938726f73634a/xml/SearchLocationOfSTNByFRCodeService/1/5/" + staCode,
			success : function(data) {
				$(data).find('row').each(function(){
					staName = $(this).find('STATION_NM').text();
					line = $(this).find('LINE_NUM').text();
					lati = $(this).find('XPOINT_WGS').text();
					longi = $(this).find('YPOINT_WGS').text();
					var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
					mapOption = {
						center : new daum.maps.LatLng(lati, longi), // ������ �߽���ǥ
						level : 3 // ������ Ȯ�� ����
								
					};
					var map = new daum.maps.Map(mapContainer, mapOption); // ������ �����մϴ�
					// ��Ŀ�� ǥ�õ� ��ġ�Դϴ� 
					var markerPosition = new daum.maps.LatLng(lati, longi);
					
					//��Ŀ �̹��� ���
					var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption)
					
					// ��Ŀ�� �����մϴ�
					var marker = new daum.maps.Marker({
					position : markerPosition,
					image: markerImage
					});

					// ��Ŀ�� ���� ���� ǥ�õǵ��� �����մϴ�
					marker.setMap(map);
					
					var content = '<div class="customoverlay">' +
				    '  <a href="http://map.daum.net/link/map/" target="_blank">' +
				    '    <span class="title">' + staName + '</span>' +
				    '  </a>' +
				    '</div>';

				// Ŀ���� �������̰� ǥ�õ� ��ġ�Դϴ� 
				var position = new daum.maps.LatLng(lati, longi);  

				// Ŀ���� �������̸� �����մϴ�
				var customOverlay = new daum.maps.CustomOverlay({
				    map: map,
				    position: position,
				    content: content,
				    yAnchor: 1 
				});

					// �Ʒ� �ڵ�� ���� ���� ��Ŀ�� �����ϴ� �ڵ��Դϴ�
					// marker.setMap(null);
					
				});
				$('#info').html("<h2 id = 'text'> ����ö ȣ�� : <span id = 'tspan'>" + line + "ȣ��</span> ����ö �� : <span id = 'tspan'>" + staName + "��</span></h2>");
			}
		});
	    		} else{
	    			alert("�ùٸ� ������ �Է��ϼ���");
	    		}
	    	}
	    });
	    
	


	});
	});
</script>
</html>