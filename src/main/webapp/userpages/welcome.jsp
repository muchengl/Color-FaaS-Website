<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>

    <meta charset="UTF-8">
    <!--    <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon" />-->
    <link rel="icon" type="image/x-icon" href="../favicon.ico">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script src="../js/jquery-3.4.1.js"></script>
    <title>SimpleFaaS</title>
    <style>
        html, body {
            height: 100%;
        }
        a,a:link,a:visited,a:hover,a:active{
            text-decoration: none;
            color:inherit;
        }
        #main_left{
            width: 180px;
            height: 100%;
            float:left;
            background:whitesmoke;
            cursor:pointer;
        }
        .idxbar{
            width: 100%;
            height: 50px;
            text-align: center;
            line-height:50px;
            background-color:whitesmoke;
            color: black;
            /*border-bottom-style:solid;*/
            /*border-bottom-width:2px;*/
            /*border-bottom-color: black;*/

        }
        .idxbar:hover{
            width: 100%;
            height: 60px;
            text-align: center;
            line-height:60px;
            background-color: lightslategray;
            color: white;
            font-size:25px;
        }
        a{
            text-decoration:none;
        }

    </style>
</head>
<body style="margin-left: 50px;margin-right: 50px">
<!--<h1>Home Page</h1>-->
<hr/>

<%--<img src="../imgs/logo.png" style="width: 500px">--%>

<h1>
    &emsp;&emsp;&emsp;&emsp;Color F-a-a-S
</h1>

<%
    String username = (String) request.getSession().getAttribute("username");
%>
<H2> Hello, <%=username%> </H2>




</body>
</html>

