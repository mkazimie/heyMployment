<%--
  Created by IntelliJ IDEA.
  User: magdalena
  Date: 04.05.2020
  Time: 15:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<html>
<head>
    <title>Update Profile</title>
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
<body class="bg-light">
<%@include file="main-header.jsp" %>
<sec:authorize access="isAuthenticated()">
<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item ml-4"><a href="/user/home"><i class="fas fa-home"></i> Home</a></li>
        <li class="breadcrumb-item active" aria-current="page"> Profile </li>
    </ol>
</nav>

<div class="container">
    <div class="card mx-auto mt-3">
        <div class="card-header bg-dark form-header text-center text-white"> Edit your profile info</div>
        <div class="card-body">
            <form:form method="post" modelAttribute="currentUser">

            <div class="form-group row">
                <form:label path="firstName"
                            class="col-md-4 col-form-label text-md-right"> First Name: </form:label>
                <div class="col-md-6">
                    <form:input path="firstName" class="form-control"/>
                    <form:errors path="firstName" cssClass="errorMessage"/>
                </div>
            </div>
            <div class="form-group row">
                <form:label path="lastName"
                            class="col-md-4 col-form-label text-md-right">Last Name:</form:label>
                <div class="col-md-6">
                    <form:input path="lastName" class="form-control"/>
                    <form:errors path="lastName" cssClass="errorMessage"/>
                </div>
            </div>
            <div class="form-group row">
                <form:label path="username"
                            class="col-md-4 col-form-label text-md-right">Username:</form:label>
                <div class="col-md-6">
                    <form:input path="username" class="form-control" readonly="true"/>
                    <form:errors path="username" cssClass="errorMessage"/>
                </div>
            </div>
            <div class="form-group row">
                <form:label path="email" class="col-md-4 col-form-label text-md-right"> Email:</form:label>
                <div class="col-md-6">
                    <form:input path="email" class="form-control" readonly="true"/>
                    <form:errors path="email" cssClass="errorMessage"/>
                </div>
            </div>
            <div class="form-group row">
                <form:label path="password"
                            class="col-md-4 col-form-label text-md-right"> Password: </form:label>
                <div class="col-md-6">
                    <form:password path="password" class="form-control"/>
                    <form:errors path="password" cssClass="errorMessage"/>
                </div>
            </div>
            <div class="col-md-6 offset-md-4">
                <form:hidden path="id"/>
                <form:hidden path="enabled"/>
                <form:hidden path="roles"/>
                <input type="submit" class="btn btn-primary btn-block" value="Save Changes">
                <a href="/user/home" class="btn btn-block btn-link" role="button"> Discard </a>
            </div>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </div>
    </div>
    </form:form>
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