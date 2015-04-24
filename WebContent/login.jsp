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
			
			String user_id = "";
			String user_name = "";
			String user_role = "";
			String user_age = "";
			String user_state = "";
			
			while ( rs.next() ) {
				user_id = rs.getString(1);
				user_name = rs.getString(2);
				user_role = rs.getString(3);
				user_age = rs.getString(4);
				user_state = rs.getString(5);
			}
			connection.close();
			
			if(user_id==""){
				%>
	    		<script>
    				alert("No such user");
    				window.location.href = "login-page.html";
    			</script>
    			<%
			}else{
				
				Cookie user_id_cookie = new Cookie("user_id",user_id);
				response.addCookie(user_id_cookie);
				user_id_cookie.setMaxAge(60*60*24);
				
				Cookie user_name_cookie = new Cookie("user_name",user_name);
				response.addCookie(user_name_cookie);
				user_name_cookie.setMaxAge(60*60*24);
				
				Cookie user_role_cookie = new Cookie("user_role",user_role);
				response.addCookie(user_role_cookie);
				user_role_cookie.setMaxAge(60*60*24);
				
				Cookie user_age_cookie = new Cookie("user_age",user_age);
				response.addCookie(user_age_cookie);
				user_age_cookie.setMaxAge(60*60*24);
				
				Cookie user_state_cookie = new Cookie("user_state",user_state);
				response.addCookie(user_state_cookie);
				user_state_cookie.setMaxAge(60*60*24);
				
				
				Cookie[] cookies = request.getCookies();
				for (int i = 0; i < cookies.length; i++){
					Cookie c = cookies[i];
			        out.print("Name : " + c.getName( ) + ",  ");
			        out.print("Value: " + c.getValue( )+" <br/>");
				}
						
					
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