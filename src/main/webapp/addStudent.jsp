
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Student</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f5f9;
            margin: 0;
        }

        h1 {
            background-color: #173b68;
            color: white;
            text-align: center;
            padding: 22px;
            margin: 0;
        }

        .container {
            max-width: 450px;
            margin: 40px auto;
            padding: 25px;
            background-color: white;
            border-radius: 10px;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }

        input {
            width: 100%;
            box-sizing: border-box;
            padding: 10px;
            margin-top: 7px;
        }

        button {
            width: 100%;
            margin-top: 22px;
            padding: 12px;
            background-color: #1769aa;
            color: white;
            border: none;
            cursor: pointer;
        }

        button:hover {
            background-color: #104b7b;
        }

        .back {
            display: block;
            margin-top: 18px;
            text-align: center;
            text-decoration: none;
        }

        .message {
            color: green;
            font-weight: bold;
            text-align: center;
        }
    </style>
</head>

<body>

    <h1>Add Student Details</h1>

    <div class="container">

        <% 
            String message = (String) request.getAttribute("message");
            if (message != null) {
        %>
            <p class="message"><%= message %></p>
        <% 
            }
        %>

        <form action="StudentServlet" method="post">

            <input type="hidden" name="action" value="add">

            <label>Roll Number:</label>
            <input type="text" name="roll_no"
                   placeholder="Enter roll number" required>

            <label>Student Name:</label>
            <input type="text" name="name"
                   placeholder="Enter student name" required>

            <label>Course:</label>
            <input type="text" name="course"
                   placeholder="e.g. MCA" required>

            <label>Semester:</label>
            <input type="number" name="semester"
                   min="1" max="12"
                   placeholder="Enter semester" required>

            <button type="submit">Add Student</button>

        </form>

        <a class="back" href="index.jsp">Back to Home</a>

    </div>

</body>
</html>
