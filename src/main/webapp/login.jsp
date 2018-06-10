<%@ taglib prefix="v-on" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: vivi
  Date: 2018/3/11
  Time: 13:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<link rel="stylesheet" href="static/bower_components/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="static/bower_components/font-awesome/css/font-awesome.min.css">
<%--<link rel="stylesheet" href="static/global/Amaranjs/amaran.min.css">--%>
<link rel="stylesheet" href="static/dist/css/AdminLTE.min.css">
<%--<link rel="stylesheet" href="static/global/jQuery-gDialog/animate.min.css">--%>
<link href="static/ssm/admin/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="static/ssm/admin/css/H-ui.login.css" rel="stylesheet" type="text/css" />
<link href="static/ssm/admin/css/Hui-iconfont/iconfont.css" rel="stylesheet" type="text/css" />
<head>
  <title>基于学生端的实践管理系统</title>
</head>
<body class="hold-transition login-page" style="height:auto;">
<div class="header"></div>
<div class="loginWraper">
  <div class="login-box">
    <div class="login-logo" style="color: #fff9ec;font-family: 黑体">杭州师范大学</div>
    <div class="login-box-body" style="background-color: rgba(96,96,96,0.2)" id="loginform">
      <p class="login-box-msg" style="color: #f7fff6">请填写学号和密码登陆系统</p>
      <div class="form-group has-feedback" style="padding-left: 60px">
        <input v-model="stuid" id="stuid" class="form-control" placeholder="学号">
        <span class="glyphicon form-control-feedback fa fa-user fa-lg"></span>
      </div>
      <div class="form-group has-feedback" style="padding-left: 60px">
        <input v-model="password" type="password" id="password" placeholder="密码" class="form-control">
        <span class="glyphicon form-control-feedback fa fa-lock fa-lg"></span>
      </div>
      <div class="row">
        <div class="col-xs-8"></div>
        <div class="col-xs-4">
          <button type="button" @click="submitForm" class="btn btn-primary btn-block">登陆</button>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="footer">Copyright 基于学生端的实践管理系统  by 吴围围</div>

</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/bower_components/jquery/dist/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/ssm/public/js/layer/layer.js"></script>
<script>
    new Vue({
        el: '#loginform',
        data() {
            return{stuid: '',password:''}},
        methods:{
            submitForm:function() {
                if (this.stuid==''){
                    layer.msg('请输入学号');
                    return false
                }
                if (this.password==''){
                    layer.msg('请输入密码');
                    return false
                }
                else{
                    $.ajax({
                        url:'login/login.do',
                        type:'post',
                        data:{'stuid':this.stuid,'password':this.password},
                        success:function(data){
                            console.log(data)
                            if(data['msg'] == "succ"){
                                window.location.href="index/index"
                            }else {
                                layer.msg("学号或密码错误！");
                            }
                        }
                    })
                }
            }
        }
    })
</script>
</html>