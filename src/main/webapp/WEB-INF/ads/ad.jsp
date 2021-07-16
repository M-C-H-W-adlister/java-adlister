<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <jsp:include page="/WEB-INF/partials/head.jsp">
    <jsp:param name="title" value="Showing ${sessionScope.ad.title}"/>
  </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<c:choose>
  <c:when test="${sessionScope.isOwner}">
    <form method ="post" action="/ads/ad">
    <h2>HI you are the owner bro!</h2>

      <div class="container">
        <h1><label for="newTitle">New Title:</label><input type="text" name="newTitle" id="newTitle" value="${sessionScope.ad.title}!"></h1>
        <p><label for="newDesc">New Title:</label><input type="text" name="newDesc" id="newDesc" value="${sessionScope.ad.description}!"></p>
        <br>
<%--        <h4>User ID: ${sessionScope.ad.userId}</h4>--%>
        <h4>Creator: ${sessionScope.adOwner.username}</h4>


      </div>
    </form>
  </c:when>
  <c:otherwise>
    <div class="container">
      <h1>Title: ${sessionScope.ad.title}!</h1>
      <p>Description: ${sessionScope.ad.description}!</p>
      <br>
<%--      <h4>User ID: ${sessionScope.ad.userId}</h4>--%>
      <h4>Creator: ${sessionScope.adOwner.username}</h4>

    </div>
  </c:otherwise>
</c:choose>

<%--<div class="container">--%>
<%--  <h1>Title: ${sessionScope.ad.title}!</h1>--%>
<%--  <p>Description: ${sessionScope.ad.description}!</p>--%>
<%--  <br>--%>
<%--  <h4>User ID: ${sessionScope.ad.userId}</h4>--%>

<%--</div>--%>

</body>
</html>
