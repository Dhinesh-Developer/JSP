<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    Integer uId = (Integer) session.getAttribute("uId");
    if (uId == null) {
        response.sendRedirect("login1.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chat Room</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #141414;
            color: #fff;
        }
        h2 {
            font-size: 2.5rem;
            margin: 20px;
            text-align: center;
            color: #e50914;
            animation: fadeIn 2s;
        }
        form {
            background-color: #222;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            max-width: 400px;
            margin: 20px auto;
            animation: slideIn 1s;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-size: 1.2rem;
        }
        input, textarea, button {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
        }
        input, textarea {
            background-color: #333;
            color: #fff;
        }
        button {
            background-color: #e50914;
            color: #fff;
            cursor: pointer;
            transition: transform 0.2s;
        }
        button:hover {
            transform: scale(1.05);
        }
        ul {
            list-style: none;
            padding: 0;
            max-width: 600px;
            margin: 20px auto;
            animation: fadeIn 2s;
        }
        li {
            background-color: #222;
            padding: 15px;
            margin-bottom: 10px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
            font-size: 1rem;
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
        @keyframes slideIn {
            from {
                transform: translateY(50px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }
    </style>
</head>
<body>
    <center>
        <h2>📬 Chat Room</h2>
        <form method="post">
            <label>Send To (User ID):</label>
            <input type="number" name="rId" placeholder="Enter recipient ID" required>
            
            <label>Message:</label>
            <textarea name="messages" placeholder="Type your message here..." required></textarea>
            
            <button type="submit">Send 💌</button>
        </form>
        <ul>
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/whatsapp", "root", "root@dk");

                    if ("POST".equalsIgnoreCase(request.getMethod())) {
                        int rId = Integer.parseInt(request.getParameter("rId"));
                        String messages = request.getParameter("messages");

                        PreparedStatement pstmt = con.prepareStatement("INSERT INTO messages (sId, rId, messages) VALUES (?, ?, ?)");
                        pstmt.setInt(1, uId);
                        pstmt.setInt(2, rId);
                        pstmt.setString(3, messages);
                        pstmt.executeUpdate();
                    }

                    PreparedStatement ps = con.prepareStatement("SELECT * FROM messages WHERE sId = ? OR rId = ?");
                    ps.setInt(1, uId);
                    ps.setInt(2, uId);

                    ResultSet res = ps.executeQuery();
                    while (res.next()) {
                        out.println("<li><b>From:</b> " + res.getInt("sId") +
                                    " <b>To:</b> " + res.getInt("rId") +
                                    " <b>Message:</b> " + res.getString("messages") +
                                    " <b>Time:</b> " + res.getTimestamp("timestamp") + "</li>");
                    }
                    con.close();
                } catch (ClassNotFoundException | SQLException e) {
                    out.println("<p>Error: " + e.getMessage() + "</p>");
                }
            %>
        </ul>
    </center>
</body>
</html>
