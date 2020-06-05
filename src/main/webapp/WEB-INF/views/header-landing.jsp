<header class="page-header no-background">
    <nav class="navbar bg-light static-top ml-4">
        <a href="/" class="navbar-brand">
            <strong> heyMployment! </strong>
        </a>


        <ul class="nav nav-pills text-uppercase nav-fill">
            <c:choose>
                <c:when test="${empty currentUser}">
                    <li class="nav-item">
                        <a class="nav-link color-header" href="/register"><i class="far fa-id-card"></i>&nbsp; register
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link color-header" href="/login"><i class="fas fa-sign-in-alt"></i>&nbsp; login
                        </a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="nav-item">
                        <a class="nav-link color-header" href="/user/home"><i class="fas fa-home"></i> home
                        </a>
                    </li>
                </c:otherwise>
            </c:choose>
            <li class="nav-item">

                <a class="nav-link" href="#about"><i class="fas fa-info"></i>&nbsp; about </a>
            </li>
            <li class="nav-item mr-4">
                <a class="nav-link" href="#contact"><i class="far fa-envelope"></i>&nbsp; contact </a>
            </li>
        </ul>


    </nav>
</header>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="<c:url value='/js/main.js'/>" type="text/javascript"></script>
