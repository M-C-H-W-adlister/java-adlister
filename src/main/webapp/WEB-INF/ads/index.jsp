<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <jsp:include page="/WEB-INF/partials/head.jsp">
    <jsp:param name="title" value="Viewing All The Ads"/>
  </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>


<div class="container mt-4" style="background-color:azure">
  <h1>Custom recipes from our table to yours!</h1>
  <form method="post" action="/search">
    <label for="searchTitle">Search by Title</label>
    <div class="input-group mb-3">
      <div class="input-group-prepend">
      </div>
      <input type="text" name="searchTitle" id="searchTitle" class="form-control" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1">
      <button class="btn btn-primary" type="submit" id="button-addon1">Search</button>
    </div>


<%--    <input id="searchTitle" name="searchTitle" type="text">--%>
<%--    <button type="submit" class="btn btn-primary"> Search</button>--%>
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
    <button type="submit" class="btn btn-primary">Submit category</button>
  </form>

  <c:forEach var="ad" items="${ads}">
    <%--https://placeholder.pics/svg/300x200--%>
    <div class="card col-md-4">
      <img height="200" width="300" src="https://www.kindpng.com/picc/m/74-746950_fry-pan-cooking-food-beverage-cartoon-hd-png.png"  class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">${ad.title}</h5>
        <p class="card-text">${ad.description}</p>
        <form method="GET" action="/ads/ad">
          <input checked hidden name="selectedAd" id="selectedAd" value="${ad.id}">
          <button type="submit" class="btn btn-primary">View Recipe</button>
        </form>
      </div>
    </div>
    <%--Below is old code, could be deleted.--%>
    <%--    <div class="col-md-6">--%>
    <%--      <h2>${ad.title}</h2>--%>
    <%--      <p>${ad.description}</p>--%>
    <%--      <form method="GET" action="/ads/ad">--%>
    <%--        <label for="selectedAd" hidden></label>--%>
    <%--        <input checked hidden name="selectedAd" id="selectedAd" value="${ad.id}">--%>
    <%--        <button type="submit">View Ad</button>--%>
    <%--      </form>--%>
    <%--    </div>--%>
  </c:forEach>
</div>
<jsp:include page="/WEB-INF/partials/bootstrapScripts.jsp"/>

</body>
</html>
