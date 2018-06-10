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
                    <form class="form-horizontal" method="POST" action="" onsubmit="return false" >
                        <div class="nav-tabs-custom">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#tab1" data-toggle="tab">查看就业详情</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tab1">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">单位全称</label>
                                        <div class="col-sm-3"><input class="form-control" value="${company.company_name}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">地址</label>
                                        <div class="col-sm-4"><input class="form-control" value="${company.addr}" ></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">网址</label>
                                        <div class="col-sm-4"><input class="form-control" value="${company.url}"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">联系人</label>
                                        <div class="col-sm-2"><input class="form-control" value="${company.contactor}" ></div>
                                        <label class="col-sm-2 control-label">电话</label>
                                        <div class="col-sm-3"><input class="form-control" value="${company.phone}" ></div>
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <div class="col-sm-2"></div>
                                <div class="btn-group pull-left">
                                    <button type="button" onclick="window.location.href='${pageContext.request.contextPath}/internship/showEmploy'" class="btn btn-warning pull-right">返回</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </div>
</rapid:override>
<%@include file="../public/base.jsp"%>