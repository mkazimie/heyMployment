<%--
  Created by IntelliJ IDEA.
  User: magdalena
  Date: 12.05.2020
  Time: 13:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<html>
<head>
    <title> Course List</title>
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
    <div class="container mt-5 mx-auto ml-4 mr-4">
        <h1 class="bd-title"> Course List</h1>
        <h2><a href="/user/courses/add" class="btn btn-primary"> + </a>
        </h2>

        <table class="table css-serial">
            <thead class="thead-dark">
            <tr>
                <th>#</th>
                <th scope="col"> Actions</th>
                <th scope="col"> Name</th>
                <th scope="col"> Description</th>
                <th scope="col"> Status</th>
                <th scope="col"> Link</th>
                <th scope="col"> Organized By</th>
                <th scope="col"> Ends By</th>
                <th scope="col"> Topics</th>
                <th scope="col"> To Dos</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach items="${allCourses}" var="course">
                <tr>
                    <td></td>
                    <td class="btn-group">
                        <a href="#/user/courses/${course.id}" class="btn btn-link"> Details </a>
                        <a href="#/user/courses/update/${course.id}" class="btn btn-link"> Edit </a>
                        <a href="/user/courses/confirm-delete/${course.id}" class="btn btn-link"> Delete </a>
                        <a href="#/user/todos/add/course/${course.id}" class="btn btn-link"> Add a To-Do </a>
                    </td>
                    <td>${course.name}</td>
                    <td>${course.description}</td>
                    <td>${course.status}</td>
                    <c:choose>
                        <c:when test="${not empty course.url}">
                            <td><a href="${course.url}">See Course</a></td>
                        </c:when>
                        <c:otherwise>
                            <td></td>
                        </c:otherwise>
                    </c:choose>
                    <td>${course.organizedBy}</td>
                    <td>${course.finishDate}</td>
                    <td><c:forEach items="${course.topics}" var="topic">
                        <div>${topic.name}</div>
                    </c:forEach>
                    </td>
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