<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chat Application</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #141414;
            color: #ffffff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: linear-gradient(to bottom, #0f0f0f, #141414);
            overflow: hidden;
        }

        .container {
            text-align: center;
            animation: fadeIn 2s ease-in-out;
        }

        h2 {
            font-size: 2.5rem;
            color: #e50914;
            margin-bottom: 20px;
            animation: zoomIn 1.5s ease-in-out;
        }

        h3 a {
            color: #ffffff;
            font-size: 1.5rem;
            text-decoration: none;
            padding: 10px 20px;
            border: 2px solid #e50914;
            border-radius: 5px;
            transition: all 0.3s ease-in-out;
        }

        h3 a:hover {
            background-color: #e50914;
            color: #ffffff;
            transform: scale(1.1);
            box-shadow: 0 0 10px #e50914, 0 0 40px #e50914;
        }

        @keyframes fadeIn {
            0% {
                opacity: 0;
                transform: translateY(-50px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes zoomIn {
            0% {
                transform: scale(0.8);
                opacity: 0.5;
            }
            100% {
                transform: scale(1);
                opacity: 1;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Welcome to Chat Application</h2>
        <h3><a href="reg.jsp">Click Here to Register</a></h3>
    </div>
</body>
</html>
