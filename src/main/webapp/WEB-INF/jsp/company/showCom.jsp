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
            <i class="fa fa-file-text"></i><span>信息管理</span>
            <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
        </a>
        <ul class="treeview-menu" >
            <li><a href="${pageContext.request.contextPath}/stud/showStuInfo"><i class="fa fa-columns"></i>个人信息</a></li>
            <li><a href="${pageContext.request.contextPath}/stud/showSelfIntro"><i class="fa fa-file-text-o"></i>自我介绍</a></li>
            <li><a href="${pageContext.request.contextPath}/stud/modifyPwd"><i class="fa fa-edit"></i>修改密码</a></li>
            <li class="active"><a href="${pageContext.request.contextPath}/com/showCom"><i class="fa fa-file-text"></i>用人单位</a></li>
        </ul>
    </li>
</rapid:override>
<rapid:override name="content">
    <div class="content-wrapper">
        <section class="content-header">
            <h1>信息管理</h1>
            <ol class="breadcrumb">
                <li class="active"><i class="fa fa-file-text"></i> 信息管理</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="nav-tabs-custom">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#tab1" data-toggle="tab">用人单位</a></li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tab1">
                                <div class="box box-primary">
                                    <div class="box-body table-responsive">
                                        <table class="table table-bordered table-hover">
                                            <tr>
                                                <th>企业名称</th>
                                                <th>网址</th>
                                                <th>状态</th>
                                                <th>操作</th>
                                            </tr>

                                            <c:forEach items="${companys}" var="company">
                                                <tr>
                                                    <td>${company.companyName}</td>
                                                    <td><a href="${company.url}">${company.url}</a></td>
                                                    <td>
                                                        <c:if test="${company.state eq 1}">
                                                            <span class="label label-warning radius" style="line-height: 30px">待审核</span>
                                                        </c:if>
                                                        <c:if test="${company.state eq 2}">
                                                            <span class="label label-success radius" style="line-height: 30px">通过</span>
                                                        </c:if>
                                                        <c:if test="${company.state eq 3}">
                                                            <span class="label label-danger radius" style="line-height: 30px">不通过</span>
                                                        </c:if>
                                                    </td>
                                                    <td><button type="button" class="btn btn-sm" onclick="window.location.href='${pageContext.request.contextPath}/com/showComDetail?id=${company.id}'">查看</button>
                                                        <button type="button" class="btn btn-primary btn-sm" onclick="window.location.href='${pageContext.request.contextPath}/com/showEval?id=${company.id}'">评价</button>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <div class="col-sm-1">
                                    <div class="btn-group pull-left">
                                        <button type="button" class="btn btn-info pull-right" onclick="window.location.href='${pageContext.request.contextPath}/com/addCom'">添加</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    </div>
</rapid:override>
<%@include file="../public/base.jsp"%>