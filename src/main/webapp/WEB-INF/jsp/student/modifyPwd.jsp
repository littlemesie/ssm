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
            <li><a href="${pageContext.request.contextPath}/stud/showSelfIntro"><i class="fa fa-file-text-o"></i>自我介绍</a></li>
            <li class="active"><a href="${pageContext.request.contextPath}/stud/modifyPwd"><i class="fa fa-edit"></i>修改密码</a></li>
            <li><a href="${pageContext.request.contextPath}/com/showCom"><i class="fa fa-file-text"></i>用人单位</a></li>
        </ul>
    </li>
</rapid:override>
<rapid:override name="content">
    <div class="content-wrapper" id="pjax-container">
        <section class="content-header">
            <h1>信息管理</h1>
            <ol class="breadcrumb">
                <li class="active"><i class="fa fa-file-text"></i> 信息管理</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <form class="form-horizontal" method="POST" action="" id="modifyPwd">
                        <div class="nav-tabs-custom">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#tab1" data-toggle="tab">修改密码</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tab1">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">当前密码</label>
                                        <div class="col-sm-3"><input class="form-control" v-model="oldpwd" type="password"  placeholder="请输入当前密码"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">新密码</label>
                                        <div class="col-sm-3"><input v-model="newpwd1" type="password" class="form-control" placeholder="请输入新密码"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">确认密码</label>
                                        <div class="col-sm-3"><input v-model="newpwd2" type="password" class="form-control" placeholder="请输入确认新密码"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <div class="col-sm-2"></div>
                                <div class="col-sm-3">
                                    <div class="btn-group pull-left">
                                        <button type="button" class="btn btn-info pull-right" @click="modifyPwd">提交</button>
                                    </div>
                                    <div class="btn-group pull-right">
                                        <button type="reset" class="btn btn-warning">重置</button>
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
    <script src="https://cdn.jsdelivr.net/npm/vue"></script>
    <script>
        new Vue({
            el: '#modifyPwd',
            data() {
                return{
                    oldpwd:'',
                    newpwd1: '',
                    newpwd2:''
                }
            },
            methods:{
                modifyPwd:function() {
                    if (this.oldpwd==''||this.newpwd1==''||this.newpwd2==''){
                        layer.msg('不能为空！');
                        return false
                    }
                    else if (this.newpwd1!=this.newpwd2){
                        layer.msg('两次密码输入不一致！');
                        return false
                    }
                    else{
                        $.ajax({
                            url:'${pageContext.request.contextPath}/stud/modifyPwd.do?active=1',
                            type:'post',
                            data:{'newpwd':this.newpwd1},
                            success:function(data){
                                console.log(data)
                                if(data['msg'] == "succ"){
                                    window.location.href="${pageContext.request.contextPath}/stud/modifyPwd"
                                }
                            }
                        })
                    }
                }
            }
        })
    </script>
</rapid:override>
<%@include file="../public/base.jsp"%>
