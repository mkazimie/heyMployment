<%--
  Created by IntelliJ IDEA.
  User: magdalena
  Date: 16.05.2020
  Time: 12:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<html>
<head>
    <title> Question Form</title>
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
            <li class="breadcrumb-item"><a href="/user/categories/"> Categories</a></li>
            <li class="breadcrumb-item">
                <a href="/user/categories/${cat.id}/questions">${cat.name}
                    Questions</a></li>
            <li class="breadcrumb-item">
                <a href="/user/questions/${questionId}"> Details </a></li>
            <li class="breadcrumb-item active" aria-current="page"> Edit</li>
        </ol>
    </nav>

    <div class="container">
        <div class="card mx-auto mt-3">
            <div class="card-header bg-dark form-header text-white text-center"> Edit Interview QA </div>
            <div class="card-body">
                <form:form method="post" modelAttribute="qa" action="/user/questions/update">

                    <h5 class="errorMessage center-content">${failed}</h5>

                    <div class="d-flex justify-content-center align-items-center container ">
                        <div class="form-group col-md-8">
                            <form:label path="interviewCategory.name"
                                        class="col-form-label"> Category:</form:label>
                            <form:input path="interviewCategory.name" class="form-control"
                                        placeholder="Category"
                                        readonly="true"/>
                            <form:errors path="interviewCategory.name" cssClass="errorMessage"/>
                        </div>
                    </div>


                    <%--                    question--%>
                    <div class="d-flex justify-content-center align-items-center container ">
                        <div class="form-group col-md-8">
                            <form:label path="question"
                                        class="col-form-label"> Question:</form:label>
                            <form:textarea path="question" class="form-control" placeholder="Question"/>
                            <form:errors path="question" cssClass="errorMessage"/>
                        </div>
                    </div>

                    <%--                    answer--%>
                    <div class="d-flex justify-content-center align-items-center container ">
                        <div class="form-group col-md-8">
                            <form:label path="answer"
                                        class="col-form-label"> Answer:</form:label>
                            <form:textarea path="answer" class="form-control" placeholder="Answer"/>
                            <form:errors path="answer" cssClass="errorMessage"/>
                        </div>
                    </div>

                    <%--                    difficulty level--%>
                    <div class="d-flex justify-content-center align-items-center container ">
                        <div class="form-group col-md-8">
                            <form:label path="difficulty"
                                        class=" col-form-label"> Difficulty Level </form:label>
                            <form:select path="difficulty" class="form-control">
                                <form:option value="OK" label="--Please Select--" selected="selected"/>
                                <form:options items="${difficulty}"/>
                            </form:select>
                            <form:errors path="difficulty" cssClass="errorMessage"/>
                        </div>
                    </div>

                    <%--                    ready?--%>
                    <div class="d-flex justify-content-center align-items-center container ">
                        <div class="form-group col-md-8">
                            <form:label path="ready"
                                        class="col-form-label"> Ready? </form:label>
                            <form:checkbox path="ready" class="form-control"/>
                            <form:errors path="ready" cssClass="errorMessage"/>
                        </div>
                    </div>

                    <div class="d-flex justify-content-center align-items-center container ">
                        <div class="col-md-8 text-center mt-3">
                            <input type="submit" class="btn btn-primary btn-block" value="Save">
                            <a href="/user/questions/${questionId}" class="btn btn-block btn-link" role="button"> Discard </a>
                        </div>
                        <form:hidden path="id"/>
                        <form:hidden path="added"/>
                    </div>
                </form:form>
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