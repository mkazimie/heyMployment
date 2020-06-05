<%--
  Created by IntelliJ IDEA.
  User: magdalena
  Date: 15.05.2020
  Time: 10:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<html>
<head>
    <title>Category List</title>
    <link href="<c:url value="/css/main.css"/>" rel="stylesheet"/>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <!-- Bootstrap Fonts -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
          integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

</head>
<body>
<%@include file="main-header.jsp" %>
<sec:authorize access="isAuthenticated()">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item ml-4"><a href="/user/home"><i class="fas fa-home"></i> Home</a></li>
            <li class="breadcrumb-item active" aria-current="page"> Interview Categories</li>
        </ol>
    </nav>


    <div class="container mt-5 mx-auto ml-4 mr-4">
        <div class="row">
            <div class="col-sm-10 col-12">
                <h1 class="bd-title"> Interview Categories <a href="/user/categories/add" class="btn btn-primary"> +
                </a></h1>
            </div>
        </div>

        <div class="mt-5">
            <form:form action="/user/categories/questions/filter" method="post">
                <div class="form-inline">
                    <div class="form-group">
                        <label for="keyword"><strong> Filter questions by keyword </strong></label>
                        <input type="text" id="keyword" name="keyword" class="form-control mx-sm-3" required="required">
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-search"></i></button>
                        <a href="/user/categories/" class="btn btn-dark ml-2"><i
                                class="fas fa-times"></i></a>
                    </div>
                </div>
            </form:form>
        </div>

        <table class="table table-striped css-serial">
            <thead class="thead-dark">
            <tr class="text-center">
                <th>#</th>
                <th scope="col"> Name</th>
                <th scope="col"> Number of Questions</th>
                <th scope="col"> See Questions</th>
                <th scope="col"> Add a question</th>
                <th scope="col"> Actions</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach items="${categories}" var="category">
                <tr class="text-center">
                    <td class="align-middle"></td>
                    <th scope="col" class="align-middle">${category.name}</th>
                    <td class="align-middle">${category.interviewQuestions.size()}</td>
                    <td class="align-middle"><a href="/user/categories/${category.id}/questions"
                                                class="btn btn-primary">Questions</a></td>
                    <td class="align-middle"><a href="/user/categories/${category.id}/questions/add"
                                                class="btn btn-primary"> + </a></td>
                    <td class="align-middle"><a href="/user/categories/update/${category.id}">Edit</a> |
                        <a href="/user/categories/confirm-delete/${category.id}">Delete</a></td>
                </tr>
            </c:forEach>
            </tbody>

        </table>
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
