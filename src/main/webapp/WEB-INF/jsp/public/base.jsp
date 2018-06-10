<%--
  Created by IntelliJ IDEA.
  User: mesie
  Date: 2018/6/2
  Time: 11:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<%--头部--%>
<%@include file="header.jsp"%>
<%--css--%>
<rapid:block name="css"></rapid:block>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <%--顶部--%>
    <%@include file="top.jsp"%>

    <%--左边导航栏--%>
    <aside class="main-sidebar">
        <section class="sidebar">
            <form action="#" method="get" class="sidebar-form">
                <div class="input-group">
                    <input type="text" name="q" class="form-control" placeholder="搜索">
                    <span class="input-group-btn">
                        <button type="submit" name="search" id="search-btn" class="btn btn-flat">
                            <i class=" fa fa-search"></i>
                        </button>
                    </span>
                </div>
            </form>
            <ul class="sidebar-menu" data-widget="tree">
                <li class="header">菜单</li>

                <%--首页--%>
                <rapid:block name="index">
                    <li>
                        <a href="${pageContext.request.contextPath}/index/index">
                            <i class="fa fa-user-circle"></i><span>后台首页</span>
                        </a>
                    </li>
                </rapid:block>
                <%--信息管理--%>
                <rapid:block name="manage">
                    <li class="treeview">
                        <a href="#">
                            <i class="fa fa-file-text"></i><span>信息管理</span>
                            <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                        </a>
                        <ul class="treeview-menu" >
                            <li><a href="${pageContext.request.contextPath}/stud/showStuInfo"><i class="fa fa-columns"></i>个人信息</a></li>
                            <li><a href="${pageContext.request.contextPath}/stud/showSelfIntro"><i class="fa fa-file-text-o"></i>自我介绍</a></li>
                            <li><a href="${pageContext.request.contextPath}/stud/modifyPwd"><i class="fa fa-edit"></i>修改密码</a></li>
                            <li><a href="${pageContext.request.contextPath}/com/showCom"><i class="fa fa-file-text"></i>用人单位</a></li>
                        </ul>
                    </li>
                </rapid:block>

                <%--实习就业--%>
                <rapid:block name="internship">
                    <li class="treeview">
                        <a href="#">
                            <i class="fa fa-floppy-o"></i><span>实习就业</span>
                            <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="${pageContext.request.contextPath}/internship/showInternship"><i class="fa fa-columns"></i>实习详情</a></li>
                            <li><a href="${pageContext.request.contextPath}/internship/showInterLog"><i class="fa fa-file-text-o"></i>实习日志</a></li>
                            <li><a href="${pageContext.request.contextPath}/internship/showEmploy"><i class="fa fa-list-alt"></i>就业详情</a></li>
                        </ul>
                    </li>
                </rapid:block>

                <%--招聘求职--%>
                <rapid:block name="recruit">
                    <li class="treeview">
                        <a href="#">
                            <i class="fa fa-clipboard"></i><span>招聘求职</span>
                            <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="${pageContext.request.contextPath}/index/showRecruitinfo"><i class="fa fa-columns"></i>招聘信息</a></li>
                            <li><a href="${pageContext.request.contextPath}/job/showJob"><i class="fa fa-file-text-o"></i>求职信息</a></li>
                            <li><a href="${pageContext.request.contextPath}/job/showResume"><i class="fa fa-list-alt"></i>个人简历</a></li>
                        </ul>
                    </li>
                </rapid:block>

                <%--学校通知--%>
                <rapid:block name="news">
                    <li><a href="${pageContext.request.contextPath}/index/showNews"><i class="fa fa-bullhorn"></i><span>学校通知</span></a></li>
                </rapid:block>


            </ul>
        </section>
    </aside>

    <%--内容--%>
    <rapid:block name="content"></rapid:block>
</div>
<%--底部--%>
<%@include file="footer.jsp"%>
<rapid:block name="js"></rapid:block>
</body>
</html>
