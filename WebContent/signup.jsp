<html>
<body>

<%@ page import="java.sql.*" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.ParseException" %>

	<%
	
		try{
			Connection connection=null;
			Class.forName("org.postgresql.Driver");
			connection = DriverManager.getConnection("jdbc:postgresql://babar.elephantsql.com:5432/iuaamwwy",
					"iuaamwwy", "6vCxo1SlLCp4gCVPcLhpz9T8_znSBwWX");
			connection.setAutoCommit(true);
			
			Statement stmt = connection.createStatement();
			String user_nameId = request.getParameter("userId");
			String user_role = request.getParameter("userRole");
			if(user_role == "owner"){
				user_role = "0";
			}else{
				user_role = "1";
			}
			String user_age = request.getParameter("userAge");
			String user_state = request.getParameter("userState");

			int rs = stmt.executeUpdate(
					"insert into users (user_name,role,age,state)" + 
					"values('"+user_nameId+"','"+user_role+"','"+user_age+"','"+user_state+"') ");
					
			connection.close();
			response.sendRedirect("successSignup.html");
			//response.sendRedirect("www.google.com");
			
		}catch(SQLException sqle){
        	//out.println(sqle.getMessage());
        	%>
    		<script>
    			alert("Duplicate User ID or Missing Attributs");
    			window.location.href = "signup-page.html";
    		</script>
    		<% 
   		 }catch (Exception e) {
            out.println(e.getMessage());
         }
		
	%>

</body>
</html>