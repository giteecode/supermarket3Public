<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>超市进销存管理系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Le styles -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/assets2/js/jquery.min.js"></script>

<!--  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets2/css/style.css"> -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets2/css/loader-style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets2/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets2/css/signin.css">

<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
<!-- Fav and touch icons -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/assets2/ico/minus.png">
</head>

<body style="background: url('bg2.jpg') ; background-size:100% 100% ; background-attachment: fixed">
	<!-- Preloader -->
	<div id="preloader">
		<div id="status">&nbsp;</div>
	</div>

	<div class="container">

		<div class="" id="login-wrapper">
			<div class="row">
				<div class="col-md-4 col-md-offset-4">
					<div id="logo-login">
						<h1>超市进销存管理系统</h1>
					</div>
				</div>

			</div>

			<div class="row">
				<div class="col-md-4 col-md-offset-4">
					<div class="account-box">
						<form id="loginForm" action="" method="post">
							<div class="form-group">
								<label>用户名</label> <input type="text" id="username" name="username"
									class="form-control" required>
							</div>
							<div class="form-group">
								<label>密码</label> <input type="password" name="password"
									class="form-control" required>
							</div>
							<button class="btn btn btn-primary pull-right" type="submit"
								onclick="login()">登 录</button>
							<div class="form-group">	
																						<a href="modules/yonghu/register.jsp">用户注册</a>
																																																																																																																																																																																																																										</div>	
						</form>
						<div class="row-block">
							<div class="row"></div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<p>&nbsp;</p>


	</div>

	<!--  END OF PAPER WRAP -->

	<!-- MAIN EFFECT -->
	<!--<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets2/js/preloader.js"></script>-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets2/js/bootstrap.js"></script>
	<!--<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets2/js/app.js"></script>-->
	<!--<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets2/js/load.js"></script>-->
	<!--<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets2/js/main.js"></script>-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script>

	<!--<script src="http://maps.googleapis.com/maps/api/js?sensor=false" type="text/javascript"></script> -->
	<!--<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets2/js/map/gmap3.js"></script> -->
	<script type="text/javascript">
		
	<%@ include file="utils/menu.jsp"%>
		
	<%@ include file="utils/baseUrl.jsp"%>
		var role = "";
		var accountTableName = "";
		//渲染角色选择
		function setRoleOption() {
			for (var i = 0; i < menus.length; i++) {
				//console.log(menu[i].roleName)
				var div = document.createElement('div');
				div.setAttribute('class', 'checkbox');
				var label = document.createElement('label');
				//label.innerHTML = menus[i].roleName;
				var checkbox = document.createElement('input');
				checkbox.setAttribute('type', 'radio');
				checkbox.setAttribute('name', 'chk');
				checkbox.setAttribute('value', menus[i].roleName);
				var attr = "checkRole(" + "\'" + menus[i].roleName + "\',\'"
						+ menus[i].tableName + "\')";
				checkbox.setAttribute('onclick', attr);
				//label.setAttribute('class','checkbox inline');
				label.innerHTML = menus[i].roleName;
				label.appendChild(checkbox);

				div.appendChild(label);
				$('form button').before(div);
			}
		}
		function checkRole(roleName, tableName) {			
			role = roleName;
			$('#loginForm').attr('action', baseUrl + tableName + '/login');
			accountTableName = tableName;
		}
		function login() {
			$("#loginForm")
					.ajaxForm(
							function(res) {
								if (role == "" || role == null) {
									alert("请选择角色后再登录");
								} else {
									if (res.code == 0) {
										alert("登录成功");
										var username = $('#username').val();
										window.sessionStorage.setItem('accountTableName',accountTableName)
						 				window.sessionStorage.setItem('username',username);
										window.sessionStorage.setItem('token',
												res.token);
										window.sessionStorage.setItem('role',
												role);
										window.location.href = "${pageContext.request.contextPath}/index.jsp";
									} else {
										alert(res.msg);
									}
								}

							});
		}
		function ready() {
			setRoleOption();
			//$('form').attr('action',baseUrl + 'users/login');
		}
		document.addEventListener("DOMContentLoaded", ready);
	</script>

</body>

</html>
