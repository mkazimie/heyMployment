<%--
  Created by IntelliJ IDEA.
  User: magdalena
  Date: 06.05.2020
  Time: 12:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<html>
<head>
    <title>Edit Form</title>
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
            <li
                    class="breadcrumb-item"><a href="/user/offers/details/${jobOffer.id}"> ${jobOffer.title} Details
            </a></li>
            <li class="breadcrumb-item active" aria-current="page"> ${jobOffer.title} Edit </li>
        </ol>
    </nav>


    <div class="container">
        <div class="card mx-auto mt-3">
            <div class="card-header bg-dark form-header text-white text-center"> Edit Job Offer</div>
            <div class="card-body">
                <form:form method="post" modelAttribute="jobOffer" action="/user/offers/update">

                    <h5 class="errorMessage center-content">${failed}</h5>

                    <div class="form-group row">
                        <form:label path="title"
                                    class="col-md-4 col-form-label text-md-right"> Job Title: </form:label>
                        <div class="col-md-6">
                            <form:input path="title" class="form-control" placeholder="Job Title"/>
                            <form:errors path="title" cssClass="errorMessage"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <form:label path="description"
                                    class="col-md-4 col-form-label text-md-right"> Description:</form:label>
                        <div class="col-md-6">
                            <form:textarea path="description" class="form-control" placeholder="Description"/>
                            <form:errors path="description" cssClass="errorMessage"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <form:label path="url"
                                    class="col-md-4 col-form-label text-md-right"> Link :</form:label>
                        <div class="col-md-6">
                            <form:input path="url" class="form-control" placeholder="Link"/>
                            <form:errors path="url" cssClass="errorMessage"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <form:label path="jobSearchWebsite"
                                    class="col-md-4 col-form-label text-md-right"> Job Search Website: </form:label>
                        <div class="col-md-6">
                            <form:input path="jobSearchWebsite" class="form-control" placeholder="Website Name"/>
                            <form:errors path="jobSearchWebsite" cssClass="errorMessage"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <form:label path="location"
                                    class="col-md-4 col-form-label text-md-right"> Location: </form:label>
                        <div class="col-md-6">
                            <form:input path="location" class="form-control" placeholder="Location"/>
                            <form:errors path="location" cssClass="errorMessage"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <form:label path="company.name"
                                    class="col-md-4 col-form-label text-md-right"> Company: </form:label>
                        <div class="col-md-6">
                            <form:input path="company.name" class="form-control" placeholder="Company" readonly="true"/>
                            <form:errors path="company.name" cssClass="errorMessage"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <form:label path="salary"
                                    class="col-md-4 col-form-label text-md-right"> Salary: </form:label>
                        <div class="col-md-6">
                            <form:input path="salary" class="form-control" placeholder="Salary"/>
                            <form:errors path="salary" cssClass="errorMessage"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <form:label path="status"
                                    class="col-md-4 col-form-label text-md-right"> Status </form:label>
                        <div class="col-md-6">
                            <form:select path="status" class="form-control">
                                <form:options items="${status}"/>
                            </form:select>
                        </div>
                        <form:errors path="status" cssClass="errorMessage"/>
                    </div>
                    <div class="form-group row">
                        <form:label path="howAttractive"
                                    class="col-md-4 col-form-label text-md-right"> How Attractive is the offer? </form:label>
                        <div class="col-md-6">
                            <form:select path="howAttractive" class="form-control">
                                <form:options items="${attractiveness}"/>
                            </form:select>
                        </div>
                        <form:errors path="howAttractive" cssClass="errorMessage"/>
                    </div>
                    <div class="form-group row">
                        <form:label path="appliedOn"
                                    class="col-md-4 col-form-label text-md-right"> Applied On: </form:label>
                        <div class="col-md-6">
                            <form:input path="appliedOn" type="date" class="form-control" placeholder="yyyy-MM-dd"/>
                            <form:errors path="appliedOn" cssClass="errorMessage"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <form:label path="notes"
                                    class="col-md-4 col-form-label text-md-right"> Notes: </form:label>
                        <div class="col-md-6">
                            <form:textarea path="notes" class="form-control" placeholder="Additional Notes"/>
                            <form:errors path="notes" cssClass="errorMessage"/>
                        </div>
                    </div>
                    <div class="col-md-6 offset-md-4">
                        <input type="submit" class="btn btn-primary btn-block" value="Save">
                        <form:hidden path="editedVersion" value="true"/>
                        <form:hidden path="user.id"/>
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