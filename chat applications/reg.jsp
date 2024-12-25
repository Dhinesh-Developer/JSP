<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            background: linear-gradient(to bottom, #141414, #000);
            font-family: Arial, sans-serif;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            overflow: hidden;
        }

        .register-container {
            background-color: rgba(0, 0, 0, 0.8);
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.5);
            text-align: center;
            width: 400px;
            animation: fadeIn 1.5s ease-in-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .register-container h1 {
            font-size: 2em;
            margin-bottom: 20px;
        }

        .register-container form {
            display: flex;
            flex-direction: column;
        }

        .register-container label {
            margin-bottom: 10px;
            font-size: 1.2em;
        }

        .register-container input {
            padding: 10px;
            border: none;
            border-radius: 5px;
            margin-bottom: 15px;
            font-size: 1em;
            background: rgba(255, 255, 255, 0.1);
            color: white;
        }

        .register-container input:focus {
            outline: none;
            background: rgba(255, 255, 255, 0.2);
        }

        .register-container input[type="submit"] {
            background: #e50914;
            cursor: pointer;
            font-size: 1.2em;
            transition: background 0.3s;
        }

        .register-container input[type="submit"]:hover {
            background: #f40612;
        }

        .register-container p {
            margin-top: 20px;
        }

        .register-container p a {
            color: #e50914;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s;
        }

        .register-container p a:hover {
            color: #f40612;
        }

        .emoji {
            font-size: 2em;
            margin-bottom: 20px;
            animation: bounce 1.2s infinite;
        }

        @keyframes bounce {
            0%, 100% {
                transform: translateY(0);
            }
            50% {
                transform: translateY(-10px);
            }
        }
    </style>
</head>
<body>
    <div class="register-container">
        <div class="emoji">🎉</div>
        <h1>Join the Fun</h1>
        <form method="post">
            <label for="uName">Username:</label>
            <input type="text" id="uName" name="uName" required>

            <label for="uPasswd">Password:</label>
            <input type="password" id="uPasswd" name="uPasswd" required>

            <input type="submit" value="Register">
        </form>
        <p>Already have an account? <a href="login1.jsp">Login Here</a></p>
    </div>

    <%
        if (request.getMethod().equalsIgnoreCase("POST")) {
            String uName = request.getParameter("uName");
            String uPasswd = request.getParameter("uPasswd");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/whatsapp", "root", "root@dk");
                PreparedStatement pstmt = con.prepareStatement("INSERT INTO users (uName, uPasswd) VALUES (?, ?)");
                pstmt.setString(1, uName);
                pstmt.setString(2, uPasswd);

                int rowsInserted = pstmt.executeUpdate();
                con.close();

                if (rowsInserted > 0) {
                    out.println("<script>alert('Registration successful!');</script>");
                } else {
                    out.println("<script>alert('Registration failed. Please try again.');</script>");
                }
            } catch (ClassNotFoundException | SQLException e) {
                out.println("<script>alert('Error: " + e.getMessage() + "');</script>");
            }
        }
    %>
</body>
</html>
