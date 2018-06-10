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
                    <form class="form-horizontal" method="POST" action="" id="recruit_from">
                        <div class="nav-tabs-custom">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#tab1" data-toggle="tab">实习申请</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tab1">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">用人单位</label>
                                        <div class="col-sm-3">
                                            <select style="width: 240px;height: 32px" id="com_name" name="comid">
                                                <option value="">==请选择用人单位==</option>
                                                <c:forEach items="${companies}" var="com">
                                                    <c:if test="${com.state eq 2}">
                                                        <option value="${com.id}">${com.companyName}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">实习岗位</label>
                                        <div class="col-sm-3"><input id="position" name="position" class="form-control" value="" ></div>
                                        <label class="col-sm-2 control-label">岗位介绍</label>
                                        <div class="col-sm-3"><input id="job_intro" name="job_intro" class="form-control" value="" ></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">实习内容</label>
                                        <div class="col-sm-3"><input id="job_content" name="job_content" class="form-control" value="" ></div>
                                        <label class="col-sm-2 control-label">实习成果</label>
                                        <div class="col-sm-3"><input id="outcome" name="outcome" class="form-control" value="" ></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">开始时间</label>
                                        <div class="col-sm-3"><input id="start_time" name="start_time" class="form-control" value="" ></div>
                                        <label class="col-sm-2 control-label">结束时间</label>
                                        <div class="col-sm-3"><input id="end_time" id="end_time" class="form-control" value="" ></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">单位指导老师</label>
                                        <div class="col-sm-3"><input id="instructor" name="instructor" class="form-control" value="" ></div>
                                        <label class="col-sm-2 control-label">联系电话</label>
                                        <div class="col-sm-3"><input id="phone" name="phone" class="form-control" value="" ></div>
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <div class="col-sm-2"></div>
                                <div class="col-sm-3">
                                    <div class="btn-group pull-left">
                                        <button type="button" id="submit" class="btn btn-info pull-right">提交</button>
                                    </div>
                                    <div class="btn-group pull-right">
                                        <button type="button" id="back" class="btn btn-warning">返回</button>
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
<rapid:override name="js">
    <script>
        laydate.render({
            elem: '#start_time'
            ,theme: 'molv'
        });
        laydate.render({
            elem: '#end_time'
            ,theme: 'molv'
        });


        $('#submit').click(function () {
            var comName = $('#com_name').val();

            if(!comName){
                layer.msg("请选择实习单位！");
                return false;
            }
            var inship = {
                com_id:$('#com_name').val(),
                position:$('#position').val(),
                job_intro:$('#job_intro').val(),
                job_content:$('#job_content').val(),
                outcome:$('#outcome').val(),
                start_time:$('#start_time').val(),
                end_time:$('#end_time').val(),
                instructor:$('#instructor').val(),
                phone:$('#phone').val(),

            }
            $.ajax({
                url:'${pageContext.request.contextPath}/internship/addShip.do',
                type:'post',
                contentType : 'application/json;charset=utf-8',
                dataType:'json',
                data:JSON.stringify(inship),
                success:function(data){
                    console.log(data)
                    if(data['msg'] == "succ"){
                        window.location.href="${pageContext.request.contextPath}/internship/showInternship"
                    }else {
                        layer.msg("添加失败！");
                    }
                }

            });
        })

        $('#back').click(function () {
            window.location.href='${pageContext.request.contextPath}/internship/showInternship'
        })

    </script>
</rapid:override>
<%@include file="../public/base.jsp"%>
