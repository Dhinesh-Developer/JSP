<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transport Details</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }
        .card {
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .card:hover {
            transform: scale(1.05);
            box-shadow: 0px 10px 15px rgba(0, 0, 0, 0.2);
        }
        .card-title {
            color: #007bff;
            font-weight: bold;
        }
        .card-text {
            color: #6c757d;
        }
        .navbar-brand {
            font-weight: bold;
            font-size: 1.5rem;
            color: #007bff !important;
        }
        .navbar-nav .nav-link {
            font-size: 1rem;
            color: #495057 !important;
        }
        .navbar-nav .nav-link:hover {
            color: #007bff !important;
        }
        .navbar-light .navbar-nav .nav-link.active {
            color: #007bff !important;
            font-weight: bold;
        }
        .container {
            margin-top: 50px;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm">
        <div class="container-fluid">
            <a class="navbar-brand" href="https://dhinesh3369.neocities.org/Final_port/portfolio/dk">DKPort</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="signup.jsp">Register</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="signin.jsp">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="aboutus.jsp">About Us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="service.jsp">Services</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container mt-5">
        <h1 class="text-center mb-4">Transport Details</h1>
        <div class="row g-4">
            <% 
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/transport", "root", "root@dk");
                Statement stmt = con.createStatement();
                ResultSet res = stmt.executeQuery("SELECT * FROM transport");

                while (res.next()) {
                    String tName = res.getString("tName");
                    String tRoute = res.getString("tRoute");
                    String tGoods = res.getString("tGoods");
                    String tType = res.getString("tType");
                    String tTime = res.getString("tTime");
            %>
            <div class="col-md-4">
                <div class="card h-100 shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title"><%= tName %></h5>
                        <p class="card-text"><strong>Route:</strong> <%= tRoute %></p>
                        <p class="card-text"><strong>Goods:</strong> <%= tGoods %></p>
                        <p class="card-text"><strong>Type:</strong> <%= tType %></p>
                        <p class="card-text"><strong>Time:</strong> <%= tTime %></p>
                    </div>
                </div>
            </div>
            <% 
                }
                con.close();
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            }
            %>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
