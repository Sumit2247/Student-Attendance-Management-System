
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.mycompany.StudentAttendenceSystem.DBConnection"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Attendance Records</title>

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
            padding: 22px;
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

        .back {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
        }
    </style>
</head>

<body>

<h1>Attendance Records</h1>

<table>
    <tr>
        <th>ID</th>
        <th>Roll Number</th>
        <th>Student Name</th>
        <th>Attendance Date</th>
        <th>Status</th>
    </tr>

    <%
        String sql = "SELECT a.id, s.roll_no, s.name, "
                + "a.attendance_date, a.status "
                + "FROM attendance a "
                + "JOIN students s ON a.student_id = s.id "
                + "ORDER BY a.attendance_date DESC, s.name";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            boolean found = false;

            while (rs.next()) {
                found = true;
    %>
    <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getString("roll_no") %></td>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getDate("attendance_date") %></td>
        <td><%= rs.getString("status") %></td>
    </tr>
    <%
            }

            if (!found) {
    %>
    <tr>
        <td colspan="5">No attendance records found.</td>
    </tr>
    <%
            }

        } catch (SQLException e) {
            application.log("Unable to load attendance records", e);
    %>
    <tr>
        <td colspan="5">Unable to load attendance records. Check the server log.</td>
    </tr>
    <%
        }
    %>
</table>

<a class="back" href="index.jsp">Back to Home</a>

</body>
</html>
