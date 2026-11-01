
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Attendance Management System</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f5f9;
            margin: 0;
            text-align: center;
        }

        .header {
            background-color: #173b68;
            color: white;
            padding: 25px;
        }

        .container {
            margin: 50px auto;
            max-width: 600px;
            background: white;
            padding: 30px;
            border-radius: 10px;
        }

        a {
            display: block;
            background-color: #1769aa;
            color: white;
            text-decoration: none;
            padding: 14px;
            margin: 15px 0;
            border-radius: 5px;
        }

        a:hover {
            background-color: #104b7b;
        }
    </style>
</head>

<body>

    <div class="header">
        <h1>Student Attendance Management System</h1>
        <p>Manage student records and attendance easily</p>
    </div>

    <div class="container">
        <h2>Welcome</h2>
        <p>Select an option below:</p>

        <a href="addStudent.jsp">Add Student</a>

        <a href="attendance.jsp">Mark Attendance</a>

        <a href="viewAttendance.jsp">View Attendance Records</a>
        
        <a href="viewStudents.jsp">View Registered Students</a>
    </div>

</body>
</html>
