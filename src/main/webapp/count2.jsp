<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session Counter</title>
</head>
<body>
    <h1>Session ID : ${pageContext.session.id}</h1>
    <h1>Count : ${count}</h1>
</body>
</html>