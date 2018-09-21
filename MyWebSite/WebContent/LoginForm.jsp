<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page session="true"%>



<!DOCTYPE html>
<html>
<style>
<
h2
>
Login







Form







</
h2
>
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.gm-style .gm-style-mtc label, .gm-style .gm-style-mtc div {
	font-weight: 400
}
</style>
<link type="text/css" rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700">
<style type="text/css">
.gm-style .gm-style-cc span, .gm-style .gm-style-cc a, .gm-style .gm-style-mtc div
	{
	font-size: 10px
}
</style>
<style type="text/css">
@media print {
	.gm-style .gmnoprint, .gmnoprint {
		display: none
	}
}

@media screen {
	.gm-style .gmnoscreen, .gmnoscreen {
		display: none
	}
}
</style>
<style type="text/css">
.gm-style-pbc {
	transition: opacity ease-in-out;
	background-color: rgba(0, 0, 0, 0.45);
	text-align: center
}

.gm-style-pbt {
	font-size: 22px;
	color: white;
	font-family: Roboto, Arial, sans-serif;
	position: relative;
	margin: 0;
	top: 50%;
	-webkit-transform: translateY(-50%);
	-ms-transform: translateY(-50%);
	transform: translateY(-50%)
}
</style>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script type="text/javascript" charset="UTF-8"
	src="https://maps.googleapis.com/maps-api-v3/api/js/33/10/intl/ko_ALL/common.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="https://maps.googleapis.com/maps-api-v3/api/js/33/10/intl/ko_ALL/util.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="https://maps.googleapis.com/maps-api-v3/api/js/33/10/intl/ko_ALL/map.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="https://maps.googleapis.com/maps-api-v3/api/js/33/10/intl/ko_ALL/marker.js"></script>
<style type="text/css">
.gm-style {
	font: 400 11px Roboto, Arial, sans-serif;
	text-decoration: none;
}

.gm-style img {
	max-width: none;
}
</style>
<script type="text/javascript" charset="UTF-8"
	src="https://maps.googleapis.com/maps-api-v3/api/js/33/10/intl/ko_ALL/onion.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="https://maps.googleapis.com/maps/api/js/ViewportInfoService.GetViewportInfo?1m6&amp;1m2&amp;1d41.69909639428386&amp;2d-88.44809715190308&amp;2m2&amp;1d42.05569556344877&amp;2d-86.80313969414237&amp;2u12&amp;4sko-KR&amp;5e0&amp;6sm%40430000000&amp;7b0&amp;8e0&amp;callback=_xdc_._jo12lq&amp;key=AIzaSyBu-916DdpKAjTmJNIgngS6HL_kDIKU0aU&amp;token=50798"></script>
<script type="text/javascript" charset="UTF-8"
	src="https://maps.googleapis.com/maps/vt?pb=!1m4!1m3!1i12!2i1047!3i1521!1m4!1m3!1i12!2i1047!3i1522!1m4!1m3!1i12!2i1047!3i1523!1m4!1m3!1i12!2i1048!3i1521!1m4!1m3!1i12!2i1049!3i1521!1m4!1m3!1i12!2i1048!3i1522!1m4!1m3!1i12!2i1048!3i1523!1m4!1m3!1i12!2i1049!3i1522!1m4!1m3!1i12!2i1049!3i1523!1m4!1m3!1i12!2i1050!3i1521!1m4!1m3!1i12!2i1051!3i1521!1m4!1m3!1i12!2i1050!3i1522!1m4!1m3!1i12!2i1050!3i1523!1m4!1m3!1i12!2i1051!3i1522!1m4!1m3!1i12!2i1051!3i1523!1m4!1m3!1i12!2i1052!3i1521!1m4!1m3!1i12!2i1053!3i1521!1m4!1m3!1i12!2i1052!3i1522!1m4!1m3!1i12!2i1052!3i1523!1m4!1m3!1i12!2i1053!3i1522!1m4!1m3!1i12!2i1053!3i1523!1m4!1m3!1i12!2i1054!3i1521!1m4!1m3!1i12!2i1054!3i1522!1m4!1m3!1i12!2i1054!3i1523!2m3!1e0!2sm!3i430134552!3m9!2sko-KR!3sUS!5e18!12m1!1e68!12m3!1e37!2m1!1ssmartmaps!4e3!12m1!5b1!23i1301875&amp;callback=_xdc_._928pt5&amp;key=AIzaSyBu-916DdpKAjTmJNIgngS6HL_kDIKU0aU&amp;token=9736"></script>
