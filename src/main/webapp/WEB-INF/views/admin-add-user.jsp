<%--
  Created by IntelliJ IDEA.
  User: magdalena
  Date: 04.05.2020
  Time: 23:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<html>
<head>
    <title>Add New User</title>
    <link href="<c:url value="/css/main.css"/>" rel="stylesheet"/>
    <!-- Required meta tags -->
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
        <li class="breadcrumb-item ml-4"><a href="/admin/panel"><i class="fas fa-user-shield"></i> Admin Panel </a></li>
        <li class="breadcrumb-item active" aria-current="page"> Add User</li>
    </ol>
</nav>

<div class="container">
    <div class="card mx-auto mt-5">
        <div class="card-header thead-primary form-header text-center"> Add new user</div>
        <div class="card-body">
            <form:form method="post" modelAttribute="user">

            <h4 class="errorMessage">${failed}</h4>

            <div class="d-flex justify-content-center align-items-center container ">
                <div class="form-group col-md-8">
                    <form:label path="firstName" class="col-form-label"> First Name: </form:label>
                    <form:input path="firstName" class="form-control" placeholder="First Name"/>
                    <form:errors path="firstName" cssClass="errorMessage"/>
                </div>
            </div>
            <div class="d-flex justify-content-center align-items-center container ">
                <div class="form-group col-md-8">
                    <form:label path="lastName" class="col-form-label">Last Name:</form:label>
                    <form:input path="lastName" class="form-control" placeholder="Last Name"/>
                    <form:errors path="lastName" cssClass="errorMessage"/>
                </div>
            </div>
            <div class="d-flex justify-content-center align-items-center container ">
                <div class="form-group col-md-8">
                    <form:label path="username" class="col-form-label">Username:</form:label>
                    <form:input path="username" class="form-control" placeholder="Username"/>
                    <form:errors path="username" cssClass="errorMessage"/>
                </div>
            </div>
            <div class="d-flex justify-content-center align-items-center container ">
                <div class="form-group col-md-8">
                    <form:label path="email" class="col-form-label"> Email:</form:label>
                    <form:input path="email" class="form-control" placeholder="Email"/>
                    <form:errors path="email" cssClass="errorMessage"/>
                </div>
            </div>
            <div class="d-flex justify-content-center align-items-center container ">
                <div class="form-group col-md-8">
                    <form:label path="password" class="col-form-label"> Password: </form:label>
                    <form:password path="password" class="form-control" placeholder="Password"/>
                    <form:errors path="password" cssClass="errorMessage"/>
                </div>
            </div>
            <div class="d-flex justify-content-center align-items-center container ">
                <div class="form-group col-md-8">
                    <form:label path="roles" class="col-form-label"> Set Roles: </form:label>
                    <form:radiobuttons path="roles" items="${roles}" itemLabel="name" itemValue="id"
                                       cssClass="check-space"/>
                    <form:errors path="roles" cssClass="errorMessage"/>
                </div>
            </div>
            <form:hidden path="enabled" value="1"/>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </div>
        <div class="card-footer">
            <div class="btn-wrapper text-center">
                <input type="submit" class="btn btn-primary" value="Save">
                <a href="/admin/panel" class="btn btn-block btn-link" role="button"> Discard </a>
            </div>
        </div>
        </form:form>
    </div>
    </sec:authorize>
</div>


<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
        integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
</body>
</html>