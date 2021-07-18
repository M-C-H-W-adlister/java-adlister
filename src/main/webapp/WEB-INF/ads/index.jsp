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

<div class="container mt-4" style="background-color:azure">
    <h1>Custom recipes from our table to yours!</h1>
    <form method="post" action="/search">
        <label for="searchTitle">
            Search by Title
        </label>
        <input id="searchTitle" name="searchTitle" type="text">
        <button type="submit"> Search </button>
    </form>

  <form method="post" action="ads/category">
    <label for="catID">Select category to search by.</label>
    <select id="catID" name="catID">
      <option value="1">Meat Lovers</option>
      <option value="2">Vegetarian</option>
      <option value="3">Keto</option>
      <option value="4">Gluten Free</option>
      <option value="5">Japanese Style</option>
      <option value="6">Mexican</option>
      <option value="7">American</option>
      <option value="8">Tex-mex</option>
    </select>
    <button type="submit">Submit category</button>
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
