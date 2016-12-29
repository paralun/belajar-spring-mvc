<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Barang List</title>
        <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/static/css/bootstrap-theme.min.css" rel="stylesheet" />
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

            <h1>All Barang</h1>
            <a class="btn btn-primary" href="<c:url value="/barang/add" />">Add Barang</a>
            
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Kode</th>
                        <th>Nama</th>
                        <th>Kategori</th>
                        <th>Harga</th>
                        <th>Stok</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="b" items="${barang}" varStatus="no">
                        <tr>
                            <td>${no.count}</td>
                            <td>${b.kodeBrg}</td>
                            <td>${b.namaBrg}</td>
                            <td>${b.kategori}</td>
                            <td>${b.harga}</td>
                            <td>${b.stok}</td>
                            <td>
                                <a class="btn btn-info" href="<c:url value='/barang/edit/${b.id}' />">Update</a>
                                <a class="btn btn-danger" href="<c:url value='/barang/delete/${b.id}' />">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <script src="${pageContext.request.contextPath}/static/js/jquery-2.1.4.min.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
    </body>
</html>
