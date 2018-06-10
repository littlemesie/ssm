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

<rapid:override name="recruit">
    <li class="treeview active">
        <a href="#">
            <i class="fa fa-clipboard"></i><span>招聘求职</span>
            <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
        </a>
        <ul class="treeview-menu">
            <li class="active"><a href="${pageContext.request.contextPath}/index/showRecruitinfo"><i class="fa fa-columns"></i>招聘信息</a></li>
            <li><a href="${pageContext.request.contextPath}/job/showJob"><i class="fa fa-file-text-o"></i>求职信息</a></li>
            <li><a href="${pageContext.request.contextPath}/job/showResume"><i class="fa fa-list-alt"></i>个人简历</a></li>
        </ul>
    </li>
</rapid:override>
<rapid:override name="content">
    <div class="content-wrapper" id="pjax-container">
        <section class="content-header">
            <h1>招聘求职</h1>
            <ol class="breadcrumb">
                <a class="active" href="${pageContext.request.contextPath}/index/showRecruitinfo"><i class="fa fa-clipboard"></i> 招聘求职</a>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="nav-tabs-custom">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#tab1" data-toggle="tab">招聘信息</a></li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tab1">
                                <div class="box box-primary">
                                    <div class="box-body table-responsive">
                                        <table class="table table-bordered table-hover">
                                            <tr>
                                                <th>类型</th>
                                                <th>企业</th>
                                                <th>标题</th>
                                                <th>工作城市</th>
                                                <th>起薪</th>
                                                <th>操作</th>
                                            </tr>
                                            <c:forEach items="${recruits}" var="recruit">
                                                <tr>
                                                    <td>
                                                        <c:if test="${recruit.type eq 1}">
                                                            实习招聘
                                                        </c:if>
                                                        <c:if test="${recruit.type eq 2}">
                                                            就业招聘
                                                        </c:if>
                                                    </td>
                                                    <td>${recruit.company.companyName}</td>
                                                    <td>${recruit.jobcontent}</td>
                                                    <td>${recruit.workingcity}</td>
                                                    <td>${recruit.salaryllimit}</td>
                                                    <td><button type="button" class="btn btn-sm" onclick="window.location.href='${pageContext.request.contextPath}/index/showRecrDetail?&id=${recruit.id}'">查看</button>
                                                        <button class="btn btn-primary btn-sm" type="button" onclick="window.location.href='${pageContext.request.contextPath}/job/selectRes?&id=${recruit.id}&comid=${recruit.company.id}'">应聘</button>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </table>
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
<%@include file="../public/base.jsp"%>
