
package com.mycompany.StudentAttendenceSystem;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    public static Connection getConnection() throws SQLException {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL JDBC Driver not found.", e);
        }

        Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/attendance_db?useSSL=false&serverTimezone=UTC",
                "root",
                "Sumit@1234"
        );

        System.out.println("Database Connected Successfully!");

        return con;
    }
}
