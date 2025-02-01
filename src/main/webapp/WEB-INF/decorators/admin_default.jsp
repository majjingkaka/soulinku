<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
   
   // include로 공통처리(head)
   <%@ include file="/WEB-INF/includes/admin/head.jsp" %>
   <body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<!-- header content -->
            // include로 공통처리(header)
			<%@ include file="/WEB-INF/includes/admin/header.jsp" %>
			<!-- /header content -->
			
			<!-- page content -->
            // 요청된 url에 따른 해당 페이지가 <sitemesh:wirte property='body'/>라는
            // 태그에서 동적으로 삽입
			<sitemesh:write property='body' />
			<!-- /page content -->

			<!-- footer content -->
            // include로 공통처리(footer)
			<%@ include file="/WEB-INF/includes/admin/footer.jsp" %>
			<!-- /footer content -->
		</div>
      </div>   
   </body>
</html>