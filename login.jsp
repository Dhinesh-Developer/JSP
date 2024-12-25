<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
</head>
<body>
    <h1>Login</h1>
    <form method="post">
        <label>Username:</label>
        <input type="text" name="uName" required><br>
        <label>Password:</label>
        <input type="password" name="uPasswd" required><br>
        <input type="submit" value="Login">
    </form>

    <% 
    if (request.getMethod().equalsIgnoreCase("POST")) {
        String uName = request.getParameter("uName");
        String uPasswd = request.getParameter("uPasswd");
        boolean isValidUser = false;

        try {
            // Connect to the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/article_db", "root", "root@dk");

            // Prepare the SQL query
            String query = "SELECT * FROM users WHERE uName = ? AND uPasswd = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, uName);
            pstmt.setString(2, uPasswd);

            // Execute the query
            ResultSet res = pstmt.executeQuery();
            isValidUser = res.next(); // Check if user exists

            // Close resources
            res.close();
            pstmt.close();
            con.close();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        // Redirect based on login result
        if (isValidUser) {
            response.sendRedirect("home.jsp");
        } else {
            response.sendRedirect("register.jsp");
        }
    }
    %>
</body>
</html>
