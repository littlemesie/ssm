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
                <li class="active"><i class="fa fa-file-text"></i> 招聘求职</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <form class="form-horizontal" method="POST" action="#">
                        <div class="nav-tabs-custom">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#tab1" data-toggle="tab">投递简历</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tab1">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">请选择简历</label>
                                        <div class="col-sm-3">
                                            <select style="width: 200px;height: 32px;" id="selectRes">
                                                <c:forEach items="${resumes}" var="resume">
                                                    <option value="${resume.id}">${resume.filename}</option>
                                                </c:forEach>

                                            </select>
                                            <div style="margin-top: 20px">
                                                <div class="btn-group pull-left">
                                                    <button type="button" class="btn btn-primary btn-sm pull-left" data-toggle="modal" data-target="#addResume">添加在线简历</button>
                                                </div>
                                                <div class="btn-group pull-right">
                                                    <button type="button" class="btn btn-primary btn-sm pull-right" style="margin-left: 12px" data-toggle="modal" data-target="#uploadResume">上传简历</button>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <div class="col-sm-1"></div>
                                <div class="col-sm-1"></div>
                                <div class="col-sm-1">
                                    <div class="btn-group pull-left">
                                        <button type="button" class="btn btn-info pull-right" id="selectResBtn">提交</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

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

            <div class="modal fade" id="uploadResume" tabindex="-1" role="dialog" aria-labelledby="uploadResume1" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header" style="background: #337ab7">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;
                            </button>
                            <h4 class="modal-title" style="color: #FFFFFF" id="uploadResume1"  >
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
        </section>
    </div>
</rapid:override>
<rapid:block name="js">
    <script>
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
        })

        $("#selectResBtn").click(function () {
            var resId=$("#selectRes").val();
            var recid=${recid};
            var comid=${comid};
            $.ajax({
                url:'${pageContext.request.contextPath}/job/addJobApply.do',
                type:'post',
                data:{'resId':resId,'recid':recid,'comid':comid},
                success:function(res){
                    console.log(res)
                    if(res['msg'] == 1){
                        layer.msg("已投递简历，请等待结果");
                        setTimeout(function(){
                            window.location.href="${pageContext.request.contextPath}/job/showJob"
                        },3000);
                    }else {
                        layer.msg("该招聘信息你已投递过，请等待结果！");
                    }
                }
            })



        })
    </script>
</rapid:block>
<%@include file="../public/base.jsp"%>