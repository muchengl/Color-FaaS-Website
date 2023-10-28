<%--
  Created by IntelliJ IDEA.
  User: lhz
  Date: 2023/10/28
  Time: 12:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Test</title>
    <script src="../js/jquery-3.4.1.js"></script>
</head>
<body>

<h1>Function test</h1>
<hr>
<form action="#" method="post">
    <div>
        <label for="functionID">Func ID:</label>
        <input type="text" id="functionID" name="functionID" value="1" required>
    </div><br>
    <div>
        <label for="functionID">Func Name:</label>
        <input type="text" id="functionname" name="functionID" value="HelloWorld" required>
    </div><br>
    <div>
        <label for="functionInput">Input:</label>
        <textarea id="functionInput" name="functionInput" rows="4" required></textarea>
    </div><br>
    <div>
        <button type="submit" onclick="output()">Submit</button>
    </div><br>
</form>

<div id="output"></div>

<script>
    function output() {
        setTimeout(function() {
            $('#output').append(
                '<br><hr><h2>Output</h2>' +
                '<div>' +
                '{"output":"HelloWorld"}' +
                '</div>'
            );
        }, 1000);
    }
</script>

</body>
</html>
