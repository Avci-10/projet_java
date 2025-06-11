<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="/includes/head.jsp" %>

<body>
<%@ include file="/includes/aside.jsp" %>
<div class="content">
    <h2 class="text-center">Bienvenue <strong> ADMIN</strong> </h2>

    <div class="dropdown-divider border border-light mb-2"></div>

    <div class="d-flex justify-content-between align-items-center mb-2">
        <h3 class="mb-0">LISTE DES ÉTUDIANTS</h3>

        <div class="d-flex gap-2">
            <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#ajouterEtudiantModal">
                <i class="fas fa-folder-plus"></i> Ajouter un étudiant
            </button>


        </div>
    </div>
    <div class="dropdown-divider border border-light mt-2"></div>
    <div class="d-flex justify-content-end gap-2 ">

        <div class="modal fade" id="ajouterEtudiantModal" tabindex="-1" aria-labelledby="ajouterEtudiantLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">

                    <div class="modal-header ">
                        <h5 class="modal-title " id="ajouterEtudiantLabel">Nouvel étudiant</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fermer"></button>
                    </div>

                    <form action="ajouterEtudiant" method="post" id="forminsertion">
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
                            <button type="submit" class="btn btn-primary">Ajouter</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modifierEtudiant" tabindex="-1" aria-labelledby="modifierModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <form class="modal-content" action="modifierEtudiants" method="post" id="formmodif">
                <div class="modal-header">
                    <h5 class="modal-title" id="ajouterModalLabel">Modifier un étudiant</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fermer"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label class="form-label fw-semibold">Nom Complet</label>
                        <input type="text" class="form-control" name="nomCompletmodif" id="edit-nomcomplet">
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label fw-semibold">Adresse Email</label>
                        <input type="email" class="form-control" name="emailmodif" id="edit-email">
                    </div>
                    <div class="mb-3">
                        <label  class="form-label fw-semibold visually-hidden">id</label>
                        <input type="text" class="form-control visually-hidden" name="idmodif" id="edit-id">
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
                    <button type="submit" name="submit" class="btn btn-success" id="submit">Modifier</button>
                </div>
            </form>
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
                    <td>${i.idEtudiant}</td>
                    <td>${i.nomcompletEtudiant}</td>
                    <td>${i.emailEtudiant}</td>
                    <td>${i.dateInscrit}</td>
                    <td>

                        <a href="RecupererEtudiantsParId?id=${i.idEtudiant}" class=" text-light btn btn-primary  "
                           title="Afficher">
                            <i class="fas fa-info-circle"></i></a>

                        <a href="#" class="modifier text-light btn btn-success  " title="Editer"
                           data-bs-toggle="modal"
                           data-bs-target="#modifierEtudiant"
                           data-nomcomplet="${i.nomcompletEtudiant}"
                           data-email="${i.emailEtudiant}"
                           data-id="${i.idEtudiant}">
                            <i class=" fas fa-edit"></i></a>

                        <a  class="supprimer text-light btn btn-danger  " title="Supprimer"  data-id="${i.idEtudiant}"> <i
                                class="fas fa-trash-alt"></i></a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

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

    <c:if test="${not empty sessionScope.etudiant}">
    <script>
        nom = "${sessionScope.etudiant.nomcompletEtudiant}";
        email = "${sessionScope.etudiant.emailEtudiant}";
        date = "${sessionScope.etudiant.dateInscrit}";
        Swal.fire({
            title: "Informations de l'étudiant",
            html:
                "<strong>Nom :</strong>" + nom + "<br>" +
                "<strong>Email :</strong>" + email + "<br>" +
                "<strong>Date d'inscrit :</strong>" + date,

            icon: "info"
        });
    </script>
        <c:remove var="etudiant" scope="session"/>
    </c:if>

    <script>
        document.querySelectorAll(".modifier").forEach(element => {
            element.addEventListener("click", function () {
                document.getElementById("edit-nomcomplet").value = this.dataset.nomcomplet;
                document.getElementById("edit-email").value = this.dataset.email;
                document.getElementById("edit-id").value=this.dataset.id;
            })
        })
    </script>
    <c:if test="${not empty sessionScope.id}">
    <script>
        Swal.fire({
            title: " Succès",
            text: "ID ${sessionScope.id} updated avec succès",
            icon: "success"
        });
    </script>
        <c:remove var="id" scope="session"/>
    </c:if>
    <script>
        document.querySelectorAll('.supprimer').forEach(e => {
            e.addEventListener('click', function (m) {
                m.preventDefault(); // khater e button par defaut taamel navigation
                const id = this.getAttribute("data-id");
                Swal.fire({
                    title: 'Êtes-vous sûr ?',
                    text: "Cette action est irréversible !",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: 'Oui, supprimer !',
                    cancelButtonText: 'Annuler'
                }).then((result) => {
                    if (result.isConfirmed) {
                        window.location.href = "supprimerEtudiant?id="+id;
                    }
                });
            });
        });

    </script>
    <c:if test="${not empty sessionScope.ids}">
    <script>
        Swal.fire({
            title: " Succès",
            text: "ID ${sessionScope.ids} supprimé avec succès",
            icon: "success"
        });
    </script>
        <c:remove var="ids" scope="session"/>
    </c:if>

    <script src="/assets/js/form%20inscription.js"></script>
    <script src="/assets/js/form%20modification.js"></script>
</body>
</html>
