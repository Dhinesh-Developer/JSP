<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <style>
        body {
            background-color: #141414;
            color: white;
            font-family: 'Arial', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .form-container {
            background-color: rgba(0, 0, 0, 0.8);
            padding: 30px;
            border-radius: 10px;
            width: 100%;
            max-width: 400px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            animation: fadeIn 1s ease-in-out;
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 2.5rem;
            color: #e50914;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-size: 1rem;
            margin-bottom: 5px;
            color: #bbb;
        }

        input {
            background-color: #333;
            border: 1px solid #555;
            color: #fff;
            padding: 10px;
            border-radius: 5px;
            width: 100%;
            font-size: 1rem;
        }

        button {
            width: 100%;
            background-color: #e50914;
            color: white;
            padding: 10px;
            border-radius: 5px;
            font-size: 1.2rem;
            border: none;
        }

        button:hover {
            background-color: #f40612;
        }

        /* Add animation for fadeIn effect */
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

    </style>
</head>

<body>

    <div class="form-container">
        <h1>Sign In</h1>
        <form method="post">
            <div class="form-group">
                <label for="uName">Name</label>
                <input type="text" class="form-control" id="uName" name="uName" placeholder="Enter your name" required>
            </div>
            <div class="form-group">
                <label for="uEmail">Email Address</label>
                <input type="email" class="form-control" id="uEmail" name="uEmail" placeholder="Enter your email" required>
            </div>
            <div class="form-group">
                <label for="uPasswd">Password</label>
                <input type="password" class="form-control" id="uPasswd" name="uPasswd" placeholder="Enter your password" required>
            </div>

            <button type="submit">Submit</button>
        </form>
        <%
            if (request.getMethod().equalsIgnoreCase("POST")) {
                String uName = request.getParameter("uName");
                String uEmail = request.getParameter("uEmail");
                String uPasswd = request.getParameter("uPasswd");
                boolean isValid = false;

                try {
                    // Database connection
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/transport", "root", "root@dk");

                    // Query to validate user
                    String query = "SELECT * FROM user WHERE uName = ? AND uEmail = ? AND uPasswd = ?";
                    PreparedStatement pstmt = con.prepareStatement(query);
                    pstmt.setString(1, uName);
                    pstmt.setString(2, uEmail);
                    pstmt.setString(3, uPasswd);
                    ResultSet rs = pstmt.executeQuery();

                    isValid = rs.next(); // Check if a result exists

                    rs.close();
                    pstmt.close();
                    con.close();

                } catch (ClassNotFoundException | SQLException e) {
                    e.printStackTrace();
                }

                if (isValid) {
                    // Redirect to a success page
                    response.sendRedirect("trans.jsp");
                } else {
                    // Redirect to a failure page
                    response.sendRedirect("signup.jsp");
                }
            }
        %>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

</body>

</html>
