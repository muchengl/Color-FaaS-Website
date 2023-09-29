<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"  %>
<html>
<head>
    <title>Info</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script src="../js/jquery-3.4.1.js"></script>
</head>

<style>
    .infobox{
        text-align: center;
        display: inline-block;
    }
</style>

<body>

<%
    // get user's balence
    int userID = (int) request.getSession().getAttribute("userID");

    Connection connection = null;
    Statement statement = null;
    ResultSet rs = null;

    String money= "";
    try {
        Class.forName("com.mysql.jdbc.Driver");

        //与数据库建立连接
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/color_faas", "root", "123456");
        statement = connection.createStatement();
        //发送sql语句，执行
        String sql = "select * from User_Info where User_ID="+userID;
        rs = statement.executeQuery(sql);



        if (rs.next()) {
            money = String.valueOf(rs.getInt(4));
        }
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    } catch (SQLException e) {
        e.printStackTrace();
    }finally {
        try {
            if(rs != null) rs.close();
            if(statement != null) statement.close();
            if(connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    //get user's
%>
<h1>
    <br/>
    Here is your account info
</h1>
<hr>

<div style="text-align: center;width: 100%">
    <div class="infobox" style="border-radius:15px;text-align: center;width: 300px;height: 200px;background-color: #b8cbb8;margin-right: 30px">
        <h2>Balance</h2>
        <h1> <%=money%>$ </h1>
    </div>

    <div class="infobox" style="border-radius:15px;text-align: center;width: 300px;height: 200px;background-color: dimgray">
        <h2>Bill</h2>
        <h1> 300$ </h1>
    </div>

</div>

<br>
<div style="text-align: center;width: 100%">
    <a href="TopUp.jsp"><div class="infobox" style="border-radius:15px;text-align: center;width: 630px;height: 100px;background-color: #b8cbb8;margin-right: 30px">
        <h2>Top up your account</h2>
    </div></a>


</div>

<br>
<hr>

<div class="container-fluid" style="width: 900px">
    <div class="row-fluid">
        <div class="span12">
            <table class="table">
                <thead>
                <tr>
                    <th>
                        ID
                    </th>
                    <th>
                        Date
                    </th>
                    <th>
                        Action
                    </th>
                    <th>
                        Money
                    </th>
                </tr>
                </thead>
                <tbody id="list">

                <%


                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/color_faas", "root", "123456");
                        statement = connection.createStatement();


                        String sql = "select * from Account_Info_History where User_ID="+userID;
                        rs = statement.executeQuery(sql);

                        int idx=0;
                        while (rs.next()) {
                            idx++;
                            String type="Add money";
                            if(rs.getInt(3)==0) type="Payment";
                %>
                <tr>
                    <td> <%= idx %> </td>
                    <td> <%= rs.getString(2) %> </td>
                    <td> <%= type %> </td>
                    <td> <%= rs.getString(6) %> </td>
                </tr>
                <%
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }finally {
                        try {
                            if(rs != null) rs.close();
                            if(statement != null) statement.close();
                            if(connection != null) connection.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                %>

                </tbody>

            </table>
        </div>
    </div>
</div>


</body>
</html>
