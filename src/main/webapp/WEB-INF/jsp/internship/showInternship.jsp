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

<rapid:override name="internship">
    <li class="treeview active">
        <a href="#">
            <i class="fa fa-floppy-o"></i><span>实习就业</span>
            <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
        </a>
        <ul class="treeview-menu">
            <li class="active"><a href="${pageContext.request.contextPath}/internship/showInternship"><i class="fa fa-columns"></i>实习详情</a></li>
            <li><a href="${pageContext.request.contextPath}/internship/showInterLog"><i class="fa fa-file-text-o"></i>实习日志</a></li>
            <li><a href="${pageContext.request.contextPath}/internship/showEmploy"><i class="fa fa-list-alt"></i>就业详情</a></li>
        </ul>
    </li>
</rapid:override>
<rapid:override name="content">
    <div class="content-wrapper">
        <section class="content-header">
            <h1>实习就业</h1>
            <ol class="breadcrumb">
                <li class="active"><i class="fa fa-floppy-o"></i> 实习就业</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="nav-tabs-custom">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#tab1" data-toggle="tab">实习详情</a></li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tab1">
                                <div class="box box-primary">
                                    <div class="box-body table-responsive">
                                        <table class="table table-bordered table-hover">
                                            <tr>
                                                <th>实习单位</th>
                                                <th>实习开始时间</th>
                                                <th>实习结束时间</th>
                                                <th>审核状态</th>
                                                <th>操作</th>
                                            </tr>
                                            <c:forEach items="${internships}" var="in">
                                                <tr>
                                                    <td>${in.company.companyName}</td>
                                                    <td>${in.starttime}</td>
                                                    <td>${in.endtime}</td>
                                                    <td>
                                                        <c:if test="${in.state eq 1}">
                                                            <span class="label label-warning radius" style="line-height: 30px">待审核</span>
                                                        </c:if>
                                                        <c:if test="${in.state eq 2}">
                                                            <span class="label label-success radius" style="line-height: 30px">通过</span>
                                                        </c:if>
                                                        <c:if test="${in.state eq 3}">
                                                            <span class="label label-danger radius" style="line-height: 30px">不通过</span>
                                                        </c:if>
                                                        <c:if test="${in.state eq 4}">
                                                            <span class="label label-danger radius" style="line-height: 30px;background-color: #D3D3D3">过期</span>
                                                        </c:if>
                                                    </td>
                                                    <td><button type="button" class="btn" onclick="window.location.href='/internship/showInterShipDetail?id=${in.id}'">查看</button>
                                                        <c:if test="${student.state eq 2 and in.state eq 2}">
                                                            <button type="button" class="btn btn-info" name="${in.id}" id="change">申请变更</button>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <div class="col-sm-1">
                                    <div class="btn-group pull-left">
                                        <c:if test="${student.advisestate eq 2 && (student.state eq 0 || student.state eq 1)}">
                                            <button type="button" class="btn btn-info pull-right" id="add">实习申请</button>
                                        </c:if>
                                        <c:if test="${student.advisestate eq 0}">
                                            <button type="button" class="btn btn-info pull-right" disabled>没有导师</button>
                                        </c:if>
                                        <c:if test="${student.advisestate eq 1}">
                                            <button type="button" class="btn btn-info pull-right" disabled>导师申请中</button>
                                        </c:if>
                                        <c:if test="${student.state eq 3 || student.state eq 4}">
                                            <button type="button" class="btn btn-info pull-right" disabled>暂不能申请</button>
                                        </c:if>
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
<rapid:override name="js">
    <script>

        $('#add').click(function () {

            window.location.href='${pageContext.request.contextPath}/internship/addIntern'
        });
        $('#change').click(function () {
            layer.confirm('是否确认申请变更', {
                btn: ['取消','确认']
            }, function(){
                layer.msg('暂时不修改', {icon: 2});
            }, function(){
                $.ajax({
                    url:'/internship/changeShip.do',
                    type:'post',
                    data:{'id':$('#change').attr('name')},
                    success:function(data){
                        if(data['msg'] == "succ"){
                            window.location.href="${pageContext.request.contextPath}/internship/showInternship"
                        }else {
                            layer.msg("变更失败！");
                        }
                    }

                });
            });
        });
    </script>
</rapid:override>
<%@include file="../public/base.jsp"%>
