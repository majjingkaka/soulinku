<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
    <h1>join page</h1>
    <hr>
    
    <form action="/user/join" method="post" name="joinForm">
        <input type="text" name="userId" placeholder="userId"/>
        <input type="password" name="password" placeholder="password"/>
        <input type="text" name="nickNm" placeholder="nickNm"/>
        <input type="submit" value="Join"/>
    </form>


</body>