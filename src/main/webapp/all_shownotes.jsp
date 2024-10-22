<%@page import="org.hibernate.query.Query"%>
<%@page import="com.entities.Notesmaker"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entities.*"%>
<%@page import="com.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file= "all_js.jsp"%>
<title>All Notes: noteTaker</title>
</head>
<body style="background-color: #87A2FF">
		<div class = "container-fluid p-0">
		<%@include file= "Navbar.jsp" %>
		<br>
		<div class="m-3">
			<h1 class="text-uppercase">Your notes</h1>
		<div class="row">
			<div class="col-12">
				<%
					Session s=FactoryProvider.getFactory().openSession();
					Query q = s.createQuery("from Notesmaker",Notesmaker.class);
					List<Notesmaker> list=q.list();
					
					for(Notesmaker notes: list)
					{
						%>
						 <!-- out.println(notes.getId()+" : "+notes.getTitle()+"<br>" ); --> 
						<div class="card mt-3" style="background-color: #FFFBE6">
						  <img src="img/post-it.png" style="max-width:50px" class="card-img-top m-2" alt="...">
						  <div class="card-body">
						    <h5 class="card-title p-2"><%= notes.getTitle()%></h5>
						    <p class="card-text p-2"><%= notes.getContent()%></p>
						    <p><b><%= notes.getAddedDate() %></b></p>
						    <a href="DeleteServlet?notes_id=<%=notes.getId() %>" class="btn btn-danger">Delete</a>
						    <a href="edit.jsp?notes_id=<%= notes.getId()%>" class="btn btn-primary">Update</a>
						  </div>
						</div>
						
						<% 
					}
					s.close();
				%>
			</div>
		</div>
		
		
		</div>
	
	</div>
</body>
</html>