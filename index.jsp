<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #007bff;
            color: white;
        }
    </style>
</head>
<body>
    <h1>Book Management System</h1>
    <p>Welcome to the Book Management System. Below is the list of available books:</p>

    <table>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Author</th>
            <th>Price</th>
            <th>Published Year</th>
        </tr>
        <%
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                // Load the MySQL driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Connect to the database
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/BookDB", "root", "root@dk");

                // Execute SQL query
                stmt = conn.createStatement();
                String sql = "SELECT * FROM books";
                rs = stmt.executeQuery(sql);

                // Display the results
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String title = rs.getString("title");
                    String author = rs.getString("author");
                    double price = rs.getDouble("price");
                    int publishedYear = rs.getInt("published_year");
        %>
        <tr>
            <td><%= id %></td>
            <td><%= title %></td>
            <td><%= author %></td>
            <td><%= price %></td>
            <td><%= publishedYear %></td>
        </tr>
        <%
                }
            } catch (Exception e) {
                out.println("<tr><td colspan='5'>Error: " + e.getMessage() + "</td></tr>");
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
    </table>
</body>
</html>
