<%--
  Created by IntelliJ IDEA.
  User: mesie
  Date: 05/04/2018
  Time: 10:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>接口测试</title>
</head>
<body>
    <div>

        <button id="test" type="button">测试</button>
    </div>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/ssm/public/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript">
        $('#test').click(function () {
            //alert(11);
            //return;
            $.ajax({
                url:'testLogin',
                type:'post',
                data:{'stuid':'2014211409','password':'123qwe'},
                success:function(data){
                    console.log(data)
                }
            })
        })
    </script>
</body>
</html>
