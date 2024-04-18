<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Showing</title>
</head>
<body>
	
	<a href="/languages">Back to Index</a>
	<h1>Language Details</h1>
	
	<table border="1">
	    <tr>
	        <th>Name</th>
	        <th>Creator</th>
	        <th>Current Version</th>
	        <th>Actions</th>
	    </tr>
	    <tr>
	        <td>${language.name}</td>
	        <td>${language.creator}</td>
	        <td>${language.currentVersion}</td>
	        <td>
				<form id="edit-form-${language.id}" action="/languages/${language.id}/edit" method="GET">
	                <a href="/languages/${language.id}/edit">Edit</a>
				</form>
	            <form id="delete-form-${language.id}" action="/languages/delete/${language.id}" method="POST">
					    <input type="hidden" name="_method" value="DELETE">
	                	<input type="submit" value="delete">
				</form>
	        </td>
	    </tr>
	</table>
</body>
</html>