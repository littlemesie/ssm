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
                <li class="active"><i class="fa fa-columns"></i>招聘求职</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <form class="form-horizontal" method="POST" id="showResDetail" >
                        <div class="nav-tabs-custom">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#tab1" data-toggle="tab">查看个人简历</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tab1">
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label" style="width: 110px">简历名称</label>
                                        <div class="col-sm-3"><input v-model="filename" class="form-control"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label" style="width: 110px">简历内容</label>
                                        <div class="col-sm-3"><textarea v-model="onlinecv" rows="10"  cols="40"></textarea></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label" style="width: 110px">备注</label>
                                        <div class="col-sm-2"><input v-model="comment" class="form-control"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <div class="col-sm-1">
                                    <div class="btn-group pull-left">
                                        <button type="button" class="btn btn-info pull-right" @click="modifyResume">修改并保存</button>
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
        new Vue({
            el: '#showResDetail',
            data() {
                return {
                    filename: '${resume.filename}',
                    onlinecv:'${resume.onlinecv}' ,
                    comment:'${resume.comment}',
                }
            },
            methods:{
                modifyResume:function () {
                    $.ajax({
                        url:'${pageContext.request.contextPath}/job/modifyResume.do',
                        type:'post',
                        data:{'id':${resume.id},'filename':this.filename,'onlinecv':this.onlinecv,'comment':this.comment},
                        success:function(res){
                            console.log(res)
                            if(res['msg'] == "succ"){
                                layer.msg("简历修改成功！")
                            }
                        }
                    })
                }
            }
        })
    </script>
</rapid:block>
<%@include file="../public/base.jsp"%>