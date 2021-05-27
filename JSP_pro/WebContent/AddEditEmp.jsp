<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="java.text.*,java.util.*,java.sql.Driver, java.sql.DriverManager,java.sql.*,javax.sql.*,javax.naming.*,java.io.*,java.net.URLEncoder,com.Jsp.bean.Emp,com.Jsp.dao.ConnDAO,com.Jsp.dao.EmpDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Adding and Editing the employee details</title>
				<script type = "text/javascript">
				
					
					function goback(){
					
						window.history.back();
			
					}

					function add(){
			
						var firstname = document.getElementById("firstname").value;
						if(firstname == ""){
				
							alert("Please enter your first name");
							return false;
				
						}
			
						var lastname = document.getElementById("lastname").value;
						if(lastname == ""){
				
							alert("Please enter your last name");
							return false;
				
						}
			
						var gender =document.getElementById("gender").value;
						if(gender == ''){
				
							alert("select gender");
							return false;

		    			}
			
						var phno = document.getElementById("phno").value;
						if(phno == ""){
				
							alert("Please enter your phone number");
							return false;
				
						}
			
						var email = document.getElementById("email").value;
						if(email == ""){
				
							alert("Please enter your email in the format of ---@--.com");
							return false;
				
						}
			
						var state = document.getElementById("state").value;
						if(state == 'select'){
				
							alert("please enter your state");
							return false;
				
						}
			
						var Address = document.getElementById("Address").value;
						if(Address == ''){
				
							alert("Please select your address");
							return false;
							
						}
						
						var empdes = document.getElementById("empdes").value;
						if(empdes == 'select'){
							
							alert("please select your designation");
							return false;
							
						}
			
						var info = "<table cellpadding='5' cellspacing='7' border='6'><tr><th>First Name</th><th>Last Name</th><th>Gender</th><th>Mobile_no</th><th>E-mail</th><th>State</th><th>Address</th><th>Designation</th></tr><tr><td>"+firstname+"</td><td>"+lastname+"</td><td>"+gender+"</td><td>"+phno+"</td><td>"+email+"</td><td>"+state+"</td><td>"+Address+"</td><td>"+empdes+"</td></tr></table>";
							
						document.getElementById("tableinfo").innerHTML=info;
						//document.write(info);
						//document.write("<br>")
						alert("Thank You!!! You're successfully registered..");
					}
			</script>
			
			<style>
			
				#firstname{
					font-family: "Lucida Console";  
					color: blue;       
			    }
			    #lastname{   
					font-family: "Lucida Console";  
					color: blue;       
			    }
			    #phno{   
					font-family: "Lucida Console";  
					color: blue;       
			    }
			    #email{   
					font-family: "Lucida Console";  
					color: blue;       
			    }
				
			    .container{
					border: 5px outset black;
					text-align :center;
					background-color :powderblue;
					font-size :20px;
					color : #330000 ;
			    }<br>
				
		   </style>
	</head>
	<body background = "https://3.imimg.com/data3/EP/NN/MY-10075296/form-filling-service-500x500.png">

		<!-- --IF CONDITION OF EDIT -->
	<%	Connection con = ConnDAO.getcon();
		String action = request.getParameter("action");
		String emp_id = request.getParameter("emp_id");
			
		if (action.equalsIgnoreCase("edit")) {%>
	<%  
			String firstname = "firstname";
	    	String lastname = "lastname";
	    	String gender = "gender";
	    	String phonenumber = "phonenumber";
	    	String email = "email";
	    	String state = "state";
	   	 	String Address = "Address";
	    	String Employeedesignation = "Employeedesignation";
	
		 	PreparedStatement ps = null;
	     	ResultSet rs = null;
    
     		String query =" select emp_id, firstname, lastname, gender, phonenumber, email, state, Address, employeedesignation from empdetails where emp_id='"+emp_id+"'";
     		System.out.println("Edit Query : "+query);
     		System.out.println("Edit emp_id : "+emp_id);
     
	      	ps = con.prepareStatement(query);
	     	rs = ps.executeQuery();
        
	      	if(rs.next()) {
	     	   
	     	   firstname = rs.getString("firstname");
	     	   lastname = rs.getString("lastname");
	     	   gender = rs.getString("gender");
	     	   phonenumber = rs.getString("phonenumber");
	     	   email = rs.getString("email");
	     	   state = rs.getString("state");
	            Address = rs.getString("Address");
	            Employeedesignation = rs.getString("Employeedesignation");
	            
	      	}
	      	
            if (rs!=null) {rs.close();rs=null;}
            if (ps!=null) {ps.close();ps=null;}	
 
	%>
	<!-- html code for edit form -->
		<form name = "f1" action = "/JSP_pro/AddNew.jsp">
		<center>                          
				<h1><strong>Employee Registration </strong></h1>
			</center>
			<br>
			
			<div class="container">
			<p>
				First Name
				<input id = "firstname" name = "fname" value="<%=firstname%>" type="text" placeholder="Enter First Name">
			
			<p>
				Last Name 
				<input id = "lastname" name="lname" value="<%=lastname%>" type="text" placeholder = "Enter Last Name"><br>
			
			<p>
				<label name="gender" value="<%=gender%>"><b>Gender:  </b></label>
				<input  id = "gender" name="gender" type = "radio" value = "male">
				 male
				<input id = "gender" name="gender" type = "radio" value = "female">
				 female
				<input id = "gender" name="gender" type = "radio" value = "other">
				 other
			
			<p>
				Phone Number 
				<input id = "phno" name="phoneno" value="<%=phonenumber%>" type="text" placeholder = "Enter ph.no"><br>
			
			<p>
				<label><b>Email </b></label>
				<input id = "email" name="email" value="<%=email%>" type="text" placeholder = "Enter email"><br>
			
			<p>
				<label value="<%=state%>"><b>State</b></label>
				<select id = "state" name = "State">
				<option value="state"><%=state%></option>
				<option>AndhraPradesh</option>
				<option>Telangana</option>
				</select>
				
			<p>
				<label for = "text" value="<%=Address%>"><b>Employee Address</b></label>
				<textarea id = "Address" name="Address" rows = "3" colomns= "2">
			</textarea>
			
			<P>
				<label><b>Employee Designation:</b></label>
				<select id = "empdes" name = "Employee Designation">
				<option value="select"><%=Employeedesignation%></option>
				<option>Java Developer</option>   
				<option>Web Designer</option>
				<option>Software Tester</option>
				</select><br>
			<p>
				<input type = "submit" onclick = "return add()" value = "ADD">
				<input type = "submit" onclick = "return goback()" value = "BACK">
			</div>
			<input type='hidden' name='action' value="<%=action%>">	               	
			<input type='hidden' name='emp_id' value="<%=emp_id%>">
			<div id = "tableinfo" name="tableinfo" value = "tableinfo"></div>
	               
	        </form>
	        
		<% } %>
	
		<!-- --IF CONDITION OF ADD -->
		<%

		if (action.equalsIgnoreCase("ADD")) { %>

				<!-- html code for add form -->
					<form name = "f1" action = "/JSP_pro/AddNew.jsp">
					<center>                          
				<h1><strong>Employee Registration </strong></h1>
				</center>
				<br>
				
				<div class="container">
				<p>
					First Name
					<input id = "firstname" name = "fname" type="text" placeholder="Enter First Name">
				
				<p>
					Last Name 
					<input id = "lastname" name="lname"  type="text" placeholder = "Enter Last Name"><br>
				
				<p>
					<label name="gender" ><b>Gender:  </b></label>
					<input  id = "gender" name="gender" type = "radio" value = "male">
					 male
					<input id = "gender" name="gender" type = "radio" value = "female">
					 female
					<input id = "gender" name="gender" type = "radio" value = "other">
					 other
				
				<p>
					Phone Number 
					<input id = "phno" name="phoneno"  type="text" placeholder = "Enter ph.no"><br>
				
				<p>
					<label><b>Email </b></label>
					<input id = "email" name="email"  type="text" placeholder = "Enter email"><br>
				
				<p>
					<label ><b>State</b></label>
					<select id = "state" name = "State">
					<option>select</option>
					<option>AndhraPradesh</option>
					<option>Telangana</option>
					</select>
					
				<p>
					<label for = "text"><b>Employee Address</b></label>
					<textarea id = "Address" name="Address" rows = "3" colomns= "2">
					</textarea>
				
				<P>
					<label><b>Employee Designation:</b></label>
					<select id = "empdes" name = "Employee Designation">
					<option>select</option>
					<option>Java Developer</option>   
					<option>Web Designer</option>
					<option>Software Tester</option>
					</select><br>
				<p>
					<input type = "submit" onclick = "return add()" value = "ADD">
					<input type = "submit" onclick = "return goback()" value = "BACK">
				</div>
				<input type='hidden' name='action' value= "<%=action %>">
				<div id = "tableinfo" name="tableinfo" value = "tableinfo"></div>
				</form>
				
			<% } %>
			
			<%  
	 		if (action.equalsIgnoreCase("delete")) {%>
	 			<input onclick = "form.action confirm()">
					<%  System.out.println("update delete :-----"+ emp_id); 
					String delQry = "delete from empdetails where emp_id = '"+emp_id+"'";     
					 PreparedStatement ps = con.prepareStatement(delQry);
					 int count = ps.executeUpdate();
					
					 response.sendRedirect("/JSP_pro/View.jsp");
				}
			 
	
			%>
	</body>
</head>
</html>