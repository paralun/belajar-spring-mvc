<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>User Form</title>
        <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/resources/css/bootstrap-theme.min.css" rel="stylesheet" />
    </head>
    <body>
        <div class="container">
            <div class="panel panel-primary">
                <div class="panel-heading"><span class="lead">User Registration Form</span></div>
                <div class="panel-body">
                    <form:form method="post" modelAttribute="userForm" action="${pageContext.request.contextPath}/users">
                        <form:hidden path="id" />
                        
                        <spring:bind path="name">
                            <div class="form-group ${status.error ? 'has-error' : ''}">
                                <label class="col-sm-2 control-label">Name</label>
                                <div class="col-sm-10">
                                    <form:input path="name" type="text" class="form-control " id="name" placeholder="Name" />
                                    <form:errors path="name" class="control-label" />
                                </div>
                            </div>
                        </spring:bind>
                        
                        <spring:bind path="email">
                            <div class="form-group ${status.error ? 'has-error' : ''}">
                                <label class="col-sm-2 control-label">Email</label>
                                <div class="col-sm-10">
                                    <form:input path="email" class="form-control " id="email" placeholder="Email" />
                                    <form:errors path="email" class="control-label" />
                                </div>
                            </div>
                        </spring:bind>
                        
                        <spring:bind path="password">
                            <div class="form-group ${status.error ? 'has-error' : ''}">
                                <label class="col-sm-2 control-label">Password</label>
                                <div class="col-sm-10">
                                    <form:password path="password" class="form-control " id="password" placeholder="Password" />
                                    <form:errors path="password" class="control-label" />
                                </div>
                            </div>
                        </spring:bind>
                        
                        <spring:bind path="confirmPassword">
                            <div class="form-group ${status.error ? 'has-error' : ''}">
                                <label class="col-sm-2 control-label">Confirm Password</label>
                                <div class="col-sm-10">
                                    <form:password path="confirmPassword" class="form-control " id="confirmPassword" placeholder="Password" />
                                    <form:errors path="confirmPassword" class="control-label" />
                                </div>
                            </div>
                        </spring:bind>
                        
                        <spring:bind path="address">
                            <div class="form-group ${status.error ? 'has-error' : ''}">
                                <label class="col-sm-2 control-label">Confirm Password</label>
                                <div class="col-sm-10">
                                    <form:textarea path="address" rows="5" class="form-control " id="address" placeholder="Address" />
                                    <form:errors path="address" class="control-label" />
                                </div>
                            </div>
                        </spring:bind>
                        
                        <spring:bind path="newsletter">
                            <div class="form-group ${status.error ? 'has-error' : ''}">
                                <label class="col-sm-2 control-label">Newsletter</label>
                                <div class="col-sm-10">
                                    <div class="checkbox">
                                        <label><form:checkbox path="newsletter" id="newsletter" /></label>
                                        <form:errors path="newsletter" class="control-label" />
                                    </div>
                                </div>
                            </div>
                        </spring:bind>
                        
                        <spring:bind path="framework">
                            <div class="form-group ${status.error ? 'has-error' : ''}">
                                <label class="col-sm-2 control-label">Web Frameworks</label>
                                <div class="col-sm-10">
                                    <form:checkboxes path="framework" items="${frameworkList}" element="label class='checkbox-inline'" id="framework" />
                                    <br />
                                    <form:errors path="framework" class="control-label" />
                                </div>
                            </div>
                        </spring:bind>
                        
                        <spring:bind path="sex">
                            <div class="form-group ${status.error ? 'has-error' : ''}">
                                <label class="col-sm-2 control-label">Sex</label>
                                <div class="col-sm-10">
                                    <label class="radio-inline"><form:radiobutton path="sex" value="M" /> Male </label>
                                    <label class="radio-inline"><form:radiobutton path="sex" value="F" /> Female </label>
                                    <br />
                                    <form:errors path="sex" class="control-label" />
                                </div>
                            </div>
                        </spring:bind>
                        
                        <spring:bind path="number">
                            <div class="form-group ${status.error ? 'has-error' : ''}">
                                <label class="col-sm-2 control-label">Number</label>
                                <div class="col-sm-10">
                                    <form:radiobuttons path="number" items="${numberList}" element="label class='radio-inline'" />
                                    <br />
                                    <form:errors path="number" class="control-label" />
                                </div>
                            </div>
                        </spring:bind>
                        
                        <spring:bind path="country">
                            <div class="form-group ${status.error ? 'has-error' : ''}">
                                <label class="col-sm-2 control-label">Country</label>
                                <div class="col-sm-5">
                                    <form:select path="country" class="form-control">
                                        <form:option value="NONE" label="--- Select ---" />
                                        <form:options items="${countryList}" />
                                    </form:select>
                                    <form:errors path="country" class="control-label" />
                                </div>
                                <div class="col-sm-5"></div>
                            </div>
                        </spring:bind>
                        
                        <spring:bind path="skill">
                            <div class="form-group ${status.error ? 'has-error' : ''}">
                                <label class="col-sm-2 control-label">Java Skills</label>
                                <div class="col-sm-5">
                                    <form:select path="skill" items="${javaSkillList}" multiple="true" size="5" class="form-control" />
                                    <form:errors path="skill" class="control-label" />
                                </div>
                                <div class="col-sm-5"></div>
                            </div>
                        </spring:bind>
                        
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <c:choose>
                                    <c:when test="${userForm['new']}">
                                        <button type="submit" class="btn btn-primary">Add</button>
                                    </c:when>
                                    <c:otherwise>
                                        <button type="submit" class="btn btn-primary">Update</button>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        
                    </form:form>
                </div>
            </div>
        </div>
        
        <script src="${pageContext.request.contextPath}/resources/js/jquery-2.1.4.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    </body>
</html>
