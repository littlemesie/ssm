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

<rapid:override name="index">
    <li class="active">
        <a href="${pageContext.request.contextPath}/index/showNews">
            <i class="fa fa-bullhorn"></i><span>学校通知</span>
        </a>
    </li>
</rapid:override>
<rapid:override name="content">
    <div class="content-wrapper">
        <section class="content-header">
            <h1>学校通知</h1>
            <ol class="breadcrumb">
                <li class="active"><i class="fa fa-bullhorn"></i> <a href="${pageContext.request.contextPath}/index/showNews">学校通知</a></li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <form class="form-horizontal" method="POST" action="" onsubmit="return false" >
                        <div class="nav-tabs-custom">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#tab1" data-toggle="tab">招聘管理员</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tab1">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">通知标题</label>
                                        <div class="col-sm-3"><input class="form-control" value="${news.title}" readonly="readonly"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" >通知内容</label>
                                        <div class="col-sm-3"><textarea rows="10"  cols="40" readonly="readonly">${news.content}</textarea></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">通知来源</label>
                                        <div class="col-sm-3"><input class="form-control" value="${news.source}" readonly="readonly"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">通知日期</label>
                                        <div class="col-sm-3"><input class="form-control" value="${news.publishdate}" readonly="readonly"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">发布人</label>
                                        <div class="col-sm-2"><input class="form-control" value="${news.composername}" readonly="readonly"></div>
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
<%@include file="../public/base.jsp"%>