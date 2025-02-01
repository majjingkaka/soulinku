<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">
	<!-- https://carrotweb.tistory.com/244 -->
	<head>
		<title><sitemesh:write property='title' /></title>
		<sitemesh:write property='head'/>
	</head>
   
   <body class="nav-md">
	<sitemesh:write property='body' />


	  
	  <footer>
		
		<sitemesh:write property='footer'/>
		<%@include file="/WEB-INF/decorators/usr/footer.jsp"%>
		
	  </footer>
   </body>
</html>