
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.mycompany.StudentAttendenceSystem.DBConnection"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mark Attendance</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f5f9;
            margin: 0;
        }

        h1 {
            background: #173b68;
            color: white;
            text-align: center;
            padding: 22px;
            margin: 0;
        }

        .container {
            max-width: 450px;
            margin: 40px auto;
            padding: 25px;
            background: white;
            border-radius: 10px;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }

        select, input {
            width: 100%;
            box-sizing: border-box;
            padding: 11px;
            margin-top: 7px;
        }

        button {
            width: 100%;
            margin-top: 22px;
            padding: 12px;
            background: #1769aa;
            color: white;
            border: none;
            cursor: pointer;
        }

        .back {
            display: block;
            margin-top: 18px;
            text-align: center;
            text-decoration: none;
        }

        .message {
            text-align: center;
            color: green;
            font-weight: bold;
        }
    </style>
</head>

<body>

<h1>Mark Student Attendance</h1>

<div class="container">

    <%
        String message = request.getParameter("message");
        if (message != null) {
    %>
        <p class="message"><%= message %></p>
    <%
        }
    %>

    <form action="AttendanceServlet" method="post">

        <label>Select Student:</label>

        <select name="student_id" required>
            <option value="">-- Select Student --</option>

            <%
                String sql = "SELECT id, roll_no, name FROM students ORDER BY name";

                try (Connection con = DBConnection.getConnection();
                     PreparedStatement ps = con.prepareStatement(sql);
                     ResultSet rs = ps.executeQuery()) {

                    while (rs.next()) {
            %>
                <option value="<%= rs.getInt("id") %>">
                    <%= rs.getString("roll_no") %> -
                    <%= rs.getString("name") %>
                </option>
            <%
                    }
                } catch (SQLException e) {
                    application.log("Unable to load students", e);
            %>
                <option value="">Unable to load students</option>
            <%
                }
            %>
        </select>

        <label>Attendance Date:</label>
        <input type="date" name="attendance_date" required>

        <label>Attendance Status:</label>
        <select name="status" required>
            <option value="">-- Select Status --</option>
            <option value="Present">Present</option>
            <option value="Absent">Absent</option>
        </select>

        <button type="submit">Save Attendance</button>

    </form>

    <a class="back" href="index.jsp">Back to Home</a>

</div>

</body>
</html>
