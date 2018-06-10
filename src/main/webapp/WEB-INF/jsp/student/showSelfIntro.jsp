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

<rapid:override name="manage">
    <li class="treeview active">
        <a href="#">
            <i class="fa fa-file-text"></i><span>信息管理</span>
            <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
        </a>
        <ul class="treeview-menu" >
            <li><a href="${pageContext.request.contextPath}/stud/showStuInfo"><i class="fa fa-columns"></i>个人信息</a></li>
            <li class="active"><a href="${pageContext.request.contextPath}/stud/showSelfIntro"><i class="fa fa-file-text-o"></i>自我介绍</a></li>
            <li><a href="${pageContext.request.contextPath}/stud/modifyPwd"><i class="fa fa-edit"></i>修改密码</a></li>
            <li><a href="${pageContext.request.contextPath}/com/showCom"><i class="fa fa-file-text"></i>用人单位</a></li>
        </ul>
    </li>
</rapid:override>
<rapid:override name="content">
    <div class="content-wrapper">
        <section class="content-header">
            <h1>信息管理</h1>
            <ol class="breadcrumb">
                <li class="active"><i class="fa fa-file-text"></i> 信息管理</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <form class="form-horizontal layui-form" method="POST" id="uploadForm">
                        <div class="nav-tabs-custom">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#tab1" data-toggle="tab">自我介绍</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tab1">
                                        <%--<div><textarea id="editSelf" name="content" style="display: none;">${stu.selfintro}</textarea></div>--%>
                                    <div class="layui-input-block">
                                        <textarea class="layui-textarea layui-hide" name="content" lay-verify="content" id="content">${stu.selfintro}</textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <div class="col-sm-1">
                                    <div class="btn-group pull-left">
                                        <button type="button" class="btn btn-info pull-right" id="save">编辑</button>
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
        layui.use(['form','layedit', 'jquery'], function () {
            var layedit = layui.layedit;
            var form = layui.form;

            layedit.set({
                uploadImage: {
//                url: '/stud/uploadFile.do?active=1',
//                type: 'post',
//                success:function(res) {

                    url: 'uploadFile.do',
                    type: 'post',
                    success:function(res){
                        console.log(res);
                    }
                }
            });

//        //创建编辑器
            var index=layedit.build('content');

            $("#save").click(function () {

                var selfintroplain=layedit.getText(index).toString();
                var selfintro=layedit.getContent(index).toString();
                $.ajax({
                    url:'${pageContext.request.contextPath}/stud/saveSelfInfo.do',
                    type:'post',
                    data:{'selfintroplain':selfintroplain,'selfintro':selfintro},
                    success:function(res){
                        console.log(res)
                        if(res['msg'] == "succ"){
                            layer.msg("保存成功");
                        }
                    }
                })
            })
        });
    </script>
</rapid:override>
<%@include file="../public/base.jsp"%>