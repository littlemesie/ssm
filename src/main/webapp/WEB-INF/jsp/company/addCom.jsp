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
            <i class="fa fa-file-text"></i><span>信息管理</span>
            <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
        </a>
        <ul class="treeview-menu" >
            <li><a href="${pageContext.request.contextPath}/stud/showStuInfo"><i class="fa fa-columns"></i>个人信息</a></li>
            <li><a href="${pageContext.request.contextPath}/stud/showSelfIntro"><i class="fa fa-file-text-o"></i>自我介绍</a></li>
            <li><a href="${pageContext.request.contextPath}/stud/modifyPwd"><i class="fa fa-edit"></i>修改密码</a></li>
            <li class="active"><a href="${pageContext.request.contextPath}/com/showCom"><i class="fa fa-file-text"></i>用人单位</a></li>
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
                    <form class="form-horizontal" method="POST" id="addCom">
                        <div class="nav-tabs-custom">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#tab1" data-toggle="tab">添加用人单位</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tab1">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">单位全称</label>
                                        <div class="col-sm-3"><input class="form-control" v-model="company_name"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">地址</label>
                                        <div class="col-sm-4"><input class="form-control" v-model="addr" ></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">网址</label>
                                        <div class="col-sm-4"><input class="form-control" v-model="contactor"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">联系人</label>
                                        <div class="col-sm-2"><input class="form-control" v-model="phone"></div>
                                        <label class="col-sm-2 control-label">电话</label>
                                        <div class="col-sm-3"><input class="form-control" v-model="url"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <div class="col-sm-2"></div>
                                <div class="col-sm-3">
                                    <div class="btn-group pull-left">
                                        <button type="button" class="btn btn-info pull-right" @click="addCom">提交审核</button>
                                    </div>
                                    <div class="btn-group pull-right">
                                        <button type="button" class="btn btn-warning" onclick="window.location.href='${pageContext.request.contextPath}/com/showCom'">返回</button>
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
            el: '#addCom',
            data() {
                return{
                    company_name: '',
                    addr:'',
                    contactor:'',
                    phone:'',
                    url:''
                }
            },
            methods:{
                addCom:function() {
                    if (this.company_name==''){
                        layer.msg('公司名称不能为空！');
                        return false
                    }
                    else{
                        $.ajax({
                            url:'${pageContext.request.contextPath}/com/addComp.do',
                            type:'post',
                            dataType:'json',
                            contentType : "application/json;charset=UTF-8",
                            data: JSON.stringify({
                                company_name:this.company_name,
                                addr:this.addr,
                                contactor:this.contactor,
                                phone:this.phone,
                                url:this.url
                            }),
                            success:function(res){
                                console.log(res)
                                if(res['msg'] == 1){
                                    window.location.href='${pageContext.request.contextPath}/com/showCom'
                                }
                            }
                        })
                    }
                }
            }
        })
    </script>
</rapid:block>
<%@include file="../public/base.jsp"%>