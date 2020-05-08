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
<body class="bg-dark">
<%@include file="main-header.jsp" %>
<sec:authorize access="isAuthenticated()">
    <nav class="navbar bg-dark static-top">
        <div class="navbar-brand main-logo ml-4 text-white">
            <strong> User Panel </strong>
        </div>
    </nav>
        <div class="container">

            <div class="card-deck mt-5">

                <div class="card border-secondary">
                    <img class="card-img-top img-scale img-fluid" src="/img/undraw_calendar_dutt%20(1).png"
                         alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title"> Your TO DO List </h5>
                        <p class="card-text bg-light"> View Your Most Urgent Tasks </p>
                    </div>
                    <div class="card-footer">
                        <a href="/user/todos/all" class="btn btn-primary"> Let's do it! </a>
                    </div>
                </div>

                <div class="card border-secondary">
                    <img class="card-img-top img-scale img-fluid" src="/img/undraw_financial_data_es63.png"
                         alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title"> View and Update Companies Info </h5>
                        <p class="card-text bg-light"> Learn More About Your Future Employer </p>
                    </div>
                    <div class="card-footer">
                        <a href="#/user/companies/all" class="btn btn-primary"> Let's do it! </a>
                    </div>
                </div>

<%--                <div class="card border-secondary">--%>
<%--                    <img class="card-img-top img-scale img-fluid" src="/img/undraw_interview_rmcf.png"--%>
<%--                         alt="Card image cap">--%>
<%--                    <div class="card-body">--%>
<%--                        <h5 class="card-title"> View Your Interview Prep </h5>--%>
<%--                        <p class="card-text bg-light"> Prepare For Your Interview By Reviewing These Questions </p>--%>
<%--                    </div>--%>
<%--                    <div class="card-footer">--%>
<%--                        <a href="#/user/interviews/all" class="btn btn-primary"> Let's do it! </a>--%>
<%--                    </div>--%>
<%--                </div>--%>

            <div class="card-deck mt-5">
                <div class="card border-secondary">
                    <img class="card-img-top img-scale img-fluid" src="/img/undraw_placeholders_rklh.png"
                         alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title"> View Your Job Offers </h5>
                        <p class="card-text bg-light"> View and Update Your Saved Postings </p>
                    </div>
                    <div class="card-footer">
                        <a href="/user/offers/all" class="btn btn-primary"> Let's do it! </a>
                    </div>
                </div>
                <div class="card border-secondary">
                    <img class="card-img-top img-scale img-fluid" src="/img/undraw_youtube_tutorial_2gn3.png"
                         alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title"> View Your Courses </h5>
                        <p class="card-text bg-light"> View and Update Your Courses </p>
                    </div>
                    <div class="card-footer">
                        <a href="#/user/courses/all" class="btn btn-primary"> Let's do it! </a>
                    </div>
                </div>
                <div class="card border-secondary">
                    <img class="card-img-top img-scale img-fluid" src="/img/undraw_interview_rmcf.png"
                         alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title"> View Your Interview Prep </h5>
                        <p class="card-text bg-light"> Prepare For Your Interview By Reviewing These Questions </p>
                    </div>
                    <div class="card-footer">
                        <a href="#/user/interviews/all" class="btn btn-primary"> Let's do it! </a>
                    </div>
                </div>
            </div>
            <div class="card-deck mt-5">
                <div class="card border-secondary">
                    <img class="card-img-top img-scale img-fluid" src="/img/undraw_new_entries_nh3h.png"
                         alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title"> New Job Offer </h5>
                        <p class="card-text bg-light"> Add New Job Posting And Keep Track of it</p>
                    </div>
                    <div class="card-footer">
                        <a href="/user/offers/add" class="btn btn-primary"> Add </a>
                    </div>
                </div>
                <div class="card border-secondary">
                    <img class="card-img-top img-scale img-fluid" src="/img/undraw_react_y7wq.png"
                         alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title"> New Course </h5>
                        <p class="card-text bg-light"> Add a New Course You Completed or Wish To Complete </p>
                    </div>
                    <div class="card-footer">
                        <a href="#user/courses/add" class="btn btn-primary"> Add </a>
                    </div>
                </div>
                <div class="card border-secondary">
                    <img class="card-img-top img-scale img-fluid" src="/img/undraw_updates_et2k.png"
                         alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title"> New Interview Question </h5>
                        <p class="card-text bg-light"> Come Up With An Interview Question And Store Your Answer</p>
                    </div>
                    <div class="card-footer">
                        <a href="#/user/interviews/add" class="btn btn-primary"> Add </a>
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
