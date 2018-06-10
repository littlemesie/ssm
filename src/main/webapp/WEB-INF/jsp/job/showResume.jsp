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
<rapid:block name="css">
    <style>
        .fileupload{
            position: relative;
            overflow: hidden;
        }
        .fileupload input{
            position: absolute;
            width:200px;
            height:35px;
            right: 0;
            top: 0;
            opacity: 0;
            filter: alpha(opacity=0);
            -ms-filter: 'alpha(opacity=0)';
        }
    </style>
</rapid:block>
<rapid:override name="recruit">
    <li class="treeview active">
        <a href="#">
            <i class="fa fa-clipboard"></i><span>招聘求职</span>
            <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
        </a>
        <ul class="treeview-menu">
            <li><a href="${pageContext.request.contextPath}/index/showRecruitinfo"><i class="fa fa-columns"></i>招聘信息</a></li>
            <li><a href="${pageContext.request.contextPath}/job/showJob"><i class="fa fa-file-text-o"></i>求职信息</a></li>
            <li class="active"><a href="${pageContext.request.contextPath}/job/showResume"><i class="fa fa-list-alt"></i>个人简历</a></li>
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
                            <li class="active"><a href="#tab1" data-toggle="tab">个人简历</a></li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tab1">
                                <div class="box box-primary">
                                    <div class="box-body table-responsive">
                                        <table class="table table-bordered table-hover">
                                            <tr>
                                                <th>简历名称</th>
                                                <th>备注</th>
                                                <th>操作</th>
                                            </tr>
                                            <c:forEach items="${resumes}" var="resume">
                                                <tr>
                                                    <td>${resume.filename}</td>
                                                    <td>
                                                        <c:if test="${resume.type eq 1}">
                                                            附件简历
                                                        </c:if>
                                                        <c:if test="${resume.type eq 2}">
                                                            ${resume.comment}
                                                        </c:if>
                                                    </td>
                                                    <td>
                                                        <button type="button" class="btn btn-info btn-sm" onclick="window.location.href='${pageContext.request.contextPath}/job/showResumeDetail?id=${resume.id}&type=${resume.type}'">查看</button>
                                                        <c:if test="${resume.type eq 1}">
                                                            <button type="button" class="btn btn-warning btn-sm" >更换</button>
                                                        </c:if>
                                                        <button type="button" class="btn btn-danger btn-sm" onclick="deleteRes(${resume.id})"> 删除</button>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <div class="col-sm-2"></div>
                                <div class="col-sm-3">
                                    <div class="btn-group pull-left">
                                        <button type="button" class="btn btn-primary pull-right btn-sm fileupload" data-toggle="modal" data-target="#uploadFile">上传简历</button>
                                    </div>
                                    <div class="btn-group pull-right">
                                        <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#addResume">添加在线简历</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                        <%--上传附件简历--%>
                    <div class="modal fade" id="uploadFile" tabindex="-1" role="dialog" aria-labelledby="uploadFile1" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header" style="background: #337ab7">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                    <h4 class="modal-title" style="color: #FFFFFF" id="uploadFile1" >
                                        上传简历
                                    </h4>
                                </div>
                                <form action="${pageContext.request.contextPath}/job/uploadResume.do" enctype="multipart/form-data" method="post">
                                    <div class="modal-body">
                                        <div class="nav-tabs-custom">
                                            <div class="tab-content">
                                                <div class="tab-pane active">
                                                    <div class="form-group">
                                                        <input type="file" name="file" id="resumeFile"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                                        </button>
                                        <button type="submit" class="btn btn-primary" id="uploadResume">
                                            提交
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                        <%--更改附件简历--%>
                    <div class="modal fade" id="changeFile" tabindex="-1" role="dialog" aria-labelledby="uploadFile2" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                    <h4 class="modal-title" id="uploadFile2" >
                                        上传简历
                                    </h4>
                                </div>
                                <form action="uploadResume.do" enctype="multipart/form-data" method="post">
                                    <div class="modal-body">
                                        <div class="nav-tabs-custom">
                                            <div class="tab-content">
                                                <div class="tab-pane active">
                                                    <div class="form-group">
                                                        <input type="file" name="file" id="chFile"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                                        </button>
                                        <button type="submit" class="btn btn-primary" id="changeResume">
                                            提交
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                        <%--添加在线简历--%>
                    <div class="modal fade" id="addResume" tabindex="-1" role="dialog" aria-labelledby="addResume1" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                    <h4 class="modal-title" id="addResume1" style="color: #FFFFFF" >
                                        添加在线简历
                                    </h4>
                                </div>
                                <div class="modal-body">
                                    <form class="form-horizontal" method="POST">
                                        <div class="nav-tabs-custom">
                                            <div class="tab-content">
                                                <div class="tab-pane active" id="tab2">
                                                    <div class="form-group">
                                                        <label class="col-sm-1 control-label" style="width: 110px">简历名称</label>
                                                        <div class="col-sm-4"><input v-model="filename" class="form-control"></div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-1 control-label" style="width: 110px">简历内容</label>
                                                        <div class="col-sm-3"><textarea v-model="onlinecv" rows="10"  cols="40"></textarea></div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-1 control-label" style="width: 110px">备注</label>
                                                        <div class="col-sm-4"><input v-model="comment" class="form-control"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                                    </button>
                                    <button type="button" class="btn btn-primary" @click="addres">
                                        提交
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</rapid:override>
<rapid:block name="js">
    <script>
        function deleteRes(id) {
            layer.confirm('确认要删除该简历吗？',function (index) {
                $.ajax({
                    url:'${pageContext.request.contextPath}/job/deleteResume.do',
                    type:'post',
                    data:{'id':id},
                    success:function(res){
                        console.log(res)
                        if(res['msg'] == "succ"){
                            window.location.reload();
                        }
                    }
                })
            })
        }

        new Vue({
            el: '#addResume',
            data() {
                return{
                    filename: '',
                    onlinecv:'',
                    comment:''
                }
            },
            methods:{
                addres:function() {
                    if(this.filename==''){
                        layer.msg("请编辑简历名称!");
                        return false
                    }
                    if (this.onlinecv==''){
                        layer.msg("请编辑在线简历内容!");
                        return false
                    }
                    $.ajax({
                        url:'${pageContext.request.contextPath}/job/addRes.do',
                        type:'post',
                        data:{'filename':this.filename,'onlinecv':this.onlinecv,'comment':this.comment},
                        success:function(res){
                            console.log(res)
                            if(res['msg'] == 1){
                                layer.msg("简历添加成功！");
                                setTimeout(function(){
                                    window.location.reload();
                                },3000);
                            }
                        }
                    })
                }
            }
        });

        $('#uploadResume').click(function () {
            var resume = $('#resumeFile').val();
            if(!resume){
                layer.msg("请选择简历！")
                return false;
            }
            console.log(resume);
            /*$.ajax({
                url:'/job/uploadResume.do',
                type:'post',
                data:{'resume':resume},
                success:function (res) {
                    layer.msg(123)
                }
            })*/
        })
        $('#changeResume').click(function () {
            var resume = $('#chFile').val();
            if(!resume){
                layer.msg("请选择简历！")
                return false;
            }
        })
        var msg = $('#msg').val();
        if(msg == 'succ'){
            layer.msg("上传成功！");
            setTimeout("refresh()",1000)
        }else if(msg == 'filed'){
            layer.msg("上传失败！");
            setTimeout("refresh()",1000)
        }
        function refresh() {
            window.location.href='${pageContext.request.contextPath}/job/showResume'
        }
    </script>
</rapid:block>
<%@include file="../public/base.jsp"%>