<script type="text/javascript" charset="UTF-8"
	src="https://maps.googleapis.com/maps-api-v3/api/js/33/10/intl/ko_ALL/controls.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="https://maps.googleapis.com/maps/api/js/AuthenticationService.Authenticate?1shttps%3A%2F%2Fwww.w3schools.com%2Fw3css%2Ftryw3css_templates_architect.htm&amp;4sAIzaSyBu-916DdpKAjTmJNIgngS6HL_kDIKU0aU&amp;callback=_xdc_._iwjqm7&amp;key=AIzaSyBu-916DdpKAjTmJNIgngS6HL_kDIKU0aU&amp;token=124957"></script>
<script type="text/javascript" charset="UTF-8"
	src="https://maps.googleapis.com/maps/api/js/QuotaService.RecordEvent?1shttps%3A%2F%2Fwww.w3schools.com%2Fw3css%2Ftryw3css_templates_architect.htm&amp;3sAIzaSyBu-916DdpKAjTmJNIgngS6HL_kDIKU0aU&amp;7si2m9yd&amp;10e1&amp;callback=_xdc_._6ic9gv&amp;key=AIzaSyBu-916DdpKAjTmJNIgngS6HL_kDIKU0aU&amp;token=19760"></script>
<script type="text/javascript" charset="UTF-8"
	src="https://maps.googleapis.com/maps-api-v3/api/js/33/10/intl/ko_ALL/stats.js"></script>


</head>

<body>
	<%
		String ID = (String)session.getAttribute("MEMBERID");
		session.getLastAccessedTime();
		session.setMaxInactiveInterval(10 * 60);

		String ma = "/Hello.jsp"; // %=ma%
		String lo = "/LoginForm.jsp";// %=lo%
		String bo = "/Board.jsp"; // %=bo%
		String oo = "/sessionLogout.jsp"; // %=oo%

		String coki = "";
		String ck = "";

		Cookie[] cookies = request.getCookies();
		if (cookies != null && cookies.length > 0) {
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals("savedID")) {
					coki = URLDecoder.decode(cookies[i].getValue(), "utf-8");
					ck = "checked";
				}
			}
		}
	%>
	<form action="/LoginAction" method=post>
		<div class="w3-top">
			<div class="w3-bar w3-white w3-wide w3-padding w3-card">
				<a href=<%=ma%> class="w3-bar-item w3-button"><b>JK</b> lmnop</a>
				<!-- Float links to the right. Hide them on small screens -->
				<div class="w3-right w3-hide-small">
					<a href=<%=bo%> class="w3-bar-item w3-button" name="zxc"
						value="/Board.jsp">Board</a> <a href="#about"
						class="w3-bar-item w3-button">About</a>

					<%
						if (ID != null) {
					%><a href=<%=oo%> class="w3-bar-item w3-button" target="_self">Logout-<%=ID%></a>
					<%
						} else {
					%>
					<a href=<%=lo%> class="w3-bar-item w3-button" target="_self">Login-<%=ID%></a>
					<%
						}
					%>
				</div>
			</div>
		</div>
	</form>
	<br>
	<br>
	<br>
	<div class="w3-container w3-content w3-padding-64"
		style="max-width: 800px" id="contact">
		<h2 class="w3-wide w3-center">LOGIN</h2>
		<%
			String msg = (String) request.getAttribute("msg");
			if (msg != null) {
		%>
		<label><b><%=msg%></b></label>
		<%
			}
		%>
		<div class="w3-row w3-padding-32">
			<div class="w3-col m6 w3-large w3-margin-bottom">
				<i class="fa fa-map-marker" style="width: 30px"></i> SEOUL, KR<br>
				<i class="fa fa-phone" style="width: 30px"></i> Phone: +00 151515<br>
				<i class="fa fa-envelope" style="width: 30px"> </i> Email:
				mail@mail.com<br>
			</div>
			<div class="w3-col m6">
				<form action="/LoginAction" method=post>

					<div class="w3-row-padding" style="margin: 0 -16px 8px -16px">
						<div class="w3-half">

							<input class="w3-input w3-border" type="text" placeholder="ID"
								required="" name="id" value="<%=coki%>">

						</div>
						<div class="w3-half">
							<input class="w3-input w3-border" type="password"
								placeholder="PASSWORD" required="" name="pwd">

						</div>
						<br> <br> <input type="checkbox" <%=ck%> name="chb">
						ID저장


					</div>
					<button class="w3-button w3-black w3-section w3-right"
						type="submit">Login</button>
				</form>
			</div>
		</div>
	</div>

</body>
</html>