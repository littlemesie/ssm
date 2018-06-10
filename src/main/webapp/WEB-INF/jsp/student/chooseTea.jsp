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

<rapid:override name="manage">
    <li class="treeview active">
        <a href="#">
            <i class="fa fa-file-text"></i><span>信息管理</span>
            <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
        </a>
        <ul class="treeview-menu" >
            <li class="active"><a href="${pageContext.request.contextPath}/stud/showStuInfo"><i class="fa fa-columns"></i>个人信息</a></li>
            <li><a href="${pageContext.request.contextPath}/stud/showSelfIntro"><i class="fa fa-file-text-o"></i>自我介绍</a></li>
            <li><a href="${pageContext.request.contextPath}/stud/modifyPwd"><i class="fa fa-edit"></i>修改密码</a></li>
            <li><a href="${pageContext.request.contextPath}/com/showCom"><i class="fa fa-file-text"></i>用人单位</a></li>
        </ul>
    </li>
</rapid:override>
<rapid:override name="content">
    <div class="content-wrapper">
        <section class="content-header">
            <h1>教师列表</h1>
            <ol class="breadcrumb">
                <li class="active"><i class="fa fa-user-circle"></i> 教师列表</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="box box-primary">
                        <div class="box-body table-responsive">
                            <table class="table table-bordered table-hover" id="example-1">
                                <tr>
                                    <th>教师姓名</th>
                                    <th>所属院系</th>
                                    <th>邮箱</th>
                                    <th>手机</th>
                                    <th>qq</th>
                                    <th>微信</th>
                                    <th>操作</th>
                                </tr>
                                <c:forEach items="${teachers}" var="teacher">
                                    <tr>
                                        <td>${teacher.teaname}</td>
                                        <td>${teacher.institution.name} ${teacher.department.name}</td>
                                        <td>${teacher.email}</td>
                                        <td>${teacher.mobilephone}</td>
                                        <td>${teacher.qq}</td>
                                        <td>${teacher.wechat}</td>
                                        <td><button type="button" class="btn btn-primary btn-sm" onclick="window.location.href='${pageContext.request.contextPath}/stud/modifyPapeState?teatype=${teatype}'">申请</button></td>
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
<%@include file="../public/base.jsp"%>
