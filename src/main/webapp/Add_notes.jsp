<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>NoteTaker: add notes</title>
<%@include file= "all_js.jsp"%>
</head>
<body style="background-color: #87A2FF">
		<div class = "container-fluid p-0">
		<%@include file= "Navbar.jsp" %>
		<br>
	<div class="m-3">
		<h1>Please fill your details to add notes</h1>
	<br>
	<!-- this is addnotes form -->
	<form action="SaveNoteServlet" method="post">
	
  <div class="mb-3">
    <label for="Title" class="form-label">Note Title</label>
    <input name="title" required="required" type="text" class="form-control" id="Title" aria-describedby="emailHelp">
   
  </div>
  <div class="mb-3">
    <label for="content" class="form-label">Note Content</label>
  	<textarea 
  		 name="content"
	  	 required="required" 
	  	 id="content"
	  	 placeholder="Enter your content here"
	  	 class="form-control"
	  	 style="height:200px">
  	 </textarea>
  </div>
  <div class="container text-center">
  <button type="submit" class="btn btn-primary">Add</button>
  </div>
  
</form>
	</div>
	</div>
	
</body>
</html>