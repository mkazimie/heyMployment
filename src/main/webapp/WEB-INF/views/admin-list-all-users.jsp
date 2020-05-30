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
<body class="bg-dark">
<%@include file="main-header.jsp" %>
<sec:authorize access="hasRole('ADMIN')">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item ml-4"><a href="/user/home"><i class="fas fa-home"></i> Home</a></li>
            <li class="breadcrumb-item ml-4"><a href="/admin/panel"><i class="fas fa-user-shield"></i> Admin Panel </a>
            </li>
            <li class="breadcrumb-item active" aria-current="page"> All Users</li>
        </ol>
    </nav>

    <div class="container mt-5 mx-auto ml-4 mr-4">
        <div class="row">
            <div class="col-sm-10 col-12">
                <h1 class="bd-title text-white"> All Users <a
                        href="/admin/users/add" class="btn btn-primary"> + </a></h1>
            </div>
        </div>

        <table class="table table-striped table-light css-serial">
            <thead class="thead-primary">
            <tr class="text-center">
                <th>#</th>
                <th scope="col"> Username</th>
                <th scope="col"> ID</th>
                <th scope="col"> First Name</th>
                <th scope="col"> Last Name</th>
                <th scope="col"> Email</th>
                <th scope="col"> Roles</th>
                <th scope="col"> Enabled</th>
                <th scope="col"> Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${users}" var="user">
            <tr class="text-center">
                <td></td>
                <th scope="row">${user.username}</th>
                <td>${user.id}</td>
                <td>${user.firstName}</td>
                <td>${user.lastName}</td>
                <td>${user.email}</td>
                <td>
                    <c:forEach items="${user.roles}" var="role">
                        <i class="fa fa-check" aria-hidden="true"></i>${role.name}
                    </c:forEach>
                </td>
                <td>${user.enabled}</td>
                <c:choose>
                    <c:when test="${user.enabled == 1}">
                        <td><a href="/admin/users/block/${user.id}"> Block </a></td>
                    </c:when>
                    <c:otherwise>
                        <td><a href="/admin/users/unblock/${user.id}"> Unblock </a>
                        </td>
                    </c:otherwise>
                </c:choose>
            </tr>
            </tbody>
            </c:forEach>
        </table>
    </div>
</sec:authorize>
</body>
</html>
