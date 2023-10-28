<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Insert title here</title>
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
    connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/color_faas", "root", "123456");
    statement = connection.createStatement();
    //发送sql语句，执行
    String sql = "select * from User_Info where User_Email = '"+username+"' and User_Password = '"+password+"'  ";
    rs = statement.executeQuery(sql);

    if (rs.next()) {
      int userID = rs.getInt(1);

      request.getSession().setAttribute("username",username);
      request.getSession().setAttribute("userID",userID);

      request.getRequestDispatcher("Home.jsp").forward(request, response);
    }else {
      request.getRequestDispatcher("error.jsp").forward(request, response);
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

