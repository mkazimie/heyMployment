<%--
  Created by IntelliJ IDEA.
  User: magdalena
  Date: 07.05.2020
  Time: 11:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<html>
<head>
    <title>Job Offer Form</title>
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
            <li class="breadcrumb-item"><a href="/user/offers/"> Job Offers </a></li>
            <li class="breadcrumb-item"><a href="/user/offers/add"> Add Step1 </a></li>
            <li class="breadcrumb-item active" aria-current="page"> Add Step 2</li>
        </ol>
    </nav>

    <div class="container">
        <div class="card mx-auto mt-3">
            <div class="card-header bg-dark form-header text-white text-center"> Job Offer Details</div>
            <div class="card-body">
                <form:form method="post" modelAttribute="offer" action="/user/offers/add/details">

                    <h5 class="errorMessage center-content">${failed}</h5>

                    <div class="d-flex justify-content-center align-items-center container ">
                        <div class="form-group col-md-8">
                            <form:label path="description"
                                        class="col-form-label"> Job Description :</form:label>
                            <form:textarea path="description" class="form-control" placeholder="Description"/>
                            <form:errors path="description" cssClass="errorMessage"/>
                        </div>
                    </div>

                    <div class="d-flex justify-content-center align-items-center container ">
                        <div class="form-group col-md-8">
                            <form:label path="url"
                                        class="col-form-label"> Link to Offer :</form:label>
                            <form:input path="url" class="form-control" placeholder="Link"/>
                            <form:errors path="url" cssClass="errorMessage"/>
                        </div>
                    </div>

                    <div class="d-flex justify-content-center align-items-center container ">
                        <div class="form-group col-md-8">
                            <form:label path="jobSearchWebsite"
                                        class="col-form-label"> Posted on Website: </form:label>
                            <form:input path="jobSearchWebsite" class="form-control" placeholder=" Name"/>
                            <form:errors path="jobSearchWebsite" cssClass="errorMessage"/>
                        </div>
                    </div>

                    <div class="d-flex justify-content-center align-items-center container ">
                        <div class="form-group col-md-8">
                            <form:label path="salary"
                                        class="col-form-label"> Expected Salary: </form:label>
                            <form:input path="salary" class="form-control" placeholder="Salary"/>
                            <form:errors path="salary" cssClass="errorMessage"/>
                        </div>
                    </div>

                    <div class="d-flex justify-content-center align-items-center container ">
                        <div class="form-group col-md-8">
                            <form:label path="howAttractive"
                                        class="col-form-label"> How Attractive is the offer? </form:label>
                            <form:select path="howAttractive" class="form-control">
                                <form:option value="OK" label="--Please Select--" selected="selected"/>
                                <form:options items="${attractiveness}"/>
                            </form:select>
                            <form:errors path="howAttractive" cssClass="errorMessage"/>
                        </div>
                    </div>

                    <div class="d-flex justify-content-center align-items-center container ">
                        <div class="form-group col-md-8">
                            <form:label path="appliedOn"
                                        class="col-form-label"> Applied On: </form:label>
                            <form:input path="appliedOn" type="date" class="form-control" placeholder="yyyy-MM-dd"/>
                            <form:errors path="appliedOn" cssClass="errorMessage"/>
                        </div>
                    </div>

                    <div class="d-flex justify-content-center align-items-center container ">
                        <div class="form-group col-md-8">
                            <form:label path="notes"
                                        class="col-form-label"> Notes: </form:label>
                            <form:textarea path="notes" class="form-control" placeholder="Additional Notes"/>
                            <form:errors path="notes" cssClass="errorMessage"/>
                        </div>
                    </div>

                    <div class="d-flex justify-content-center align-items-center container ">
                        <div class="col-md-8 text-center mt-3">
                            <input type="submit" class="btn btn-primary btn-block" value="Save">
                            <a href="/user/offers/" class="btn btn-block btn-link" role="button"> Skip </a>
                            <form:hidden path="id"/>
                            <form:hidden path="title"/>
                            <form:hidden path="company"/>
                            <form:hidden path="location"/>
                            <form:hidden path="status"/>
                            <form:hidden path="user.id"/>
                            <form:hidden path="added"/>
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
</body>
</html>