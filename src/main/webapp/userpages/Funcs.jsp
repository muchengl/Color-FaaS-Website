<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"  %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script src="../js/jquery-3.4.1.js"></script>
</head>
<body style="margin-left: 50px;margin-right: 50px">

<h2>Upload Func</h2>
<hr/>
<form method="post" action="UploadNewFunc.jsp">
    <label>Func Name:</label>
    <input type="text" name="filename"/>
    <br/>

    <label>Func Description:</label>
    <input type="text" name="description"/>
    <br/>

    <label>Func Input:</label>
    <input type="text" name="input"/>
    <br/>

    <label>Func Style:</label>
    <select name="style">
        <option>Sync</option>
        <option>Async</option>
    </select>
    <br/>

    <label>Func Resource:</label>
    <p> - CPU(Core):</p>
    <select name="CPU">
        <option>1</option>
        <option>2</option>
        <option>3</option>
        <option>4</option>
        <option>5</option>
        <option>6</option>
        <option>7</option>
        <option>8</option>
    </select>
    <p> - Memory(G):</p>
    <select name="MEM">
        <option>1</option>
        <option>2</option>
        <option>3</option>
        <option>4</option>
    </select>
    <p> - DISK(G):</p>
    <select name="DIKS">
        <option>1</option>
        <option>2</option>
        <option>3</option>
        <option>4</option>
    </select>
    <br/>

    <label>Func Code File:</label>
    <input type="file" name="file"/>
    <br/>

    <button type="submit">Submit</button>
</form>

<br><br>
<h2>Func List</h2>

<div class="container-fluid">
    <div class="row-fluid">
        <div class="span12">
            <table class="table">
                <thead>
                <tr>
                    <th>
                        ID
                    </th>
                    <th>
                        Func name
                    </th>
                    <th>
                        Func description
                    </th>
                    <th>
                        Func Style
                    </th>
                    <th>
                        CPU(Core)
                    </th>
                    <th>
                        MEM(G)
                    </th>
                    <th>
                        DISK(G)
                    </th>
                    <th>
                        Actions
                    </th>
                </tr>
                </thead>
                <tbody id="list">

                <%
                    int userID = (int) request.getSession().getAttribute("userID");


                    Connection connection = null;
                    Statement statement = null;
                    ResultSet rs = null;


                    try {
                        Class.forName("com.mysql.jdbc.Driver");

                        //与数据库建立连接
                        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/color_faas", "root", "123456");
                        statement = connection.createStatement();
                        //发送sql语句，执行
                        String sql = "select * from Functions where User_ID="+userID;
                        rs = statement.executeQuery(sql);

                        int idx=0;
                        while (rs.next()) {
                            idx++;
                            String style="sync";
                            if(rs.getInt(6)==1) style="async";
 %>
                        <tr>
                            <td> <%= idx %> </td>
                            <td> <%= rs.getString(10) %> </td>
                            <td> <%= rs.getString(5) %> </td>
                            <td> <%= style %> </td>
                            <td> <%= rs.getString(7) %> </td>
                            <td> <%= rs.getString(8) %> </td>
                            <td> <%= rs.getString(9) %> </td>
                            <td><a>Delete</a>｜<a>Update</a> | <a href="FuncsTest.jsp">Test</a></td>
                        </tr>
<%
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
                %>

                </tbody>

            </table>
        </div>
    </div>
</div>





</body>
</html>