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

<rapid:override name="manage">
    <li class="treeview active">
        <a href="#">
            <i class="fa fa-file-text"></i><span>信息管理</span>
            <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
        </a>
        <ul class="treeview-menu" >
            <li class="active"><a href="${pageContext.request.contextPath}/stud/showStuInfo"><i class="fa fa-columns"></i>个人信息</a></li>
            <li><a href="${pageContext.request.contextPath}/stud/showSelfIntro"><i class="fa fa-file-text-o"></i>自我介绍</a></li>
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
                    <form class="form-horizontal" method="POST" action="#" id="modifyStuinfo" >
                        <div class="nav-tabs-custom">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#tab1" data-toggle="tab">个人信息</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tab1">
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label">姓名</label>
                                        <div class="col-sm-3"><input class="form-control" value="${stu.stuname}" readonly="readonly"></div>
                                        <label class="col-sm-1 control-label">学号</label>
                                        <div class="col-sm-3"><input class="form-control" value="${stu.stuid}" readonly="readonly"></div>
                                        <label class="col-sm-1 control-label">性别</label>
                                        <div class="col-sm-1">
                                            <c:if test="${stu.sex eq 1}">
                                                <input class="form-control" value="男" readonly="readonly">
                                            </c:if>
                                            <c:if test="${stu.sex eq 2}">
                                                <input class="form-control" value="女" readonly="readonly">
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label">院系</label>
                                        <div class="col-sm-2"><input class="form-control" value="${stumap.insname}" readonly="readonly"></div>
                                        <div class="col-sm-2"><input class="form-control" value="${stumap.depname}" readonly="readonly"></div>
                                        <div class="col-sm-3"><input class="form-control" value="${stumap.majname}" readonly="readonly"></div>
                                        <div class="col-sm-2"><input class="form-control" value="${stumap.claname}" readonly="readonly"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label">手机</label>
                                        <div class="col-sm-2"><input v-model="mobilephone" class="form-control"></div>
                                        <label class="col-sm-1 control-label">QQ</label>
                                        <div class="col-sm-2"><input v-model="qq" class="form-control"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label">微信</label>
                                        <div class="col-sm-3"><input  v-model="wechat" class="form-control"></div>
                                        <label class="col-sm-1 control-label">邮箱</label>
                                        <div class="col-sm-3"><input v-model="email" class="form-control"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label" style="width: 110px">毕设指导</label>
                                        <div class="col-sm-2"><input class="form-control" value="${stumap.papename}" readonly="readonly"></div>
                                        <c:if test="${stumap.papename eq ''}">
                                            <div class="col-sm-2"><button class="btn btn-primary btn-sm" type="button" onclick="window.location.href='${pageContext.request.contextPath}/stud/chooseTea?teatype=1'">请选择毕业指导老师</button></div>
                                        </c:if>
                                        <c:if test="${stumap.papename eq ' '}">
                                            <div class="col-sm-2"><input class="form-control" value="导师申请中" readonly="readonly"></div>
                                        </c:if>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label" style="width: 110px">实习指导</label>
                                        <div class="col-sm-2"><input class="form-control" value="${stumap.intename}" readonly="readonly"></div>
                                        <c:if test="${stumap.intename eq '' && stu.advisestate eq 0}">
                                            <div class="col-sm-2"><button class="btn btn-primary btn-sm" type="button" onclick="window.location.href='${pageContext.request.contextPath}/stud/chooseTea?teatype=2'">请选择实习指导老师</button></div>
                                        </c:if>
                                        <label class="col-sm-1 control-label" style="width: 110px">指导状态</label>
                                        <c:if test="${stu.advisestate eq 0}">
                                            <div class="col-sm-2"><input class="form-control" value="没有导师" readonly="readonly"></div>
                                        </c:if>
                                        <c:if test="${stu.advisestate eq 1}">
                                            <div class="col-sm-2"><input class="form-control" value="导师申请中" readonly="readonly"></div>
                                        </c:if>
                                        <c:if test="${stu.advisestate eq 2}">
                                            <div class="col-sm-2"><input class="form-control" value="导师已确认" readonly="readonly"></div>
                                        </c:if>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label" style="width: 110px">实习分数</label>
                                        <div class="col-sm-2"><input class="form-control" value="${stu.internscore}" readonly="readonly"></div>
                                        <label class="col-sm-1 control-label" style="width: 110px">实习状态</label>
                                        <c:if test="${stu.state eq 0}">
                                            <div class="col-sm-2"><input class="form-control" value="未实习" readonly="readonly"></div>
                                        </c:if>
                                        <c:if test="${stu.state eq 1}">
                                            <div class="col-sm-2"><input class="form-control" value="实习申请中" readonly="readonly"></div>
                                        </c:if>
                                        <c:if test="${stu.state eq 2}">
                                            <div class="col-sm-2"><input class="form-control" value="实习中" readonly="readonly"></div>
                                        </c:if>
                                        <c:if test="${stu.state eq 3}">
                                            <div class="col-sm-2"><input class="form-control" value="实习变更申请中" readonly="readonly"></div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <div class="col-sm-1">
                                    <div class="btn-group pull-left">
                                        <button type="button" class="btn btn-info pull-right" @click="modifyStuinfo">提交</button>
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
            el: '#modifyStuinfo',
            data() {
                return {
                    mobilephone: '${stu.mobilephone}',
                    qq:'${stu.qq}' ,
                    wechat:'${stu.wechat}',
                    email:'${stu.email}'
                }
            },
            methods:{
                modifyStuinfo:function () {
                    $.ajax({
                        url:'${pageContext.request.contextPath}/stud/modifyStuinfo.do',
                        type:'post',
                        data:{'mobilephone':this.mobilephone,'qq':this.qq,'wechat':this.wechat,'email':this.email},
                        success:function(res){
                            console.log(res)
                            if(res['msg'] == "succ"){
                                layer.msg("信息修改成功！")
                            }
                        }
                    })
                }
            }
        })
    </script>
</rapid:override>
<%@include file="../public/base.jsp"%>
