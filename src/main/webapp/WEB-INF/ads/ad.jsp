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
    <form method ="POST" action="/ads/edit">
    <h2>You are the owner you may edit this.</h2>

      <div class="container">
        <h1><label for="newTitle">New Title:</label><input type="text" name="newTitle" id="newTitle" value="${sessionScope.ad.title}!"></h1>
        <p><label for="newDesc">New Description</label><textarea name="newDesc" id="newDesc" rows="20" cols="70">${sessionScope.ad.description}!</textarea></p>
        <br>
        <ul>
          <c:forEach var="ingredient" items="${sessionScope.ingredients}">
            <li>
                ${ingredient}
            </li>
          </c:forEach>
        </ul>
        <br>
      <%--        <h4>User ID: ${sessionScope.ad.userId}</h4>--%>
        <h4>Creator: ${sessionScope.adOwner.username}</h4>
        <button type="submit">Submit Changes</button>
      </div>
    </form>
    <form method="POST" action="/ads/delete">
      <div class="container">
      <button type="submit">Delete me</button>
      </div>
    </form>
  </c:when>
  <c:otherwise>
    <div class="container">
      <h1>Title: ${sessionScope.ad.title}!</h1>
      <p>Description: ${sessionScope.ad.description}!</p>
      <br>
      <ul>
      <c:forEach var="ingredient" items="${sessionScope.ingredients}">
        <li>
          ${ingredient}
        </li>
      </c:forEach>
      </ul>
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
