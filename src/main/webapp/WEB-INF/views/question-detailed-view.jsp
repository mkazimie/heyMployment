<%--
  Created by IntelliJ IDEA.
  User: magdalena
  Date: 17.05.2020
  Time: 14:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <!-- Bootstrap Fonts -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
          integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <title>Question Details</title>
    <link href="<c:url value="/css/main.css"/>" rel="stylesheet"/>
</head>
<body class="bg-light">
<%@include file="main-header.jsp" %>
<sec:authorize access="isAuthenticated()">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item ml-4"><a href="/user/home"><i class="fas fa-home"></i> Home</a></li>
            <li class="breadcrumb-item"><a href="/user/categories/">Categories</a></li>
            <li class="breadcrumb-item">
                <a href="/user/categories/${question.interviewCategory.id}/questions">${question.interviewCategory.name}</a></li>
            <li class="breadcrumb-item active" aria-current="page"> Q${question.id} Details</li>
        </ol>
    </nav>

    <div class="container">
        <div class="card-deck mr-30 ml-30 mt-5 mb-5">
            <div class="card border-secondary">
                <h3 class="card-header bg-secondary text-center text-white text-uppercase">Q${question.id}</h3>
                <div class="card-body">


                    <div class="ml-5 mr-5">
                        <div class="row justify-content-center">
                            <div class="row-auto">

                                <table class="table table-responsive table-borderless">
                                    <tbody class="table-content text-justify">
                                    <tr>
                                        <th scope="row"> Question:</th>
                                        <td class="textarea-style"><strong>${question.question}</strong></td>
                                    </tr>
                                    <tr>
                                        <th scope="row"> Answer:</th>
                                        <c:choose>
                                            <c:when test="${not empty question.answer}">
                                                <td class="textarea-style">${question.answer}</td>
                                            </c:when>
                                            <c:otherwise>
                                                <td><a
                                                        href="/user/categories/${question.interviewCategory.id}/questions/update/${question.id}">
                                                    Add Answer </a></td>
                                            </c:otherwise>
                                        </c:choose>
                                    </tr>
                                    <tr>
                                        <th scope="row"> Ready?</th>
                                        <c:choose>
                                            <c:when test="${question.ready == true}">
                                                <td class="align-middle">Yes</td>
                                            </c:when>
                                            <c:otherwise>
                                                <td class="align-middle">Not Yet</td>
                                            </c:otherwise>
                                        </c:choose>
                                    </tr>
                                    <tr>
                                        <th scope="row"> Difficulty Level:</th>
                                        <td>${question.difficulty}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row"> Added On:</th>
                                        <td>${question.formatAddedDate}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row"> Updated On:</th>
                                        <td>${question.formatUpdatedDate}</td>
                                    </tr>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>

                </div>
                <div class="card-footer">
                    <div class="btn-wrapper text-center">
                        <a href="/user/questions/update/${question.id}"
                           class="btn btn-primary"> Edit </a>
                        <a href="/user/questions/confirm-delete/${question.id}"
                           class="btn btn-dark"> Delete </a>
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