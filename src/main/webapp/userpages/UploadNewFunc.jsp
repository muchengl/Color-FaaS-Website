<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"  %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    String filename = request.getParameter("filename");
    String description = request.getParameter("description");
    String input = request.getParameter("input");
    String style = request.getParameter("style");
    int as=0;
    if(style.equals("async")) as=1;

    String CPU = request.getParameter("CPU");
    String MEM = request.getParameter("MEM");
    String DIKS = request.getParameter("DIKS");
    int userID = (int) request.getSession().getAttribute("userID");


    System.out.println(filename+" "+description);

    Connection connection = null;
    Statement statement = null;


    try {
        Class.forName("com.mysql.jdbc.Driver");


        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/color_faas", "root", "123456");
        statement = connection.createStatement();

        String sql = "INSERT INTO Functions (User_ID, Func_Args, Func_Path, Func_Explanation, Func_Output, Func_Resource_CPU, Func_Resource_Mem, Func_Resource_Disk, Func_Name) " +
                "VALUES ("+userID+", "+input+",'na', "+description+", "+as+", "+CPU+", "+MEM+", "+DIKS+","+filename+");";

        boolean rs = statement.execute(sql);
        if (rs){
            request.getRequestDispatcher("Home.jsp").forward(request, response);
        }


    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    } catch (SQLException e) {
        e.printStackTrace();
    }finally {
        try {
            if(statement != null) statement.close();
            if(connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

</body>
</html>
