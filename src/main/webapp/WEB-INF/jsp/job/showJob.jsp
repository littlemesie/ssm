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
            <li><a href="${pageContext.request.contextPath}/index/showRecruitinfo"><i class="fa fa-columns"></i>招聘信息</a></li>
            <li class="active"><a href="${pageContext.request.contextPath}/job/showJob"><i class="fa fa-file-text-o"></i>求职信息</a></li>
            <li><a href="${pageContext.request.contextPath}/job/showResume"><i class="fa fa-list-alt"></i>个人简历</a></li>
        </ul>
    </li>
</rapid:override>
<rapid:override name="content">
    <div class="content-wrapper">
        <section class="content-header">
            <h1>招聘求职</h1>
            <ol class="breadcrumb">
                <li class="active"><i class="fa fa-clipboard"></i> 招聘求职</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="nav-tabs-custom">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#tab1" data-toggle="tab">求职信息</a></li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tab1">
                                <div class="box box-primary">
                                    <div class="box-body table-responsive">
                                        <table class="table table-bordered table-hover">
                                            <tr>
                                                <th>用人单位</th>
                                                <th>岗位</th>
                                                <th>状态</th>
                                                <th>操作</th>
                                            </tr>
                                            <c:forEach items="${jobapplyList}" var="job">
                                                <tr>
                                                    <td>${job.company.companyName}</td>
                                                    <td>${job.recruit.title}</td>
                                                    <td>
                                                        <c:if test="${job.status eq 1}">
                                                            <span class="label label-warning radius" style="line-height: 30px">投递中</span>
                                                        </c:if>
                                                        <c:if test="${job.status eq 2}">
                                                            <span class="label label-danger radius" style="line-height: 30px">被拒绝</span>
                                                        </c:if>
                                                        <c:if test="${job.status eq 3}">
                                                            <span class="label label-success radius" style="line-height: 30px">已录用</span>
                                                        </c:if>
                                                    </td>
                                                    <td><button type="button" class="btn btn-sm" onclick="window.location.href='${pageContext.request.contextPath}/index/showRecrDetail?id=${job.recruitid}'">查看</button>
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
