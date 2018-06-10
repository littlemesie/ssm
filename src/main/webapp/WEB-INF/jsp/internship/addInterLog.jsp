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
            <li><a href="${pageContext.request.contextPath}/internship/showInternship"><i class="fa fa-columns"></i>实习详情</a></li>
            <li class="active"><a href="${pageContext.request.contextPath}/internship/showInterLog"><i class="fa fa-file-text-o"></i>实习日志</a></li>
            <li><a href="${pageContext.request.contextPath}/internship/showEmploy"><i class="fa fa-list-alt"></i>就业详情</a></li>
        </ul>
    </li>
</rapid:override>
<rapid:override name="content">
    <div class="content-wrapper">
        <section class="content-header">
            <h1>实习日志</h1>
            <ol class="breadcrumb">
                <li class="active"><i class="fa fa-file-text"></i> 实习日志</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <form class="form-horizontal" method="POST" action="" onsubmit="return false" >
                        <div class="nav-tabs-custom">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#tab1" data-toggle="tab">添加实习日志</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tab1">
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label">日志标题</label>
                                        <div class="col-sm-3"><input class="form-control" id="title"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label">日志内容</label>
                                        <div class="col-sm-3"><textarea id="addInterLog" name="content" style="display: none;"></textarea></div>
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <div class="col-sm-1"></div>
                                <div class="col-sm-3">
                                    <div class="btn-group pull-left">
                                        <button type="button" class="btn btn-info pull-right" id="save">保存</button>
                                    </div>
                                    <div class="btn-group pull-right">
                                        <button type="button" class="btn btn-warning pull-right" onclick="window.location.href='${pageContext.request.contextPath}/internship/showInterLog'">返回</button>
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
<rapid:block name="js">
    <script>
        layui.use('layedit', function () {
            var layedit = layui.layedit;
            //创建编辑器
            var index=layedit.build('addInterLog');

            $("#save").click(function () {
                var content=layedit.getContent(index).toString();
                var title=$("#title").val();
                if (title==''){
                    layer.msg("请编辑标题！");
                    return false
                }
                else if(content==""){
                    layer.msg("请编辑内容！");
                    return false
                }
                else {
                    $.ajax({
                        url:'${pageContext.request.contextPath}/internship/addInterLog.do',
                        type:'post',
                        data:{'content':content,'title':title},
                        success:function(res){
                            console.log(res)
                            if(res['msg'] == 1){
                                layer.msg("日志添加成功！");
                                setTimeout(function(){
                                    window.location.href='${pageContext.request.contextPath}/internship/showInterLog';
                                },3000);
                            }else {
                                layer.msg("你未处于实习中状态，请先申请实习！");
                                setTimeout(function(){
                                    window.location.href='${pageContext.request.contextPath}/internship/showInterLog';
                                },3000);
                            }
                        }
                    })
                }
            })
        });
    </script>
</rapid:block>
<%@include file="../public/base.jsp"%>