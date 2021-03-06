<%--
  Created by IntelliJ IDEA.
  User: magdalena
  Date: 22.04.2020
  Time: 13:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Register Form</title>
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
<body class="bg-light">
<%@include file="header-landing.jsp" %>
<div class="container">
    <div class="card mx-auto mt-3">
        <div class="card-header bg-dark form-header text-white text-center"> Registration Form</div>
        <div class="card-body">
            <form:form method="post" modelAttribute="user">

                <h5 class="errorMessage center-content">${failed}</h5>

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
                        <form:label path="matchingPassword" class="col-form-label"> Confirm Password: </form:label>
                        <form:password path="matchingPassword" class="form-control" placeholder="Confirm Password"/>
                        <form:errors path="matchingPassword" cssClass="errorMessage"/>
                    </div>
                </div>
                <div class="d-flex justify-content-center align-items-center container ">
                    <div class="col-md-8 text-center mt-3">
                        <input type="submit" class="btn btn-primary btn-lg" value="Register">
                    </div>
                </div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <div class="justify-content-center">
                    <div class="text-center spacer"> Already registered?</div>
                    <a href="/login" class="btn btn-block btn-link" role="button"><strong> Sign In </strong></a>
                </div>
            </form:form>
        </div>
    </div>
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
