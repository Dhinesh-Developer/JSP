<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import ="java.sql.ResultSet" %>
<%@ page import ="java.sql.SQLException" %>
<%@ page import= "java.sql.Statement" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.DriverManager" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Article</title>
</head>
<body>
	<h1>Article Applications</h1>
	<h2>Informations about some article , it really worth feeling.</h2>
	<div>
	<%
	try {
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/article_db","root","root@dk");
		Statement stmt = con.createStatement();
		ResultSet res = stmt.executeQuery("select title,content from articles");
		while(res.next()) {
			String title = res.getString("title");
			String content = res.getString("content");
		
	
		%>
		
		<div>
			<h3><%= title %></h3>
			<p><%= content %></p>
		</div>
		
		<% 
		}
	}
	catch (ClassNotFoundException | SQLException e) {
		e.printStackTrace();
	}
	%>
	</div>
</body>
</html>