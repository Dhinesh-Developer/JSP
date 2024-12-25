<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Our Services</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background-color: #e6f7ff; /* Light blue background */
            color: #004d80; /* Darker blue text for contrast */
            font-family: 'Arial', sans-serif;
        }
        .container {
            padding: 40px 20px;
        }
        .services-header {
            text-align: center;
            margin-bottom: 40px;
            color: #007acc; /* A brighter shade of blue */
        }
        .card {
            background-color: #ffffff; /* White cards for a clean look */
            border: 1px solid #007acc;
            color: #004d80;
        }
        .card:hover {
            transform: scale(1.05);
            transition: 0.3s ease-in-out;
            border-color: #005c99; /* Darker blue on hover */
        }
        .footer {
            margin-top: 40px;
            padding: 10px;
            background-color: #cceeff; /* Light blue footer */
            color: #004d80;
            text-align: center;
        }
    </style>
</head>
<body>

    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #cceeff;">
        <div class="container-fluid">
            <a class="navbar-brand" href="#" style="color: #004d80;">DKPort</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="trans.jsp" style="color: #004d80;">Home</a>
                    </li>
                      <li class="nav-item">
                        <a class="nav-link" href="signup.jsp" style="color: #004d80;">Register</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="signin.jsp" style="color: #004d80;">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="aboutus.jsp" style="color: #004d80;">About Us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="service.jsp" style="color: #004d80;">Services</a>
                    </li>
                    
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container">
        <h1 class="services-header">Our Premium Services</h1>
        <p class="text-center">
            Discover our comprehensive range of services designed to meet your maritime and logistics needs.
            Our team of experts ensures exceptional quality and efficiency in every aspect.
        </p>

        <div class="row mt-4">
            <!-- Service 1 -->
            <div class="col-md-4">
                <div class="card mb-4">
                    <div class="card-body text-center">
                        <h5 class="card-title">Cargo Management</h5>
                        <p class="card-text">Efficient cargo handling and logistics solutions tailored to your needs.</p>
                    </div>
                </div>
            </div>
            <!-- Service 2 -->
            <div class="col-md-4">
                <div class="card mb-4">
                    <div class="card-body text-center">
                        <h5 class="card-title">Ship Maintenance</h5>
                        <p class="card-text">Comprehensive maintenance services to keep your fleet in top condition.</p>
                    </div>
                </div>
            </div>
            <!-- Service 3 -->
            <div class="col-md-4">
                <div class="card mb-4">
                    <div class="card-body text-center">
                        <h5 class="card-title">Marine Consultancy</h5>
                        <p class="card-text">Expert advice to navigate complex maritime regulations and challenges.</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mt-4">
            <!-- Service 4 -->
            <div class="col-md-6">
                <div class="card mb-4">
                    <div class="card-body text-center">
                        <h5 class="card-title">Offshore Support</h5>
                        <p class="card-text">Comprehensive offshore support for drilling, wind farms, and more.</p>
                    </div>
                </div>
            </div>
            <!-- Service 5 -->
            <div class="col-md-6">
                <div class="card mb-4">
                    <div class="card-body text-center">
                        <h5 class="card-title">Crew Management</h5>
                        <p class="card-text">Providing skilled and experienced crew for your vessels.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <div class="footer">
        &copy; 2024 Our Company. All Rights Reserved.
    </div>

    <!-- Bootstrap JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-NZKfPff8U6OSOGbdDbH0xH6juc5WSjeDE
