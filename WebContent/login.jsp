<html>
<body>

<%@ page import="java.sql.*" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.ParseException" %>

	<%
	
		Connection connection=null;
	
		try{
			Class.forName("org.postgresql.Driver");
			connection = DriverManager.getConnection("jdbc:postgresql://babar.elephantsql.com:5432/iuaamwwy",
					"iuaamwwy", "6vCxo1SlLCp4gCVPcLhpz9T8_znSBwWX");
			connection.setAutoCommit(true);
			
			Statement stmt = connection.createStatement();
			
			String user_nameId = request.getParameter("userId");

			ResultSet rs = stmt.executeQuery("SELECT * FROM users "+
				"WHERE user_name = "+"'"+user_nameId+"'");
			
			String UserID = "";
			while ( rs.next() ) {
				UserID = rs.getString(1);
			}
			connection.close();
			
			if(UserID==""){
				%>
	    		<script>
    				alert("No such user");
    				window.location.href = "login-page.html";
    			</script>
    			<%
			}else{
				response.sendRedirect("index.html");
			}
			//response.sendRedirect("index.html");
			//response.sendRedirect("www.google.com");
			
		}catch(SQLException sqle){
        	out.println(sqle.getMessage());
        	%>
    		<script>
    			alert("No such user or DB Connection error");
    			window.location.href = "login-page.html";
    		</script>
    		<%
   		 }catch (Exception e) {
            out.println(e.getMessage());
         }
		
	%>

</body>
</html>