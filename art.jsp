<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Article Management</title>
  
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
 
    <style>
        body {
            background-color: #141414;
            color: #fff;
            font-family: 'Roboto', sans-serif;
        }
        .navbar {
            background-color: #181818;
        }
        .navbar-brand {
            font-weight: bold;
            color: #e50914 !important;
        }
        .navbar a {
            color: #fff !important;
        }
        .navbar a:hover {
            color: #e50914 !important;
        }
        .form-section {
            margin-top: 30px;
            background-color: #202020;
            padding: 20px;
            border-radius: 8px;
        }
        .btn-red {
            background-color: #e50914;
            color: #fff;
        }
        .btn-red:hover {
            background-color: #b00610;
        }
        .table {
            color: #fff;
        }
    </style>
</head>
<body>
  
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Article Manager</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link" href="#addForm">Add</a></li>
                    <li class="nav-item"><a class="nav-link" href="#updateForm">Update</a></li>
                    <li class="nav-item"><a class="nav-link" href="#deleteForm">Delete</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-5">
        <!-- Display Articles -->
        <h2 class="text-center">All Articles</h2>
        <table class="table table-dark table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Text</th>
                </tr>
            </thead>
            <tbody>
                <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/art", "root", "root@dk");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM art");
                    while (rs.next()) {
                        int id = rs.getInt("aId");
                        String title = rs.getString("aTitle");
                        String text = rs.getString("aText");
                %>
                <tr>
                    <td><%= id %></td>
                    <td><%= title %></td>
                    <td><%= text %></td>
                </tr>
                <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
                %>
            </tbody>
        </table>

        <!-- Add Article -->
        <div class="form-section" id="addForm">
            <h3>Add Article</h3>
            <form method="post">
                <div class="mb-3">
                    <label class="form-label">Title</label>
                    <input type="text" class="form-control" name="aTitle" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Text</label>
                    <textarea class="form-control" name="aText" rows="3" required></textarea>
                </div>
                <button type="submit" class="btn btn-red">Add Article</button>
            </form>
            <%
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String aTitle = request.getParameter("aTitle");
                String aText = request.getParameter("aText");
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/art", "root", "root@dk");
                    PreparedStatement pstmt = con.prepareStatement("INSERT INTO art (aTitle, aText) VALUES (?, ?)");
                    pstmt.setString(1, aTitle);
                    pstmt.setString(2, aText);
                    pstmt.executeUpdate();
                    response.sendRedirect(request.getRequestURI());
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            %>
        </div>

        <!-- Update Article -->
        <div class="form-section" id="updateForm">
            <h3>Update Article</h3>
            <form method="post">
                <div class="mb-3">
                    <label class="form-label">Article ID</label>
                    <input type="number" class="form-control" name="aId" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">New Title</label>
                    <input type="text" class="form-control" name="aTitle" required>
                </div>
                <button type="submit" class="btn btn-red">Update Article</button>
            </form>
            <%
            if ("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("aId") != null) {
                int aId = Integer.parseInt(request.getParameter("aId"));
                String aTitle = request.getParameter("aTitle");
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/art", "root", "root@dk");
                    PreparedStatement pstmt = con.prepareStatement("UPDATE art SET aTitle = ? WHERE aId = ?");
                    pstmt.setString(1, aTitle);
                    pstmt.setInt(2, aId);
                    pstmt.executeUpdate();
                    response.sendRedirect(request.getRequestURI());
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            %>
        </div>

        <!-- Delete Article -->
        <div class="form-section" id="deleteForm">
            <h3>Delete Article</h3>
            <form method="post">
                <div class="mb-3">
                    <label class="form-label">Article ID</label>
                    <input type="number" class="form-control" name="aId" required>
                </div>
                <button type="submit" class="btn btn-red">Delete Article</button>
            </form>
            <%
            if ("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("aId") != null) {
                int aId = Integer.parseInt(request.getParameter("aId"));
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/art", "root", "root@dk");
                    PreparedStatement pstmt = con.prepareStatement("DELETE FROM art WHERE aId = ?");
                    pstmt.setInt(1, aId);
                    pstmt.executeUpdate();
                    response.sendRedirect(request.getRequestURI());
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            %>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
