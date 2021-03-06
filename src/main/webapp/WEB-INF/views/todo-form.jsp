<%--
  Created by IntelliJ IDEA.
  User: magdalena
  Date: 08.05.2020
  Time: 14:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<html>
<head>
    <title>Todo Form</title>
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
<%@include file="main-header.jsp" %>
<sec:authorize access="isAuthenticated()">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item ml-4"><a href="/user/home"><i class="fas fa-home"></i> Home</a></li>
            <li class="breadcrumb-item"><a href="/user/todos/"> To Do List </a></li>
            <li class="breadcrumb-item active" aria-current="page"> To Do Form</li>
        </ol>
    </nav>

    <div class="container">
        <div class="card mx-auto mt-3">
            <div class="card-header bg-dark form-header text-white text-center"><strong> To Do Form </strong></div>
            <div class="card-body">
                <form:form method="post" modelAttribute="todo" action="/user/todos/add">

                <h5 class="errorMessage center-content">${failed}</h5>

                <div class="d-flex justify-content-center align-items-center container ">
                    <div class="form-group col-md-8">
                        <form:label path="name"
                                    class="col-form-label"> Name: </form:label>
                        <form:input path="name" class="form-control" placeholder="Name"/>
                        <form:errors path="name" cssClass="errorMessage"/>
                    </div>
                </div>
                <div class="d-flex justify-content-center align-items-center container ">
                    <div class="form-group col-md-8">
                        <form:label path="description"
                                    class="col-form-label"> Description: </form:label>
                        <form:textarea path="description" class="form-control" placeholder="Description"/>
                        <form:errors path="description" cssClass="errorMessage"/>
                    </div>
                </div>
                <div class="d-flex justify-content-center align-items-center container ">
                    <div class="form-group col-md-8">
                        <form:label path="jobOffer"
                                    class="col-form-label"> Related Job Offer: </form:label>
                        <form:select path="jobOffer" class="form-control">
                            <c:choose>
                                <c:when test="${not empty jobOffer}">
                                    <form:option value="${jobOffer.id}" label="${jobOffer.jobFullTitle}" selected="selected"/>
                                </c:when>
                                <c:otherwise>
                                    <form:option value="0" label="--Please Select" selected="selected"/>
                                    <form:options items="${jobOffers}" itemLabel="jobFullTitle" itemValue="id"/>
                                </c:otherwise>
                            </c:choose>
                            <form:errors path="jobOffer" cssClass="errorMessage"/>
                        </form:select>
                    </div>
                </div>
                <div class="d-flex justify-content-center align-items-center container ">
                    <div class="form-group col-md-8">
                        <form:label path="course"
                                    class="col-form-label"> Related Course: </form:label>
                        <form:select path="course" class="form-control">
                            <c:choose>
                                <c:when test="${not empty course}">
                                    <form:option value="${course.id}" label="${course.courseFullName}" selected="selected"/>
                                </c:when>
                                <c:otherwise>
                                    <form:option value="0" label="--Please Select" selected="selected"/>
                                    <form:options items="${courses}" itemLabel="courseFullName" itemValue="id"/>
                                </c:otherwise>
                            </c:choose>
                            <form:errors path="course" cssClass="errorMessage"/>
                        </form:select>
                    </div>
                </div>
                <div class="d-flex justify-content-center align-items-center container ">
                    <div class="form-group col-md-8">
                        <form:label path="deadline"
                                    class="col-form-label"> Deadline: </form:label>
                        <form:input path="deadline" type="datetime-local" class="form-control"/>
                        <form:errors path="deadline" cssClass="errorMessage"/>
                    </div>
                </div>
                <div class="d-flex justify-content-center align-items-center container ">
                    <div class="col-md-8 text-center mt-3">
                        <input type="submit" class="btn btn-primary btn-block" value="Save">
                        <a href="/user/todos/" class="btn btn-block btn-link" role="button"> Discard </a>
                        <form:hidden path="id"/>
                        <form:hidden path="user.id"/>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</sec:authorize>


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