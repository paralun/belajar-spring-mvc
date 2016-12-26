<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="false"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Daftar Barang</title>
        <spring:url var="bootstrap" value="/resources/core/css/bootstrap.min.css" />
        <spring:url var="theme" value="/resources/core/css/bootstrap-theme.min.css" />
        <link href="${bootstrap}" rel="stylesheet" />
        <link href="${theme}" rel="stylesheet" />
    </head>
    <body>
        <spring:url value="/" var="home" />
        <spring:url value="/barang/add" var="add" />
        <nav class="navbar navbar-inverse">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" href="${home}">Home</a>
                </div>
                <div id="navbar">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="active"><a href="${add}">Add Barang</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container">
            <h1>Daftar Barang</h1>

            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Kode</th>
                        <th>Nama</th>
                        <th>Kategori</th>
                        <th>Harga</th>
                        <th>Stok</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="b" items="${barang}">
                        <tr>
                            <td>${b.kode}</td>
                            <td>${b.nama}</td>
                            <td>${b.kategori}</td>
                            <td>${b.harga}</td>
                            <td>${b.stok}</td>
                            <td>
                                <spring:url value="/barangs/${b.kode}" var="find" />
                                <spring:url value="/barang/${b.kode}/delete" var="delete" />
                                <spring:url value="/barang/${b.kode}/update" var="update" />
                                <a class="btn btn-info" href="${find}">Detail</a>
                                <a class="btn btn-primary" href="${update}">Update</a>
                                <a class="btn btn-danger" href="${delete}">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <spring:url var="jquery" value="/resources/core/js/jquery-2.1.4.min.js" />
        <spring:url var="bootstrapJs" value="/resources/core/js/bootstrap.min.js" />
        <script src="${jquery}"></script>
        <script src="${bootstrapJs}"></script>
    </body>
</html>
