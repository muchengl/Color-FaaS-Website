<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <!--    <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon" />-->
    <link rel="icon" type="image/x-icon" href="../favicon.ico">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script src="./js/jquery-3.4.1.js"></script>
    <title>ColorFaaS</title>
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
<body>



<div id="main_left" style="height:100%">
    <br><br><div style="text-align: center">
    <strong><h4 style="color: black;" >Color FaaS</h4></strong>
</div><hr style="color: lightslategray">
    <a class="idxUrl" data-src="./userpages/welcome.jsp"><div class="idxbar" style="" >
        Homa Page
    </div></a>
    <a class="idxUrl" data-src="./userpages/Tasks.jsp"><div class="idxbar" style="" >
        Task List
    </div></a>
    <a class="idxUrl" data-src="./userpages/Funcs.jsp"><div class="idxbar" style="" >
        Func Manager
    </div></a>
    <a class="idxUrl" data-src="./userpages/Info.jsp"><div class="idxbar" style="" >
        Account
    </div></a>

</div>

<div id="main_right" style="height: 100%;width: 100%">
    <iframe frameborder="0" scrolling="yes" style="width:100%;height:100%" src="./userpages/welcome.jsp" id="aa"></iframe>
</div>

<script>
    var w = document.documentElement.clientWidth || document.body.clientWidth;
    var h = document.documentElement.clientHeight || document.body.clientHeight;
    $("#aa").width(w-180);
    $(function(){
        $("#main_left a").on("click",function(){
            var address =$(this).attr("data-src");
            $("iframe").attr("src",address);
        });
    });
</script>


</body>
</html>