<%--
  Created by IntelliJ IDEA.
  User: magdalena
  Date: 08.05.2020
  Time: 20:42
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
    <title> Companies </title>
    <link href="<c:url value="/css/main.css"/>" rel="stylesheet"/>
</head>
<body class="bg-light">
<%@include file="main-header.jsp" %>
<sec:authorize access="isAuthenticated()">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item ml-4"><a href="/user/home"><i class="fas fa-home"></i> Home</a></li>
            <li class="breadcrumb-item active" aria-current="page"> Companies</li>
        </ol>
    </nav>
    <div class="container">

        <!-- Page Heading -->
        <h1 class="my-4">Companies</h1>

        <div class="row">
            <c:forEach items="${companies}" var="company" varStatus="count">
                <div class="col-lg-4 col-sm-6 mb-4">
                    <div class="card h-100">
                        <c:choose>
                            <c:when test="${count.index % 3 == 0}">
                                <img class="card-img-top" src="/img/Optimized-sunyu-9aCD5kzPwa8-unsplash%20(1).jpg"
                                     alt="">
                            </c:when>
                            <c:when test="${count.index % 3 == 2}">
                                <img class="card-img-top" src="/img/Optimized-nick-wessaert-JI01fn0U7Cg-unsplash.jpg"
                                     alt="">
                            </c:when>
                            <c:when test="${count.index % 3 == 1}">
                                <img class="card-img-top" src="/img/Optimized-scott-webb--udZnjsCzsE-unsplash.jpg"
                                     alt="">
                            </c:when>
                        </c:choose>
                            <%--                        <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>--%>
                        <div class="card-body">
                            <h4 class="card-title">${company.name} </h4>
                            <p class="card-text">${company.location}</p>
                        </div>
                        <div class="card-footer">
                            <div class="btn-wrapper text-center">
                                <a href="/user/companies/${company.id}" class="btn btn-primary"> Details </a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>

        </div>
        <!-- /.row -->

        <!-- Pagination -->
            <%--        <ul class="pagination justify-content-center">--%>
            <%--            <li class="page-item">--%>
            <%--                <a class="page-link" href="#" aria-label="Previous">--%>
            <%--                    <span aria-hidden="true">&laquo;</span>--%>
            <%--                    <span class="sr-only">Previous</span>--%>
            <%--                </a>--%>
            <%--            </li>--%>
            <%--            <li class="page-item">--%>
            <%--                <a class="page-link" href="#">1</a>--%>
            <%--            </li>--%>
            <%--            <li class="page-item">--%>
            <%--                <a class="page-link" href="#">2</a>--%>
            <%--            </li>--%>
            <%--            <li class="page-item">--%>
            <%--                <a class="page-link" href="#">3</a>--%>
            <%--            </li>--%>
            <%--            <li class="page-item">--%>
            <%--                <a class="page-link" href="#" aria-label="Next">--%>
            <%--                    <span aria-hidden="true">&raquo;</span>--%>
            <%--                    <span class="sr-only">Next</span>--%>
            <%--                </a>--%>
            <%--            </li>--%>
            <%--        </ul>--%>

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
