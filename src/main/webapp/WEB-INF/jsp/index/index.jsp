<%--
  Created by IntelliJ IDEA.
  User: vivi
  Date: 2018/3/15
  Time: 20:02
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
    <div class="content-wrapper">
        <section class="content-header">
            <h1>学校通知</h1>
            <ol class="breadcrumb">
                <a href="${pageContext.request.contextPath}/index/showNews"><li class="active">更多</li></a>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="box box-primary">
                        <div class="box-body table-responsive">
                            <table class="table table-bordered table-hover">
                                <tr>
                                    <th>通知标题</th>
                                    <th>通知来源</th>
                                    <th>通知时间</th>
                                </tr>
                                <c:forEach items="${news}" var="n">
                                    <tr>
                                        <td><a href="${pageContext.request.contextPath}/index/showNewsDetail?id=${n.id}">${n.title}</a></td>
                                        <td>${n.source}</td>
                                        <td>${n.publishdate}</td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="content-header">
            <h1>招聘信息</h1>
            <ol class="breadcrumb">
                <a href="${pageContext.request.contextPath}/index/showRecruitinfo?active=3"><li class="active">更多</li></a>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="box box-primary">
                        <div class="box-body table-responsive">
                            <table class="table table-bordered table-hover">
                                <tr>
                                    <th>工作标题</th>
                                    <th>企业名称</th>
                                    <th>发布时间</th>
                                </tr>
                                <c:forEach items="${recruits}" var="recruit">
                                    <tr>
                                        <td><a href="${pageContext.request.contextPath}/index/showRecrDetail?active=3&id=${recruit.id}">${recruit.title}</a></td>
                                        <td>${recruit.company.companyName}</td>
                                        <td>${recruit.publishdate}</td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</rapid:override>
<rapid:override name="js">
    <script src="https://cdn.jsdelivr.net/npm/vue"></script>
</rapid:override>
<%@include file="../public/base.jsp"%>
