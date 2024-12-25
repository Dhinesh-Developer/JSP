<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import  = "java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<center>
		<div>
		<form  method = "post">
				<table>
				<tr>
					<td>Enter The e_ id: <input type="number" name ="e_id"></td>
				</tr>
				<tr>
					<td>Enter The e_ name: <input type="text" name ="e_name"></td>
				</tr>
				<tr>
					<td>Enter The email: <input type="text" name ="email"></td>
				</tr>
				<tr>
					<td>Enter The dept: <input type="text" name ="dept"></td>
				</tr>
				<tr>
					<td>Enter The salary: <input type="number" name ="salary"></td>
				</tr>
				<tr>
					<td><input type = "submit" value = "submit"></td>
				</tr>
				
			</table>
		</form>
		</div>
	</center>
	<%
	if(request.getMethod().equalsIgnoreCase("POST"))
	{
		int e_id = Integer.parseInt(request.getParameter("e_id"));
		String e_name = request.getParameter("e_name");
		String email = request.getParameter("email");
		String dept = request.getParameter("dept");
		int salary = Integer.parseInt(request.getParameter("salary"));
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbc","root","root@dk");
			PreparedStatement pstmt = con.prepareStatement("insert into employee(e_id,e_name,email,dept,salary) values (?,?,?,?,?)");
			pstmt.setInt(1, e_id);
			pstmt.setString(2, e_name);
			pstmt.setString(3, email);
			pstmt.setString(4, dept);
			pstmt.setInt(5, salary);
			
			int rowsInserted = pstmt.executeUpdate();
			
			con.close();

            if (rowsInserted > 0) {
                out.println("Registration successful!)");
            } else {
                out.println("<script>alert('Registration failed. Please try again.');</script>");
            }
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}   
	}
	%>
</body>
</html>