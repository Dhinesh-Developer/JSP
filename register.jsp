<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register</title>
</head>
<body>
<center>
	<h1>Register</h1>
    <form action="register.jsp" method="post">
        <label>Username:</label>
        <input type="text" name="uName" required><br>
        <label>Email:</label>
        <input type="email" name="uEmail" required><br>
        <label>Password:</label>
        <input type="password" name="uPasswd" required><br>
        <input type="submit" value="Register">
    </form>
</center>

	
	<%
	if(request.getMethod().equalsIgnoreCase("POST"))
	{
		String uName = request.getParameter("uName");
		String uEmail = request.getParameter("uEmail");
		String uPasswd = request.getParameter("uPasswd");
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/article_db","root","root@dk");
		PreparedStatement pstmt = con.prepareStatement("insert into users(uName,uEmail,uPasswd) values (?,?,?)");
		pstmt.setString(1, uName);
		pstmt.setString(2, uEmail);
		pstmt.setString(3, uPasswd);
		int x = pstmt.executeUpdate();
		con.close();
		%>
		<p>Registertion Success.<a href="home.jsp">Login here</a>
		<% 
	} catch (ClassNotFoundException | SQLException e) {
		e.printStackTrace();
	}
	}
	
	%>
</body>
</html>