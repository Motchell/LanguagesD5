<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Editing</title>
</head>
<body>
	
	<h2>Editar lenguaje: </h2>
	<form:form action="/languages/edit/${language.id}" method="POST" modelAttribute="language">
	<input type="hidden" name="_method" value="put"/>
	    <p>
	        <form:label path="name">Nombre: </form:label>
	        <form:errors path="name" cssClass="error"/>
	        <form:input path="name" value="${language.name}"/>
	    </p>
	    <p>
	        <form:label path="creator">Creador: </form:label>
	        <form:errors path="creator" cssClass="error"/>
	        <form:input path="creator" value="${language.creator}"/>
	    </p>
	    <p>
	        <form:label path="currentVersion">Versión actual: </form:label>
	        <form:errors path="currentVersion" cssClass="error"/>
	        <form:input path="currentVersion" value="${language.currentVersion}"/>
	    </p>
	    <input type="submit" value="Submit"/>
	</form:form> 
</body>
</html>