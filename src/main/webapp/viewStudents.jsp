
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.mycompany.StudentAttendenceSystem.DBConnection"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Students</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f5f9;
            margin: 0;
            padding: 20px;
        }

        h1 {
            background: #173b68;
            color: white;
            text-align: center;
            padding: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 12px;
            text-align: center;
        }

        th {
            background: #1769aa;
            color: white;
        }

        a {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
        }
    </style>
</head>
<body>

<h1>Registered Students</h1>

<table>
    <tr>
        <th>ID</th>
        <th>Roll Number</th>
        <th>Name</th>
        <th>Course</th>
        <th>Semester</th>
    </tr>

    <%
        String sql = "SELECT * FROM students ORDER BY id";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
    %>
    <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getString("roll_no") %></td>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getString("course") %></td>
        <td><%= rs.getInt("semester") %></td>
    </tr>
    <%
            }
        } catch (SQLException e) {
            application.log("Unable to retrieve students", e);
    %>
    <tr>
        <td colspan="5">Unable to load student records.</td>
    </tr>
    <%
        }
    %>
</table>

<a href="index.jsp">Back to Home</a>

</body>
</html>
