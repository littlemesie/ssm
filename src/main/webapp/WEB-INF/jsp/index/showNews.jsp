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

<rapid:override name="news">
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
                <a class="active" href="${pageContext.request.contextPath}/index/showNews"><i class="fa fa-clipboard"></i> 学校通知</a>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="nav-tabs-custom">
                        <div class="tab-content">
                            <div class="tab-pane active" id="tab1">
                                <div class="box box-primary">
                                    <div class="box-body table-responsive">
                                        <table class="table table-bordered table-hover">
                                            <tr>
                                                <th>通知标题</th>
                                                <th>通知来源</th>
                                                <th>发布时间</th>
                                                <th>操作</th>
                                            </tr>
                                            <c:forEach items="${news}" var="n">
                                                <tr>
                                                    <td>${n.title}</td>
                                                    <td>${n.source}</td>
                                                    <td>${n.publishdate}</td>
                                                    <td><a type="button" class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/index/showNewsDetail?id=${n.id}">查看</a></td>
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