<header class="page-header no-background">
    <nav class="navbar bg-light static-top">
        <a href="/user/home" class="navbar-brand main-logo ml-4">
            <strong> heyMployment! </strong>
        </a>
        <ul class="nav nounderline text-uppercase nav-fill">
            <li class="nav-item">
                <a class="nav-link color-header" href="/user/home"><i class="fas fa-home"></i> &nbsp;home
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link color-header" href="/logout"> <i class="fas fa-sign-out-alt"></i>&nbsp; sign out </a>
            </li>
<%--            <li class="nav-item">--%>
<%--                <a class="nav-link color-header" href="/user/update"><i class="fas fa-id-badge"></i>&nbsp;--%>
<%--                    profile </a>--%>
<%--            </li>--%>
<%--            <li class="nav-item">--%>
<%--                <a class="nav-link color-header" href="#contact"><i class="fas fa-envelope"></i>&nbsp contact </a>--%>
<%--            </li>--%>
            <sec:authorize access="hasRole('ADMIN')">
                <li class="nav-item">
                    <a class="nav-link" href="/admin/panel">&nbsp;<i class="fas fa-user-shield"></i>&nbsp admin panel
                    </a>
                </li>
            </sec:authorize>
            <li class="nav-item">
                <a class="nav-link color-header" href="/user/update"><i class="fas fa-user"></i>&nbsp
                    <strong> ${currentUser.username} </strong> </a>
            </li>
        </ul>
    </nav>
</header>