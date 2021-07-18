<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <jsp:include page="/WEB-INF/partials/head.jsp">
    <jsp:param name="title" value="Welcome to my site!"/>
  </jsp:include>
</head>
<body style="background-color: #f3f2ef">
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div class="container mt-4" style="background-color:azure">

  <h1 class="col-12 text-center mb-5">Welcome to the Food Mood!</h1>
<%--        comment--%>

  <div class="card col-md-4">
    <img src="https://placeholder.pics/svg/300x200" class="card-img-top" alt="...">
    <div class="card-body">
      <h5 class="card-title">Login Today!</h5>
      <p class="card-text">Continue browsing Recipes and Creating Recipes!</p>
      <form method="GET" action="/login">
        <button type="submit" class="btn btn-primary">Login</button>
      </form>
    </div>
  </div>

  <div class="card col-md-4">
    <img src="https://placeholder.pics/svg/300x200" class="card-img-top" alt="...">
    <div class="card-body">
      <h5 class="card-title">Make an Account!</h5>
      <p class="card-text">Start browsing Recipes and Creating Recipes!</p>
      <form method="GET" action="/register">
        <button type="submit" class="btn btn-primary">Login</button>
      </form>
    </div>
  </div>

  <div class="card col-md-4">
    <img src="https://placeholder.pics/svg/300x200" class="card-img-top" alt="...">
    <div class="card-body">
      <h5 class="card-title">View Recipes</h5>
      <p class="card-text">Start browsing Recipes but you need to Login or Register to view individual pages, or create
        recipes</p>
      <form method="GET" action="/ads">
        <button type="submit" class="btn btn-primary">Login</button>
      </form>
    </div>
  </div>


</div>


</body>
</html>
