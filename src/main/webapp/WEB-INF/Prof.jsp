<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<%@ include file="/includes/head.jsp" %>

<body>
<%@ include file="/includes/aside.jsp" %>
<div class="content">
    <h2 class="text-center">Bienvenue <strong> IHEB HKIRI</strong> 👋</h2>

    <div class="d-flex justify-content-end">

        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#ajouterProfModal"><span> <i
                class="fa-solid fa-plus"></i></span> ajouter un prof
        </button>
    </div>
    <!-- MODALE -->
    <div class="modal fade" id="ajouterProfModal" tabindex="-1" aria-labelledby="ajouterProfLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title" id="ajouterProfLabel">Nouvel Professeur</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fermer"></button>
                </div>

                <form action="ajouterProf" method="post">
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
                            <label for="salaire" class="form-label">Salaire</label>
                            <input type="number" class="form-control" id="salaire" name="salaire" required>
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
    <table class="table table-striped table-dark">
        <thead>
        <tr>
            <th>ID</th>
            <th>NOM COMPLET</th>
            <th> EMAIL</th>
            <th>SALAIRE</th>
        </tr>
        </thead>
        <tbody>


        </tbody>


    </table>
</div>


<%@ include file="/includes/footer.jsp" %>

</body>
</html>