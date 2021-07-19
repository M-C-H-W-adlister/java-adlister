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
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Please Log In" />
    </jsp:include>
</head>
    <body>
            <div class="container mt-4">
                <div class="row d-flex justify-content-center align-items-center" style="height: 90vh">
            <div>
                <h3>What would you like to edit?</h3>
            </div>
                    <div>
                        <form action="user/password" method="post" >
                            <label for="newPassword"> New Password</label>
                            <input id="newPassword" name="newPassword" type="text" class="form-control">

                            <%--        <label for="newPasswordConfirm"> New Password</label>--%>
                            <%--        <input id="newPasswordConfirm" name="newPasswordConfirm" type="text">--%>
                            <button type="submit" class="btn btn-primary"> Change Password</button>
                        </form>
                        </div>
                        <form action="user/email" method="post">
                            <label for="newEmail">New Email</label>
                            <input id = newEmail name="newEmail" type="text" class="form-control">
                            <button type="submit" class="btn btn-primary"> Change Email</button>
                        </form>
                    </div>
            </div>
    </body>
</html>
