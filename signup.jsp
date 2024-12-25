<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
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
            padding: 40px;
            border-radius: 10px;
            width: 100%;
            max-width: 500px;
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
        <h1>Sign Up</h1>
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
                Connection con = null;
                PreparedStatement pstmt = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/transport", "root", "root@dk");
                    String sql = "INSERT INTO user (uName, uEmail, uPasswd) VALUES (?, ?, ?)";
                    pstmt = con.prepareStatement(sql);
                    pstmt.setString(1, uName);
                    pstmt.setString(2, uEmail);
                    pstmt.setString(3, uPasswd);
                    int rowsInserted = pstmt.executeUpdate();

                    if (rowsInserted > 0) {
                        out.println("<p>Registration successful. <a href='trans.jsp'>Go to Dashboard</a></p>");
                    } else {
                        out.println("<p>Registration failed. Please try again.</p>");
                    }
                } catch (ClassNotFoundException | SQLException e) {
                    e.printStackTrace();
                    out.println("<p>Error: " + e.getMessage() + "</p>");
                } finally {
                    if (pstmt != null) try { pstmt.close(); } catch (SQLException ignored) {}
                    if (con != null) try { con.close(); } catch (SQLException ignored) {}
                }
            }
        %>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

</body>

</html>
