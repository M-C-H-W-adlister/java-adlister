<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <jsp:include page="/WEB-INF/partials/head.jsp">
    <jsp:param name="title" value="Your Profile"/>
  </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container mt-4" style="background-color:azure">
<%--  <div class="row d-flex justify-content-center align-items-center" style="height: 90vh">--%>
    <h1>Welcome, ${sessionScope.user.username}!</h1>
<%--  </div>--%>
  <form method="post" action="/editProfile">
    <button type="submit">Edit Profile</button>
  </form>
  <c:forEach var="ad" items="${ads}">
  <div class="card col-md-4">
    <img src="https://placeholder.pics/svg/300x200" class="card-img-top" alt="...">
    <div class="card-body">
      <h5 class="card-title">${ad.title}</h5>
      <p class="card-text">${ad.description}</p>
      <form method="GET" action="/ads/ad">
        <input checked hidden name="selectedAd" id="selectedAd" value="${ad.id}">
        <button type="submit" class="btn btn-primary">View Recipe</button>
      </form>
    </div>
  </div>
  </c:forEach>

</body>
</html>
