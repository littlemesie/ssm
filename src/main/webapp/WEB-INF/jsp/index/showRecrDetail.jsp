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
        <a href="${pageContext.request.contextPath}/index/index">
            <i class="fa fa-user-circle"></i><span>后台首页</span>
        </a>
    </li>
</rapid:override>
<rapid:override name="content">
    <div class="content-wrapper" id="pjax-container">
        <section class="content-header">
            <h1>招聘信息</h1>
            <ol class="breadcrumb">
                <li class="active"><i class="fa fa-columns"></i> <a href="${pageContext.request.contextPath}/index/showRecruitinfo">招聘信息</a></li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <form class="form-horizontal" method="POST" action="" onsubmit="return false" >
                        <div class="nav-tabs-custom">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#tab1" data-toggle="tab">${recruit.get(0).title}</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tab1">
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label" style="width: 110px">招聘标题</label>
                                        <div class="col-sm-3"><input class="form-control" value="${recruit.get(0).title}" readonly="readonly"></div>
                                        <label class="col-sm-1 control-label" style="width: 110px">工作类型</label>
                                        <div class="col-sm-3">
                                            <c:if test="${recruit.get(0).type eq 1}">
                                                <input class="form-control" value="实习招聘" readonly="readonly">
                                            </c:if>
                                            <c:if test="${recruit.get(0).type eq 2}">
                                                <input class="form-control" value="就业招聘" readonly="readonly">
                                            </c:if>

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label" style="width: 110px">工作城市</label>
                                        <div class="col-sm-3"><input class="form-control" value="${recruit.get(0).workingcity}" readonly="readonly"></div>
                                        <label class="col-sm-1 control-label" style="width: 110px">用人单位</label>
                                        <div class="col-sm-3"><input class="form-control" value="${recruit.get(0).company.companyName}" readonly="readonly"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label" style="width: 110px">招聘人数</label>
                                        <div class="col-sm-3"><input class="form-control" value="${recruit.get(0).recruitnum}" readonly="readonly"></div>
                                        <label class="col-sm-1 control-label">起薪</label>
                                        <div class="col-sm-3"><input class="form-control" value="${recruit.get(0).salaryllimit}" readonly="readonly"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label" style="width: 110px">工作内容</label>
                                        <div class="col-sm-3"><textarea rows="10"  cols="40" readonly="readonly">${recruit.get(0).jobcontent}</textarea></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label" style="width: 110px">联系人</label>
                                        <div class="col-sm-2"><input class="form-control" value="${recruit.get(0).contactperson}" readonly="readonly"></div>
                                        <label class="col-sm-1 control-label" style="width: 110px">手机号</label>
                                        <div class="col-sm-2"><input class="form-control" value="${recruit.get(0).phone}" readonly="readonly"></div>
                                        <label class="col-sm-1 control-label" style="width: 110px">邮箱</label>
                                        <div class="col-sm-3"><input class="form-control" value="${recruit.get(0).email}" readonly="readonly"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label" style="width: 110px">发布日期</label>
                                        <div class="col-sm-2"><input class="form-control" value="${recruit.get(0).publishdate}" readonly="readonly"></div>
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
