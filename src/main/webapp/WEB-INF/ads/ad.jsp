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
    <div style="text-align: center">
      <h2>Edit Recipe Post</h2>
    </div>

    <form method ="POST" action="/ads/edit">

          <div class="container mt-4">

            <div class="row d-flex justify-content-center align-items-center" style="height: 90vh">
              <form>
                <div class="form-group">
                  <label for="newTitle">New Title:</label>
                  <input type="text" name="newTitle" id="newTitle" value="${sessionScope.ad.title}">
                </div>
                <div class="form-group">
                  <label for="newDesc">New Description</label>
                  <textarea class="form-control" name="newDesc" id="newDesc" rows="3">${sessionScope.ad.description}</textarea>
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
                  <div class="container">
                    <div class="col-sm">
                      <button type="submit" class="btn btn-primary" >Submit Changes</button>
                    </div>
                </div>
                </div>
              </form>
              <form method="POST" action="/ads/delete">
                <div class="container">
                  <div class="col-sm">
                    <button type="submit" class="btn btn-danger">Delete Recipe Post</button>
                  </div>
                </div>
              </form>
            </div>
          </div>

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
      <h2>Creator: ${sessionScope.adOwner.username}</h2>
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
