<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Index</title>
</head>
<body>

	<h1>Languages</h1>

    <table border="1">
	    <tr>
	        <th>Name</th>
	        <th>Creator</th>
	        <th>Current Version</th>
	        <th>Actions</th>
	    </tr>
	    <c:forEach var="languages" items="${languages}">
	        <tr>
	            <td><a href="/languages/${languages.id}">${languages.name}</a></td>
	            <td>${languages.creator}</td>
	            <td>${languages.currentVersion}</td>
	            <td>
	            
	           	<form id="delete-form-${languages.id}" action="/languages/delete/${languages.id}" method="POST">
				    <input type="hidden" name="_method" value="DELETE">
	                <input type="submit" value="delete">
				</form>
				<form id="edit-form-${languages.id}" action="/languages/${languages.id}" method="GET">
	               	<a href="/languages/${languages.id}/edit">Edit</a>
				</form>
		        </td>
			</tr>
	    </c:forEach>
	</table>
	
	<!-- Formulario para agregar un nuevo lenguaje -->
	<h2>Añadir nuevo lenguaje: </h2>
	<form:form action="/languages" method="POST" modelAttribute="language">
	    <p>
	        <form:label path="name">Nombre: </form:label>
	        <form:errors path="name" cssClass="error"/>
	        <form:input path="name"/>
	    </p>
	    <p>
	        <form:label path="creator">Creador: </form:label>
	        <form:errors path="creator" cssClass="error"/>
	        <form:input path="creator"/>
	    </p>
	    <p>
	        <form:label path="currentVersion">Versión actual: </form:label>
	        <form:errors path="currentVersion" cssClass="error"/>
	        <form:input path="currentVersion"/>
	    </p>
	    <input type="submit" value="Submit"/>
	</form:form>   

</body>
</html>