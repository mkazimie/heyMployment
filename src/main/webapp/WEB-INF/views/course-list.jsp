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
        <h1 class="bd-title"> My Courses</h1>
        <h2><a href="/user/courses/add" class="btn btn-primary"> Add New Course </a>
        </h2>


        <h5 class="text-center"><button type="button" class="btn btn-primary">${allHowMany} ${specificHowMany}</button>
        </h5>
        <nav class="bd-subnavbar pt-2 pb-3 pb-md-2 text-uppercase nav-fill">
            <div class="container d-flex align-items-md-center py-2">
                <nav class="nav mx-auto">
                    <a href="/user/courses/all" class="btn btn-link">All</a>
                    <a href="/user/courses/all/${status[0]}" class="btn btn-link">${status[0]}</a>
                    <a href="/user/courses/all/${status[1]}" class="btn btn-link">${status[1]}</a>
                    <a href="/user/courses/all/${status[2]}" class="btn btn-link">${status[2]}</a>
                </nav>
            </div>
        </nav>


        <table class="table css-serial">
            <thead class="thead-dark">
            <tr class="text-center">
                <th>#</th>
                <th scope="col"> Name</th>
                <th scope="col"> Status</th>
                <th scope="col"> Link</th>
                <th scope="col"> Organized By</th>
                <th scope="col"> Topics</th>
                <th scope="col"> + </th>

            </tr>
            </thead>

            <tbody>
            <c:forEach items="${allCourses}" var="course">
                <tr class="text-center">
                    <td class="align-middle"></td>
                    <th scope="col" class="align-middle">${course.name}</th>
                    <td class="align-middle">${course.status}</td>
                    <c:choose>
                        <c:when test="${not empty course.url}">
                            <td class="align-middle"><a href="${course.url}"> Course Website </a></td>
                        </c:when>
                        <c:otherwise>
                            <td></td>
                        </c:otherwise>
                    </c:choose>
                    <td class="align-middle">${course.organizedBy}</td>
                    <td class="align-middle"><c:forEach items="${course.topics}" var="topic">
                        <div>${topic.name}</div>
                    </c:forEach>
                    </td>
                    <td class="align-middle"><a href="/user/courses/${course.id}" class="btn btn-primary"> Details </a> </td>
                </tr>
            </c:forEach>
            </tbody>


            <tbody>
            <c:forEach items="${allByStatus}" var="byStatus">
                <tr class="text-center">
                    <td class="align-middle"></td>
                    <th scope="col" class="align-middle">${byStatus.name}</th>
                    <td class="align-middle">${byStatus.status}</td>
                    <c:choose>
                        <c:when test="${not empty byStatus.url}">
                            <td class="align-middle"><a href="${byStatus.url}">See Course</a></td>
                        </c:when>
                        <c:otherwise>
                            <td></td>
                        </c:otherwise>
                    </c:choose>
                    <td class="align-middle">${byStatus.organizedBy}</td>
                    <td class="align-middle"><c:forEach items="${byStatus.topics}" var="topic">
                        <div>${topic.name}</div>
                    </c:forEach>
                    </td>
                    <td class="align-middle"><a href="/user/courses/${byStatus.id}" class="btn btn-primary"> Details </a></td>
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