<%--
  Created by IntelliJ IDEA.
  User: alexhernandez
  Date: 7/15/21
  Time: 4:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/navbar.jsp"/>
        <div class="container mt-4" style="background-color: azure">
            <div class="row d-flex justify-content-center align-items-center" style="height: 90vh">
    <title>Edit Profile</title>
    <div>
        <h3>What would you like to edit?</h3>

    </div>
    <form action="user/password" method="post" >
        <label for="newPassword"> New Password</label>
        <input id="newPassword" name="newPassword" type="text">

<%--        <label for="newPasswordConfirm"> New Password</label>--%>
<%--        <input id="newPasswordConfirm" name="newPasswordConfirm" type="text">--%>

        <button type="submit"> Change Password</button>


    </form>
            </div>
        </div>
</head>
<body>

</body>
</html>
