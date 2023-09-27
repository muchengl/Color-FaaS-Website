<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"  %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    System.out.println(username+" "+password);

    Connection connection = null;
    Statement statement = null;
    ResultSet rs = null;


    try {
        Class.forName("com.mysql.jdbc.Driver");

        //与数据库建立连接
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/color_faas", "root", "123456");
        statement = connection.createStatement();
        //发送sql语句，执行
        String sql = "INSERT INTO User_Info (User_Email, User_Password, User_Balance) VALUES ('"+username+"', '"+password+"', 0)";
        boolean res = statement.execute(sql);

        if (!res) {
            String message = "SUCCESS！";
            %>
            <script type="text/javascript">
                // JavaScript代码，使用alert显示弹窗
                alert('<%= message %>');
            </script>
            <%
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }else {
        %>
            <script type="text/javascript">
                alert("error");
            </script>
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

</body>
</html>
