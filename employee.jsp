<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Details</title>
</head>
<body>
<h2>Employee Details.</h2>
	<div><h3>Add More Employee</h3><a href = "add.jsp">Click here.</a></div>
	<div>
		<%
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc","root","root@dk");
		Statement stmt = con.createStatement();
		ResultSet res = stmt.executeQuery("select * from employee");
		
		while(res.next()) {
			int e_id = res.getInt("e_id");
			String e_name = res.getString("e_name");
			String email = res.getString("email");
			String dept = res.getString("dept");
			int salary = res.getInt("salary");
		
			%>
	<div>
		<table>
			<tr>
				<th><%= e_id %></th>
				<td><%= e_name %></td>
				<td><%= email %></td>
				<td><%= dept %></td>
				<td><%= salary %></td>

			</tr>
		</table>
	</div>

		<% }
	} catch (ClassNotFoundException | SQLException e) {
		e.printStackTrace();
	}
		%>
	</div>
	
</body>
</html>