<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Daftar User</title>
        <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/resources/css/bootstrap-theme.min.css" rel="stylesheet" />
    </head>
    <body>
        
        <div class="container">
            <br />
            <div class="panel panel-default">
                <div class="panel-heading"><span class="lead">List of Users</span></div>
                <c:if test="not empty msg">
                    <div class="alert alert-${css} alert-dismissible" role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <strong>${msg}</strong>
                    </div>
                </c:if>
                
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>#ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Framework</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" items="${users}">
                            <tr>
                                <td>${user.id}</td>
                                <td>${user.name}</td>
                                <td>${user.email}</td>
                                <td>
                                    <c:forEach var="framework" items="${user.framework}" varStatus="loop">
                                        ${framework}
                                        <c:if test="${not loop.last}">,</c:if>
                                    </c:forEach>
                                </td>
                                <td>
                                    <a class="btn btn-info" href="<c:url value='/user/find/${user.id}' />">Detail</a>
                                    <a class="btn btn-success" href="<c:url value='/user/edit/${user.id}' />">Edit</a>
                                    <a class="btn btn-danger" href="<c:url value='/user/delete/${user.id}' />">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="well">
                <a href="<c:url value='/user/add' />">Add New User</a>
            </div>
        </div>
        
        <script src="${pageContext.request.contextPath}/resources/js/jquery-2.1.4.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    </body>
</html>
