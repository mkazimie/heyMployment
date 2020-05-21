<%--
  Created by IntelliJ IDEA.
  User: magdalena
  Date: 03.05.2020
  Time: 11:44
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
    <title>Home Page</title>
    <link href="<c:url value="/css/main.css"/>" rel="stylesheet"/>
</head>
<body class="bg-light">
<%@include file="main-header.jsp" %>
<sec:authorize access="isAuthenticated()">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item active ml-4" aria-current="page"><i class="fas fa-home"></i> Home </li>
        </ol>
    </nav>


<%--    <nav class="navbar bg-dark static-top">--%>
<%--        <div class="navbar-brand main-logo ml-4 text-white">--%>
<%--            <strong> User Panel </strong>--%>
<%--        </div>--%>
<%--    </nav>--%>



    <div class="container">

        <div class="card-deck mt-3">

                <%--   WELCOME --%>
            <div class="card border-secondary bg-dark text-white">
                <img class="card-img-top img-scale img-fluid" src="/img/hello-i-m-nik-MAgPyHRO0AA-unsplash.jpg"
                     alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title text-center"><strong>Welcome to your User Panel</strong></h5>
                    <p class="card-text text-justify"> From here you can easily access your saved job offers, keep
                        track of your to-do list, store your accomplished or ongoing courses and prepare for
                        your job interview.
                    </p>
                </div>
            </div>

                <%-- JOB OFFERS--%>
            <div class="card border-secondary">
                <img class="card-img-top img-scale img-fluid" src="/img/Optimized-jesus-kiteque-wn-KYaHwcis-unsplash.jpg"
                     alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title text-center"><strong>Job Applications</strong></h5>
                    <p class="card-text text-center"> Store and manage your job applications. </p>
                </div>
                <div class="card-footer">
                    <div class="btn-wrapper text-center">
                        <a href="/user/offers/" class="btn btn-primary"> Go </a>
                    </div>
                </div>
            </div>

                <%--TODOS--%>
            <div class="card border-secondary">
                <img class="card-img-top img-scale img-fluid" src="/img/kelly-sikkema--1_RZL8BGBM-unsplash.jpg"
                     alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title text-center"><strong>To-Do List </strong></h5>
                    <p class="card-text text-center"> Keep track of your most urgent tasks.
                    </p>
                </div>
                <div class="card-footer">
                    <div class="btn-wrapper text-center">
                        <a href="/user/todos/" class="btn btn-primary"> Go </a>
                    </div>
                </div>
            </div>


        </div>


        <div class="card-deck mt-3">

                <%-- COMPANIES--%>
            <div class="card border-secondary">
                <img class="card-img-top img-scale img-fluid" src="/img/Optimized-sean-pollock-PhYq704ffdA-unsplash.jpg"
                     alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title text-center"><strong>Companies</strong></h5>
                    <p class="card-text text-center"> Store information on your future employer. </p>
                </div>
                <div class="card-footer">
                    <div class="btn-wrapper text-center">
                        <a href="/user/companies/" class="btn btn-primary"> Go </a>
                    </div>
                </div>
            </div>

                <%-- COURSES --%>
            <div class="card border-secondary">
                <img class="card-img-top img-scale img-fluid" src="/img/Optimized-thisisengineering-raeng-GzDrm7SYQ0g-unsplash%20(1).jpg"
                     alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title text-center"><strong>Courses</strong></h5>
                    <p class="card-text text-center"> Document your learning pathway. </p>
                </div>
                <div class="card-footer">
                    <div class="btn-wrapper text-center">
                        <a href="/user/courses/" class="btn btn-primary"> Go </a>
                    </div>
                </div>
            </div>

                <%-- INTERVIEW PREP--%>
            <div class="card border-secondary">
                <img class="card-img-top img-scale img-fluid" src="/img/quino-al-4SNUcHPiC8c-unsplash.jpg"
                     alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title text-center"><strong>Interview Prep</strong></h5>
                    <p class="card-text text-center"> Access your job interview materials. </p>
                </div>
                <div class="card-footer">
                    <div class="btn-wrapper text-center">
                        <a href="/user/categories/" class="btn btn-primary"> Go </a>
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
