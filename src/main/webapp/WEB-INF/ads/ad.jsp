<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <jsp:include page="/WEB-INF/partials/head.jsp">
    <jsp:param name="title" value="Showing ${sessionScope.ad.title}"/>
  </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container">
  <h1>Title: ${sessionScope.ad.title}!</h1>
  <p>Description: ${sessionScope.ad.description}!</p>
  <br>
  <h4>User ID: ${sessionScope.ad.userId}</h4>

</div>

</body>
</html>
