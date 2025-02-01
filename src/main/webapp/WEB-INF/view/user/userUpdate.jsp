<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
    <h1>user update page</h1>
    <hr>

    <form action="/user/update/${USER.userId}" method="post" name="updateForm">
        <input type="password" name="password" placeholder="password"/>
        <input type="text" name="nickNm" placeholder="nickname" value="${USER.nickNm}"/>
        <input type="submit" value="Update"/>
    </form>


</body>