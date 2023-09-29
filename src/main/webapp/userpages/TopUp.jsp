<%--
  Created by IntelliJ IDEA.
  User: lhz
  Date: 2023/9/28
  Time: 20:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Top Up</title>
</head>
<body>

<hr>

<form method="post" action="actions/AddMoney.jsp" style="margin-left: 20px">
  <label>Bank Account:</label>
  <input type="text" name="account"/>

  <br><br><label>Money:</label>
  <input type="text" name="money"/>

  <button type="submit">Submit</button>
</form>

</body>
</html>
