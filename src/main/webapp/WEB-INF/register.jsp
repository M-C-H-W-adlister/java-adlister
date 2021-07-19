<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!" />
    </jsp:include>
</head>
<body>
    <jsp:include page="partials/navbar.jsp" />
    <div class="container mt-4">
            <div class="row d-flex justify-content-center align-items-center" style="height: 90vh">
        <h1>Register Here</h1>
        <form action="/register" method="post">
            <div class="form-group">
                <label for="username">Username ${usernameExistsMessage}</label>
                <input id="username" name="username" value="${username}" class="form-control" type="text">

            </div>
            <div class="form-group">
                <label for="email">Email ${emailExistsMessage}</label>
                <input id="email" name="email" value="${email}" class="form-control" type="text">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input id="password" name="password" class="form-control" type="password">
            </div>
            <div class="form-group">
                <label for="confirm_password">Confirm Password ${pwMessage}</label>
                <input id="confirm_password" name="confirm_password" class="form-control" type="password">
            </div>
            <input type="submit" class="btn btn-primary btn-block">
        </form>
            </div>
    </div>
</body>
</html>
