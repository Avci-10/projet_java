<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>

<%@ include file="includes/head.jsp" %>

<body>
<%@ include file="includes/aside.jsp"%>
<div class="content">
    <h2 class="text-center">Bienvenue <strong> IHEB HKIRI</strong> 👋</h2>
    <div class="row my-4">
        <div class="col-md-3">
            <div class="card text-white bg-primary">
                <div class="card-body d-flex align-items-center">
                    <i class="fa fa-user-graduate card-icon"></i>
                    <div>
                        <h5 class="card-title">Etudiants</h5>
                        <p class="card-text">132 inscrits</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-white bg-success">
                <div class="card-body d-flex align-items-center">
                    <i class="fa fa-chalkboard-teacher card-icon"></i>
                    <div>
                        <h5 class="card-title">Professeurs</h5>
                        <p class="card-text">28 actifs</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<%@ include file="includes/footer.jsp" %>
</body>
</html>
