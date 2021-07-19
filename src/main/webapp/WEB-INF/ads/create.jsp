<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad" />
    </jsp:include>
</head>
<body>

    <div class="container mt-4">
        <div class="row d-flex justify-content-center align-items-center" style="height: 90vh">
        <h1>Create your own Recipe!</h1>

        <form action="/ads/create" method="post">
            <div class="form-group">
                <label for="title">Title</label>
                <input id="title" name="title" class="form-control" type="text" required>
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" class="form-control" type="text" required></textarea>
            </div>
          <div class="form-group">
            <label for="ingredients">Ingredients list (separate with commas)</label>
            <textarea id="ingredients" name="ingredients" class="form-control" type="text" required></textarea>
          </div>
            <input type="submit" class="btn btn-block btn-primary">
        </form>
        </div>
    </div>
</body>
</html>
