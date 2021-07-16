<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <h1>Custom recipes from our table to yours!</h1>
    <form method="post" action="/search">
        <label for="searchTitle">
            Search by Title
        </label>
        <input id="searchTitle" name="searchTitle" type="text">
        <button type="submit"> Search </button>
    </form>

    <c:forEach var="ad" items="${ads}">
        <div class="col-md-6">
            <h2>${ad.title}</h2>
            <p>${ad.description}</p>
          <form method="POST" action="/ads/ad">
            <label for="selectedAd" hidden></label>
            <input checked hidden name="selectedAd" id="selectedAd" value="${ad.id}">
            <button type="submit">View Ad</button>
          </form>
        </div>
    </c:forEach>
</div>

</body>
</html>
