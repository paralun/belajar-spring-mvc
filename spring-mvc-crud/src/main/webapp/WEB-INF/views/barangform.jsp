<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Form Barang</title>
        <spring:url var="bootstrap" value="/resources/core/css/bootstrap.min.css" />
        <spring:url var="theme" value="/resources/core/css/bootstrap-theme.min.css" />
        <link href="${bootstrap}" rel="stylesheet" />
        <link href="${theme}" rel="stylesheet" />
    </head>
    <body>
        <spring:url value="/barang" var="save" />
        <div class="container">
            <h1>Form Barang</h1>
            
            <form:form class="form-horizontal" method="post" modelAttribute="barang" action="${save}">
                <spring:bind path="kode">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Kode</label>
                        <div class="col-sm-10">
                            <form:input path="kode" type="text" class="form-control" id="kode" placeholder="Kode Barang" />
                        </div>
                    </div>
                </spring:bind>
                
                <spring:bind path="nama">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Nama</label>
                        <div class="col-sm-10">
                            <form:input path="nama" type="text" class="form-control" id="nama" placeholder="Nama Barang" />
                        </div>
                    </div>
                </spring:bind>
                
                <spring:bind path="kategori">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Kategori</label>
                        <div class="col-sm-10">
                            <form:input path="kategori" type="text" class="form-control" id="kategori" placeholder="Kategori" />
                        </div>
                    </div>
                </spring:bind>
                
                <spring:bind path="harga">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Harga</label>
                        <div class="col-sm-10">
                            <form:input path="harga" type="text" class="form-control" id="harga" placeholder="Harga Barang" />
                        </div>
                    </div>
                </spring:bind>
                
                <spring:bind path="stok">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Stok</label>
                        <div class="col-sm-10">
                            <form:input path="stok" type="text" class="form-control" id="stok" placeholder="Stok Barang" />
                        </div>
                    </div>
                </spring:bind>
                
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn-lg btn-primary pull-right">Add</button>
                    </div>
                </div>
            </form:form>
        </div>
        
        <spring:url var="jquery" value="/resources/core/js/jquery-2.1.4.min.js" />
        <spring:url var="bootstrapJs" value="/resources/core/js/bootstrap.min.js" />
        <script src="${jquery}"></script>
        <script src="${bootstrapJs}"></script>
    </body>
</html>
