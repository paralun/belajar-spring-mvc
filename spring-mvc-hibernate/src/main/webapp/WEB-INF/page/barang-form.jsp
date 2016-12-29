<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Form Barang</title>
        <link href="<c:url value='/static/css/bootstrap.min.css' />" rel="stylesheet" />
        <link href="<c:url value='/static/css/bootstrap-theme.min.css' />" rel="stylesheet" />
    </head>
    <body>
        <div class="container">
            <h1>Form Barang</h1>
            <spring:url value="/barang/add" var="save" />
            <form:form class="form-horizontal" method="post" modelAttribute="barang" action="${save}">
                <form:hidden path="id" />

                <spring:bind path="kodeBrg">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <label class="col-sm-2 control-label">Kode Barang</label>
                        <div class="col-sm-10">
                            <form:input path="kodeBrg" type="text" class="form-control" id="kodeBrg" placeholder="Kode Barang" />
                            <form:errors path="kodeBrg" class="control-label" />
                        </div>
                    </div>
                </spring:bind>

                <spring:bind path="namaBrg">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <label class="col-sm-2 control-label">Nama Barang</label>
                        <div class="col-sm-10">
                            <form:input path="namaBrg" type="text" class="form-control" id="namaBrg" placeholder="Nama Barang" />
                            <form:errors path="namaBrg" class="control-label" />
                        </div>
                    </div>
                </spring:bind>

                <spring:bind path="kategori">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <label class="col-sm-2 control-label">Kategori</label>
                        <div class="col-sm-10">
                            <form:input path="kategori" type="text" class="form-control" id="kategori" placeholder="Kategori Barang" />
                            <form:errors path="kategori" class="control-label" />
                        </div>
                    </div>
                </spring:bind>

                <spring:bind path="harga">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <label class="col-sm-2 control-label">Harga Barang</label>
                        <div class="col-sm-10">
                            <form:input path="harga" type="text" class="form-control" id="harga" placeholder="Harga Barang" />
                            <form:errors path="harga" class="control-label" />
                        </div>
                    </div>
                </spring:bind>

                <spring:bind path="stok">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <label class="col-sm-2 control-label">Stok Barang</label>
                        <div class="col-sm-10">
                            <form:input path="stok" type="text" class="form-control" id="stok" placeholder="Stok Barang" />
                            <form:errors path="stok" class="control-label" />
                        </div>
                    </div>
                </spring:bind>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-primary">Add Barang</button>
                    </div>
                </div>

            </form:form>
        </div>

        <script src="<c:url value='/static/js/jquery-2.1.4.min.js' />"></script>
        <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
    </body>
</html>
