<%--
  Created by IntelliJ IDEA.
  User: magdalena
  Date: 03.05.2020
  Time: 20:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <title>User List</title>
    <link href="<c:url value="/css/main.css"/>" rel="stylesheet"/>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <!-- Bootstrap Fonts -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
          integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

</head>
<body>
<sec:authorize access="hasRole('ADMIN')">
    <%@include file="main-header.jsp" %>
    <table class="table">
        <thead class="thead-dark">
        <tr>
            <th scope="col"> ID</th>
            <th scope="col"> First Name</th>
            <th scope="col"> Last Name</th>
            <th scope="col"> Username</th>
            <th scope="col"> User Email</th>
            <th scope="col"> User Roles</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${users}" var="user">
            <tr>
                <th scope="row">${user.id}</th>
                <td>${user.firstName}</td>
                <td>${user.lastName}</td>
                <td>${user.username}</td>
                <td>${user.email}</td>
                <c:forEach items="${user.roles}" var="role">
                    <td>${role.name}</td>
                </c:forEach>
            </tr>
        </tbody>
        </c:forEach>
    </table>
</sec:authorize>
</body>
</html>
