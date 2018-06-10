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
            <li><a href="${pageContext.request.contextPath}/internship/showInternship"><i class="fa fa-columns"></i>实习详情</a></li>
            <li class="active"><a href="${pageContext.request.contextPath}/internship/showInterLog"><i class="fa fa-file-text-o"></i>实习日志</a></li>
            <li><a href="${pageContext.request.contextPath}/internship/showEmploy"><i class="fa fa-list-alt"></i>就业详情</a></li>
        </ul>
    </li>
</rapid:override>
<rapid:override name="content">
    <div class="content-wrapper">
        <section class="content-header">
            <h1>实习就业</h1>
            <ol class="breadcrumb">
                <li class="active"><i class="fa fa-file-text"></i> 实习就业</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <form class="form-horizontal" method="POST" action="#" id="modifyLog" >
                        <div class="nav-tabs-custom">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#tab1" data-toggle="tab">日志详情</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tab1">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">日志标题</label>
                                        <div class="col-sm-3"><textarea class="form-control" v-model="title" rows="1"  cols="100"></textarea></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">日志内容</label>
                                        <div class="col-sm-3"><textarea class="form-control" v-model="content" rows="15"  cols="100"></textarea></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">发布日期</label>
                                        <div class="col-sm-3"><textarea v-model="date" class="form-control" rows="1"  cols="100" readonly></textarea></div>
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <div class="col-sm-1"></div>
                                <div class="col-sm-3">
                                    <div class="btn-group pull-left">
                                        <button type="button" class="btn btn-info pull-right" @click="modifyLog">保存并修改</button>
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
    <script src="https://cdn.jsdelivr.net/npm/vue"></script>
    <script>
        new Vue({
            el: '#modifyLog',
            data(){
                return {
                    title: '${internlog.title}',
                    content:'${internlog.content}' ,
                    date:'${internlog.date}'
                }
            },
            methods:{
                modifyLog:function () {
                    $.ajax({
                        url:'${pageContext.request.contextPath}/internship/modifyInterLog.do',
                        type:'post',
                        data:{'id':${internlog.id},'title':this.title,'content':this.content},
                        success:function(res){
                            console.log(res)
                            if(res['msg'] == "succ"){
                                layer.msg("日志修改成功！");
                                setTimeout(function(){
                                    window.location.href='${pageContext.request.contextPath}/internship/showInterLog';
                                },3000);
                            }
                        }
                    })
                }
            }
        })

    </script>
</rapid:block>
<%@include file="../public/base.jsp"%>