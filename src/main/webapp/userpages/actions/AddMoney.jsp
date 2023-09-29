<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"  %>
<%@ page import="java.text.ParseException" %>
<%@ page import="java.text.SimpleDateFormat" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
  int userID = (int) request.getSession().getAttribute("userID");
  String account = request.getParameter("account");
  String money = request.getParameter("money");

//  java.util.Date date= new java.util.Date();
//  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//  Timestamp ts = null;
//  try {
//    Date parse = sdf.parse(date);
//    ts = new Timestamp(parse.getTime());
//  } catch (ParseException e) {
//    e.printStackTrace();
//  }


  Connection connection = null;
  Statement statement = null;
  ResultSet rs = null;


  try {
    Class.forName("com.mysql.jdbc.Driver");

    //与数据库建立连接
    connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/color_faas", "root", "123456");
    statement = connection.createStatement();
    //发送sql语句，执行
    String sql = "INSERT INTO Account_Info_History (User_ID, Date, Type, Account_Num,Money) VALUES ("+userID+",'"+new java.util.Date()+"',1,'"+account+"', '"+money+"')";
    System.out.println(sql);
    boolean res = statement.execute(sql);

    if(res) return;

    sql = "UPDATE User_Info" +
            " SET User_Balance = " + money +
            " WHERE User_ID ="+userID;
    System.out.println(sql);
    res = statement.execute(sql);


    if (!res) {
      String message = "SUCCESS！";
      request.getRequestDispatcher("../Info.jsp").forward(request, response);

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
