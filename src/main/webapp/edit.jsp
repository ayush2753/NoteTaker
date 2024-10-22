<%@page import="com.entities.Notesmaker"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file= "all_js.jsp"%>
<title>Update your notes</title>
</head>
<body>
		<div class = "container">
			<%@include file= "Navbar.jsp" %>
			<br>
			<h1>Update your Note.....</h1>
			
			
			<%
				int notesId = Integer.parseInt(request.getParameter("notes_id").trim());
	
				Session s=FactoryProvider.getFactory().openSession();
				Notesmaker note =  (Notesmaker)s.get(Notesmaker.class, notesId);
				
				
			%>
			<form action="UpdateServlet" method="post">
			  
			  <input value= "<%= note.getId() %>" name="notesid" type="hidden"/>
			  
			  <div class="mb-3">
			    <label for="Title" class="form-label">Note Title</label>
			    <input value="<%= note.getTitle()%>" name="title" required="required" type="text" class="form-control" id="Title" aria-describedby="emailHelp">
			   
			  </div>
			  <div class="mb-3">
			    <label for="content" class="form-label">Note Content</label>
			  	<textarea 
			  		 name="content"
				  	 required="required" 
				  	 id="content"
				  	 placeholder="Enter your content here"
				  	 class="form-control"
				  	 style="height:200px"><%=note.getContent()%>
			  	 </textarea>
			  </div>
			  <div class="container text-center">
			  <button type="submit" class="btn btn-success">Update</button>
			  </div>
  
			</form>
	</div>
</body>
</html>