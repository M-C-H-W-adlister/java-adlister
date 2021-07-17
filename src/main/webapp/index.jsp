<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!" />
    </jsp:include>
</head>
<body style="background-color: darkslategrey">
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container">
        <h1>Welcome to the Adlister!</h1>
<%--        comment--%>
    </div>

   c
            <form action="/" method="POST" class="form-inline col-12 justify-content-center"></form>
                <h1 class="col-12 text-center mb-5">Welcome to the Adlister!</h1>
                <input id="search-title" name="search-title" type="search" placeholder="Search Ads"
                       aria-label="Search" class="form-control">
                <button class="btn btn-primary" type="submit">Search</button>
        </div>
    </div>
</body>
</html>
