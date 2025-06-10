<%--
  Created by IntelliJ IDEA.
  User: HKIRI JR
  Date: 11/04/2025
  Time: 02:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<!DOCTYPE html>
<html>
<head>
    <title>Etat de requete </title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="p-4">

<div class="container">
    <h2>Résultat de l'affichage</h2>
    <c:if  test="${not empty messageinsertion}" >
        <h2  class="alert alert-danger">${messageinsertion}</h2>
    </c:if>

    <!-- Affiche le message si présent -->
    <c:if test="${ not  empty msgaffichage}">
        <div class="alert alert-danger">${msgaffichage}</div>
    </c:if>

</div>

</body>
</html>
