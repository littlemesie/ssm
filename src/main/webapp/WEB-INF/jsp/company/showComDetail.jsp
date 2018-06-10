<%--
  Created by IntelliJ IDEA.
  User: vivi
  Date: 2018/3/17
  Time: 14:32
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
                <a class="active" href="${pageContext.request.contextPath}/com/showCom"><i class="fa fa-file-text"></i> 信息管理</a>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <form class="form-horizontal" method="POST" action="" onsubmit="return false" >
                        <div class="nav-tabs-custom">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#tab1" data-toggle="tab">查看用人单位</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tab1">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">单位全称</label>
                                        <div class="col-sm-3"><input class="form-control" value="${company.company_name}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">地址</label>
                                        <div class="col-sm-4"><input class="form-control" value="${company.addr}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">网址</label>
                                        <div class="col-sm-4"><input class="form-control" value="${company.url}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">联系人</label>
                                        <div class="col-sm-2"><input class="form-control" value="${company.contactor}"></div>
                                        <label class="col-sm-2 control-label">电话</label>
                                        <div class="col-sm-3"><input class="form-control" value="${company.phone}"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </div>
</rapid:override>
<rapid:block name="js"></rapid:block>
<%@include file="../public/base.jsp"%>