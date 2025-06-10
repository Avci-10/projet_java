<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="/includes/head.jsp" %>

<body>
<%@ include file="/includes/aside.jsp" %>
<div class="content">
    <h2 class="text-center">Bienvenue <strong> IHEB HKIRI</strong> 👋</h2>

    <div class="dropdown-divider border border-light mb-2"></div>

    <div class="d-flex justify-content-between align-items-center mb-2">
        <h3 class="mb-0">LISTE DES ÉTUDIANTS</h3>

        <div class="d-flex gap-2">
            <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#ajouterEtudiantModal">
                <i class="fas fa-folder-plus"></i> Ajouter un étudiant
            </button>

            <button class="btn btn-success">
                <i class="fas fa-table"></i> Exporter
            </button>
        </div>
    </div>
    <div class="dropdown-divider border border-light mt-2"></div>
    <div class="d-flex justify-content-end gap-2 ">
        <!-- MODALE -->
        <div class="modal fade" id="ajouterEtudiantModal" tabindex="-1" aria-labelledby="ajouterEtudiantLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">

                    <div class="modal-header ">
                        <h5 class="modal-title " id="ajouterEtudiantLabel">Nouvel étudiant</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fermer"></button>
                    </div>

                    <form action="ajouterEtudiant" method="post">
                        <div class="modal-body">
                            <div class="mb-3">
                                <label for="nom" class="form-label">Nom complet</label>
                                <input type="text" class="form-control" id="nom" name="nomComplet" required>
                            </div>

                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" class="form-control" id="email" name="email" required>
                            </div>
                            <div class="mb-3">
                                <label for="mdp" class="form-label">Mot de passe</label>
                                <input type="password" class="form-control" id="mdp" name="mdp" required>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
                            <button type="submit" class="btn btn-success">Ajouter</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>

    <div>
        <table class="table table-striped table-dark mt-2">
            <thead>

            <tr>
                <th>ID</th>
                <th>NOM COMPLET</th>
                <th> EMAIL</th>
                <th>DATE D'INSCRIT</th>
                <th>ACTIONS</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach var="i" items="${listeEtudiant}">
            <tr>
                <td>${i.idEtudiant}</td><%-- meme les attributs sont private najmou naccidoulhom car jstl utilise auto les getters et setters --%>
                <td>${i.nomcompletEtudiant}</td>
                <td>${i.emailEtudiant}</td>
                <td>${i.dateInscrit}</td>
                <td>
                    <a class="btn btn-success" data-bs-toggle="modal"
                        data-bs-target="#etudiantModal" href="/RecupererEtudiantsParId?id=${i.idEtudiant}">
                        <i class="fas fa-info-circle"></i>
                    </a>


                    <a href="#" class=" text-light btn btn-primary  " title="editer"> <i class="fas fa-edit"></i></a>
                    <a href="#" class=" text-light btn btn-danger  " title="supprimer"> <i class="fas fa-trash-alt"></i></a>
                </td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
<%--        <div class="modal fade" id="etudiantModal" tabindex="-1" aria-hidden="true">--%>
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalTitle">Titre dynamique</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body" id="modalBody">
                        <h1> </h1>
                    </div>
                    <div class="modal-footer" id="modalFooter">
                        <h2>cv</h2>
                    </div>
                </div>
            </div>
        </div>


<%@ include file="/includes/footer.jsp" %>
<c:if test="${not empty sessionScope.messageSuccess}">
    <script>
        Swal.fire({
            title: "Succès",
            text: "${sessionScope.messageSuccess}",
            icon: "success"
        });
    </script>
    <c:remove var="messageSuccess" scope="session"/>
</c:if>


</body>
</html>
