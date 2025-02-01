<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html
  lang="en"
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="/static/sneat/assets/"
  data-template="vertical-menu-template-free"
>
	<!-- https://carrotweb.tistory.com/244 -->
	<head>

		<sitemesh:write property='title' />

		<%@include file="/WEB-INF/decorators/usr/head.jsp"%>
		<sitemesh:write property='head'/>

	</head>
   
    <body>
		<!-- Layout wrapper -->
		<div class="layout-wrapper layout-content-navbar">
			<div class="layout-container">

				<div id="left">
					<%@include file="/WEB-INF/decorators/usr/left.jsp"%>
					<sitemesh:write property='left' />
				</div>

				<!-- Layout page -->
				<div class="layout-page">

					<div id="nav">
						<%@include file="/WEB-INF/decorators/usr/header.jsp"%>
						<sitemesh:write property='header' />
					</div>

					<!-- Content wrapper -->
					<div class="content-wrapper">

						<!-- Content -->
						<div class="container-xxl flex-grow-1 container-p-y">
							<sitemesh:write property='body' />
						</div>


						<%@include file="/WEB-INF/decorators/usr/footer.jsp"%>
						<sitemesh:write property='footer'/>


						<div class="content-backdrop fade"></div>

					</div>
					<!-- / Content wrapper -->
				</div>
				<!-- / Layout page -->



				<div class="layout-overlay layout-menu-toggle"></div>
			</div>
			<!-- / layout-container -->
		</div>
		<!-- / Layout wrapper -->


		<!-- Core JS -->
		<!-- build:js assets/vendor/js/core.js -->
		<script src="/static/sneat/assets/vendor/libs/jquery/jquery.js"></script>
		
		
		
		<script src="/static/sneat/assets/vendor/libs/popper/popper.js"></script>
		<script src="/static/sneat/assets/vendor/js/bootstrap.js"></script>
		<script src="/static/sneat/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

		<script src="/static/sneat/assets/vendor/js/menu.js"></script>
		<!-- endbuild -->

		<!-- Vendors JS -->
		<script src="/static/sneat/assets/vendor/libs/apex-charts/apexcharts.js"></script>

		<!-- Main JS -->
		<script src="/static/sneat/assets/js/main.js"></script>

		<!-- Page JS -->
		<script src="/static/sneat/assets/js/dashboards-analytics.js"></script>

		<!-- Place this tag in your head or just before your close body tag. -->
		<script async defer src="https://buttons.github.io/buttons.js"></script>
		
		
		<script type="text/javascript">
		$(function () {
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			
			
			console.log(token);
			console.log(header);
			//console.log('${_csrf.token}');
			
			if(token && header) {
				$(document).ajaxSend(function(event, xhr, options) {
					xhr.setRequestHeader(header, token);
				});
			}
		});
		</script>

	<script type="text/javascript">
		var host = location.host.toLowerCase();
		var currentAddress = location.href;
		
		if (host == "soulinku.com" && host.indexOf("www")== -1) {
			currentAddress = currentAddress.replace("//","//www.");
			location.href = currentAddress;
		}
	</script>








    </body>
</html>