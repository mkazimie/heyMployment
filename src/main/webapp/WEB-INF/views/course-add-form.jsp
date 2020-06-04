<%--
  Created by IntelliJ IDEA.
  User: magdalena
  Date: 12.05.2020
  Time: 11:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<html>
<head>
    <title>Course Form</title>
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
            <li class="breadcrumb-item"><a href="/user/courses/"> Courses </a></li>
            <li class="breadcrumb-item active" aria-current="page"> Add</li>
        </ol>
    </nav>

    <div class="container">
        <div class="card mx-auto mt-3">
            <div class="card-header bg-dark form-header text-white text-center"> Course Form</div>
            <div class="card-body">
                <form:form method="post" modelAttribute="course" action="/user/courses/add">

                    <h5 class="errorMessage center-content">${failed}</h5>


                    <div class="d-flex justify-content-center align-items-center container ">
                        <div class="form-group col-md-8">
                            <form:label path="name" class="col-form-label"> Course Name: </form:label>
                            <form:input path="name" class="form-control" placeholder="Course Name"/>
                            <form:errors path="name" cssClass="errorMessage"/>
                        </div>
                    </div>
                    <div class="d-flex justify-content-center align-items-center container ">
                        <div class="form-group col-md-8">
                            <form:label path="description" class="col-form-label"> Description: </form:label>
                            <form:textarea path="description" class="form-control" placeholder="Description"/>
                            <form:errors path="description" cssClass="errorMessage"/>
                        </div>
                    </div>
                    <div class="d-flex justify-content-center align-items-center container ">
                        <div class="form-group col-md-8">
                            <form:label path="status"
                                        class="col-form-label"> Status: </form:label>
                            <form:select path="status" class="form-control">
                                <form:option value="Wishlist" label="--Please Select--" selected="selected"/>
                                <form:options items="${status}"/>
                            </form:select>
                            <form:errors path="status" cssClass="errorMessage"/>
                        </div>
                    </div>
                    <div class="d-flex justify-content-center align-items-center container ">
                        <div class="form-group col-md-8">
                            <form:label path="url"
                                        class=" col-form-label"> Link To Course:</form:label>
                            <form:input path="url" class="form-control" placeholder="URL"/>
                            <form:errors path="url" cssClass="errorMessage"/>
                        </div>
                    </div>
                    <div class="d-flex justify-content-center align-items-center container ">
                        <div class="form-group col-md-8">
                            <form:label path="organizedBy" class="col-form-label"> Organized By:</form:label>
                            <form:input path="organizedBy" class="form-control" placeholder="Organized By"/>
                            <form:errors path="organizedBy" cssClass="errorMessage"/>
                        </div>
                    </div>
                    <div class="d-flex justify-content-center align-items-center container ">
                        <div class="form-group col-md-8">
                            <form:label path="finishDate" class="col-form-label"> Ends On: </form:label>
                            <form:input path="finishDate" type="date" class="form-control" placeholder="yyyy-MM-dd"/>
                            <form:errors path="finishDate" cssClass="errorMessage"/>
                        </div>
                    </div>
                    <div class="d-flex justify-content-center align-items-center container ">
                        <div class="form-group col-md-8">
                            <form:label path="mainTopic" class="col-form-label"> Topics: </form:label>
                            <form:input path="mainTopic" class="form-control" placeholder="Main Topic"/>
                            <form:errors path="mainTopic" cssClass="errorMessage"/>
                        </div>
                    </div>
                    <div class="d-flex justify-content-center align-items-center container ">
                        <div class="form-group col-md-8">
                            <form:label path="additionalTopic1" class="col-form-label"> </form:label>
                            <form:input path="additionalTopic1" class="form-control" placeholder="Additional Topic"/>
                            <form:errors path="additionalTopic1" cssClass="errorMessage"/>
                        </div>
                    </div>
                    <div class="d-flex justify-content-center align-items-center container ">
                        <div class="form-group col-md-8">
                            <form:label path="additionalTopic2" class="col-form-label"> </form:label>
                            <form:input path="additionalTopic2" class="form-control" placeholder="Additional Topic"/>
                            <form:errors path="additionalTopic2" cssClass="errorMessage"/>
                        </div>
                    </div>


                    <div class="d-flex justify-content-center align-items-center container ">
                        <div class="col-md-8 text-center mt-3">
                            <input type="submit" class="btn btn-primary btn-block" value="Save">
                            <a href="/user/courses/" class="btn btn-block btn-link" role="button"> Discard </a>
                        </div>
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
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<c:url value='/js/main.js'/>" type="text/javascript"></script>


</body>
</html>