
package com.mycompany.StudentAttendenceSystem;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/StudentServlet")
public class StudentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");

        if (!"add".equals(action)) {
            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid action");
            return;
        }

        String rollNo = request.getParameter("roll_no");
        String name = request.getParameter("name");
        String course = request.getParameter("course");
        String semesterText = request.getParameter("semester");

        String message;

        try {
            int semester = Integer.parseInt(semesterText);

            String sql = "INSERT INTO students "
                    + "(roll_no, name, course, semester) "
                    + "VALUES (?, ?, ?, ?)";

            try (Connection con = DBConnection.getConnection();
                    PreparedStatement ps = con.prepareStatement(sql)) {

                ps.setString(1, rollNo);
                ps.setString(2, name);
                ps.setString(3, course);
                ps.setInt(4, semester);

                ps.executeUpdate();
                message = "Student added successfully!";
            }

        } catch (NumberFormatException e) {
            message = "Please enter a valid semester.";

        } catch (SQLException e) {
            e.printStackTrace();

            if (e.getErrorCode() == 1062) {
                message = "This roll number already exists.";
            } else {
                message = "Database error: " + e.getMessage();
            }
        }

        request.setAttribute("message", message);
        request.getRequestDispatcher("addStudent.jsp")
                .forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect("addStudent.jsp");
    }
}
