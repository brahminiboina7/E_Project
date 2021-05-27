<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
 <%@ page import="java.text.*,java.util.*,java.sql.Driver, java.sql.DriverManager,java.sql.*,javax.sql.*,javax.naming.*,java.io.*,java.net.URLEncoder" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee details</title>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
		<script>
		function verify(){
		alert("Im verifying");
		var x=confirm('Are you sure you want to delete?');
			if (x) {
		 		//form.action='/JSP_pro/View.jsp?action=delete&emp_id='+emp_id;
		 	} 
			else {
				return false;
			}
		 </script>
		<style>
		
			h1 {
			
				color :Crimson;
				text-align: center;
				font: bold 40px candara;
				text-shadow: 0 1px #808d93,
							-1px 0 #cdd2d5,
							-1px 2px #808d93,
							-2px 1px #cdd2d5,
							-2px 3px #808d93,
							-3px 2px #cdd2d5,
							-3px 4px #808d93,
							-4px 3px #cdd2d5,
							-4px 5px #808d93,
							-5px 4px #cdd2d5,
							-5px 6px #808d93,
							-6px 5px #cdd2d5,
							-6px 7px #808d93,
							-7px 6px #cdd2d5,
							-7px 8px #808d93,
							-8px 7px #cdd2d5;
							
			}
			
			h2 {
				
				color: blue;
				width:80%
				font: bold 20px;
				font-family:candara;
				text-align: center;
				
			}
			
			#emp {
				
				border-collapse: collapse;
				width:100%
				border-spacing: 5px;
				font-family: Arial, Helvetica, sans-serif;
				background-color: green;
				text-align: center;
				margin-left:auto;
				margin-right:auto
			}
			
			#emp th,td {
			
				border: 1px solid #ddd;
				padding: 20px;
				text-align:center;
				
			}
			
			#emp tr:nth-child(even){
			
				background-color: #f2f2f2;
				
			}
			#emp th{
			
				background-color: #4CAF50;
				text-align: center;
			}
			
			
			#emp tr:hover {
			
				background-color: white;
				
			}
			
			#emp, th {
				
				padding-top: 12px;
				padding-bottom: 12px;
				text-align: left;
				background-color: #ddd ;
				color: black;
				
			}
			
			body{
			
				background-repeat: repeat;
				background-size:100%;
				
			}
			
			.container {
				
				position : relative;
				left :80%;
			}
			
		</style>
	
		
	</head>
	
	<body background = "https://images.unsplash.com/photo-1596079890744-c1a0462d0975?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8b2ZmaWNlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80">
		<form action = "/JSP_pro/View.jsp">
		<h1>Employee Registration</h1>
		
		<div class = "container">
		
		<p>
			<a href = "http://localhost:8080/JSP_pro/AddEditEmp.jsp?action=ADD">
				<span class="glyphicon glyphicon-edit"></span>
				ADD NEW
			</a><br>
			</div>
		
		<div id ="emp_data">
			
		
 			<% 
 			//Connection con = null;
 			//con = ConnectionDAO.getcon();
 	        	
        		 Connection con = null;
        		 Class driver_Class = Class.forName("com.mysql.jdbc.Driver");
        		
        		Driver driver = (Driver) driver_Class.newInstance();
				con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/empdet", "root", "wicore123");
        		
				PreparedStatement ps = null;
 	       		ResultSet rs = null;
          		String query = "select emp_id, firstname, lastname, gender, phonenumber, email, state, Address, Employeedesignation from empdetails";
          		 ps = con.prepareStatement(query);
          		 rs = ps.executeQuery();
        
        		if(rs.next()) {
        			
					rs.beforeFirst();
			
        	%>
        	
        			<table border=1 width=10% height=10% align="center" id = emp>
        			    	<tr>
        					<th>emp_id</th>
        					<th>firstName</th>
        					<th>LastName</th>
        					<th>Gender</th>
        					<th>PhoneNumber</th>
        					<th>Email</th>
        					<th>State</th>
        					<th>Address</th>
        					<th>Employeedesignation</th>
        					<th>ACTION</th>
        				<tr>
        				
         				<% while (rs.next()) { %>
         				<%int emp_id = rs.getInt("emp_id"); %>
         				<tr>
         					<td><%=rs.getInt("emp_id")%></td>
           					<td><%=rs.getString("firstname")%></td> 
            				<td><%=rs.getString("lastname")%></td>
            				<td><%=rs.getString("gender")%></td>
              				<td><%=rs.getString("phonenumber")%></td>
               				<td><%=rs.getString("email")%></td>
                			<td><%=rs.getString("state")%></td>
               	 			<td><%=rs.getString("Address")%></td>
                			<td><%=rs.getString("Employeedesignation")%></td>
                			<td><a href = 'http://localhost:8080/JSP_pro/AddEditEmp.jsp?action=edit&emp_id=<%=emp_id %>'><span class=\"glyphicon glyphicon-pencil\">edit</span></a><br><a href = 'http://localhost:8080/JSP_pro/AddEditEmp.jsp?action=delete&emp_id=<%=emp_id%>'><span class=\"glyphicon glyphicon-trash\" onclick="if (confirm('Are you sure you want to delete?')) { form.action='/JSP_pro/View.jsp?action=delete&emp_id=<%=emp_id %>'; } else { return false; }">delete</span></a></td>
                			</tr>
                			<%System.out.println("emp_id is"+emp_id); %>
                		
          				<% } %>"
          		
          			</table>
          	
        	<%} else { %>
        	
            		<p><h2>No records found</h2></p>
           
       		 <%}
        
        	if (rs!=null) {rs.close();rs=null;}
        	if (ps!=null) {ps.close();ps=null;}
        	if (con!=null) {con.close();con=null;}
        		
        	%>
		<br>
		</div>
		</form>
	</body>
</html>           
                