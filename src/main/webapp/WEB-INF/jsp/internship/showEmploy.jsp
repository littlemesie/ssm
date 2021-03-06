<%--
  Created by IntelliJ IDEA.
  User: vivi
  Date: 2018/3/17
  Time: 16:44
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<%@ page contentType="text/html;charset=UTF-8" import="java.util.*" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<rapid:override name="internship">
    <li class="treeview active">
        <a href="#">
            <i class="fa fa-floppy-o"></i><span>实习就业</span>
            <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
        </a>
        <ul class="treeview-menu">
            <li><a href="${pageContext.request.contextPath}/internship/showInternship"><i class="fa fa-columns"></i>实习详情</a></li>
            <li><a href="${pageContext.request.contextPath}/internship/showInterLog"><i class="fa fa-file-text-o"></i>实习日志</a></li>
            <li class="active"><a href="${pageContext.request.contextPath}/internship/showEmploy"><i class="fa fa-list-alt"></i>就业详情</a></li>
        </ul>
    </li>
</rapid:override>
<rapid:override name="content">
    <div class="content-wrapper" id="pjax-container">
        <section class="content-header">
            <h1>实习就业</h1>
            <ol class="breadcrumb">
                <li class="active"><i class="fa fa-floppy-o"></i> 实习就业</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="nav-tabs-custom">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#tab1" data-toggle="tab">就业详情</a></li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tab1">
                                <div class="box box-primary">
                                    <div class="box-body table-responsive">
                                        <table class="table table-bordered table-hover">
                                            <tr>
                                                <th>就业单位</th>
                                                <th>三方签订时间</th>
                                                <th>状态</th>
                                                <th>操作</th>
                                            </tr>
                                            <c:forEach items="${employments}" var="emp">
                                                <tr>
                                                    <td>${emp.company.companyName}</td>
                                                    <td>${emp.signdate}</td>
                                                    <td>
                                                        <c:if test="${emp.valid eq 1}">
                                                            <span class="label label-success radius" style="line-height: 30px">有效</span>
                                                        </c:if>
                                                        <c:if test="${emp.valid eq 2}">
                                                            <span class="label label-danger radius" style="line-height: 30px">无效</span>
                                                        </c:if>
                                                    </td>
                                                    <td><button type="button" class="btn" onclick="window.location.href='${pageContext.request.contextPath}/internship/showEmployDetail?active=2&id=${emp.company.id}'">查看</button></td>
                                                </tr>
                                            </c:forEach>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <div class="col-sm-1">
                                    <div class="btn-group pull-left">
                                        <button type="button" class="btn btn-info pull-right" onclick="window.location.href='${pageContext.request.contextPath}/internship/addEmploy'">添加就业</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</rapid:override>
<rapid:override name="js">
    <script>

        $('#look').click(function () {
            window.location.href='${pageContext.request.contextPath}/stu/lookEmploy'
        });

    </script>
</rapid:override>
<%@include file="../public/base.jsp"%>
