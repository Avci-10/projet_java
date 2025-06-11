<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<!DOCTYPE html>
<html>
<head>
    <title>Confirmation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="p-4">

<div class="container">
    <h2>Résultat de l'ajout</h2>


    <c:if test="${ not  empty message}">
        <div class="alert alert-info">${message}</div>
    </c:if>

    <a href="Etudiants.jsp" class="btn btn-primary mt-3"> Ajouter un autre étudiant</a>
</div>

</body>
</html>
