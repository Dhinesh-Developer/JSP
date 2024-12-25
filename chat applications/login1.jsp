<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #141414;
            color: white;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            background-color: rgba(0, 0, 0, 0.85);
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            animation: fadeIn 1.2s ease-in-out;
        }

        h1 {
            color: #e50914;
        }

        label {
            display: block;
            margin: 10px 0 5px;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: none;
            border-radius: 5px;
        }

        input[type="submit"] {
            background-color: #e50914;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #b20710;
        }

        .emoji {
            font-size: 3rem;
            animation: bounce 1.5s infinite;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        @keyframes bounce {
            0%, 20%, 50%, 80%, 100% {
                transform: translateY(0);
            }
            40% {
                transform: translateY(-20px);
            }
            60% {
                transform: translateY(-10px);
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <center>
            <span class="emoji">🔑</span>
            <h1>Login</h1>
            <form method="post">
                <label>Username:</label>
                <input type="text" name="uName" required>

                <label>Password:</label>
                <input type="password" name="uPasswd" required>

                <input type="submit" value="Login">
            </form>
        </center>
        <%
            if (request.getMethod().equalsIgnoreCase("POST")) {
                String uName = request.getParameter("uName");
                String uPasswd = request.getParameter("uPasswd");

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/whatsapp", "root", "root@dk");
                    PreparedStatement pstmt = con.prepareStatement("SELECT * FROM users WHERE uName = ? AND uPasswd = ?");
                    pstmt.setString(1, uName);
                    pstmt.setString(2, uPasswd);

                    ResultSet rs = pstmt.executeQuery();
                    if (rs.next()) {
                        session.setAttribute("uId", rs.getInt("uId"));
                        response.sendRedirect("inter.jsp");
                    } else {
                        out.println("<p style='color: #e50914;'>Invalid username or password.</p>");
                    }
                    con.close();
                } catch (ClassNotFoundException | SQLException e) {
                    out.println("<p style='color: #e50914;'>Error: " + e.getMessage() + "</p>");
                }
            }
        %>
    </div>
</body>
</html>
