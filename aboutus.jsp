<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>About Us</title>
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
        .about-header {
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
    <div class="collapse navbar-collapse" id="navbarNav">
     <a class="navbar-brand" href="#" style="color: #004d80;">DKPort</a>
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
    </nav>

    <!-- Main Content -->
    <div class="container">
        <h1 class="about-header">About Our Journey</h1>
        <p>
            Welcome to our ship-based enterprise! Since our inception, we have been committed to delivering unparalleled
            service and building long-lasting relationships with our clients. Our team works tirelessly to provide 
            reliable, innovative, and sustainable maritime solutions.
        </p>

        <div class="row mt-4">
            <!-- About Section 1 -->
            <div class="col-md-4">
                <div class="card mb-4">
                    <div class="card-body text-center">
                        <h5 class="card-title">Our Mission</h5>
                        <p class="card-text">To revolutionize the maritime industry by offering cutting-edge solutions that prioritize efficiency and sustainability.</p>
                    </div>
                </div>
            </div>
            <!-- About Section 2 -->
            <div class="col-md-4">
                <div class="card mb-4">
                    <div class="card-body text-center">
                        <h5 class="card-title">Our Vision</h5>
                        <p class="card-text">To be the global leader in ship-based logistics and marine services, empowering businesses and individuals to achieve their goals on the open seas.</p>
                    </div>
                </div>
            </div>
            <!-- About Section 3 -->
            <div class="col-md-4">
                <div class="card mb-4">
                    <div class="card-body text-center">
                        <h5 class="card-title">Our Values</h5>
                        <p class="card-text">Integrity, innovation, customer-centricity, and environmental stewardship guide everything we do.</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mt-4">
            <!-- Leadership Section -->
            <div class="col-md-6">
                <div class="card mb-4">
                    <div class="card-body text-center">
                        <h5 class="card-title">Leadership</h5>
                        <p class="card-text">Our team of experienced leaders drives the strategic direction and ensures seamless execution of all operations.</p>
                    </div>
                </div>
            </div>
            <!-- Innovation Section -->
            <div class="col-md-6">
                <div class="card mb-4">
                    <div class="card-body text-center">
                        <h5 class="card-title">Innovation</h5>
                        <p class="card-text">We invest in state-of-the-art technology to enhance our services and create a better future for the maritime industry.</p>
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
        integrity="sha384-NZKfPff8U6OSOGbdDbH0xH6juc5WSjeDEscfh4X95/JV6iwXZwlXtd8f5Dhe1b36"
        crossorigin="anonymous"></script>
</body>
</html>
