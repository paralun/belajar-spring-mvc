<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Detail User</title>
        <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/resources/css/bootstrap-theme.min.css" rel="stylesheet" />
    </head>
    <body>

        <div class="container">
            <c:if test="${not empty msg}">
                <div class="alert alert-${css} alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <strong>${msg}</strong>
                </div>
            </c:if>

            <h1>User Detail</h1>
            <br />

            <div class="row">
                <label class="col-sm-2">ID</label>
                <div class="col-sm-10">${user.id}</div>
            </div>

            <div class="row">
                <label class="col-sm-2">Name</label>
                <div class="col-sm-10">${user.name}</div>
            </div>

            <div class="row">
                <label class="col-sm-2">Email</label>
                <div class="col-sm-10">${user.email}</div>
            </div>

            <div class="row">
                <label class="col-sm-2">Address</label>
                <div class="col-sm-10">${user.address}</div>
            </div>

            <div class="row">
                <label class="col-sm-2">Newsletter</label>
                <div class="col-sm-10">${user.newsletter}</div>
            </div>

            <div class="row">
                <label class="col-sm-2">Web Frameworks</label>
                <div class="col-sm-10">${user.framework}</div>
            </div>

            <div class="row">
                <label class="col-sm-2">Sex</label>
                <div class="col-sm-10">${user.sex}</div>
            </div>

            <div class="row">
                <label class="col-sm-2">Number</label>
                <div class="col-sm-10">${user.number}</div>
            </div>

            <div class="row">
                <label class="col-sm-2">Country</label>
                <div class="col-sm-10">${user.country}</div>
            </div>

            <div class="row">
                <label class="col-sm-2">Skill</label>
                <div class="col-sm-10">${user.skill}</div>
            </div>
        </div>

        <script src="${pageContext.request.contextPath}/resources/js/jquery-2.1.4.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    </body>
</html>
