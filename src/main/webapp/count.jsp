<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Session Counter</title>
</head>
<body>
    <h1>Session ID : <c:out value="${pageContext.session.id}" /></h1>
    <h1>Count : <c:out value="${count}" /></h1>
</body>
</html>