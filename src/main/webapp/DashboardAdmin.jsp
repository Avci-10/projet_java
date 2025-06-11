<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Dashboard Étudiants</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .sidebar {
            min-height: 100vh;
            background: #343a40;
            color: white;
        }
        .sidebar a {
            color: white;
            text-decoration: none;
            padding: 10px;
            display: block;
        }
        .sidebar a:hover {
            background: #495057;
        }
        .card {
            transition: transform 0.2s ease;
        }
        .card:hover {
            transform: scale(1.02);
        }
        .icon-box {
            width: 60px;
            height: 60px;
            background: white;
            color: #0d6efd;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 50%;
        }
    </style>
</head>
<body>

<div class="container-fluid">
    <div class="row">

<%@ include file="includes/aside.jsp"%>

        <div class="col-md-10 p-4">


            <div class="row mb-4">
                <div class="col-md-4 mb-3">
                    <div class="card bg-primary text-white shadow">
                        <div class="card-body d-flex align-items-center gap-3">
                            <div class="icon-box">
                                <i class="fas fa-user-graduate fa-2x"></i>
                            </div>

                            <div>
                                <h5 class="card-title">Étudiants</h5>
                                <p class="card-text fs-5 fw-bold">${sessionScope.somme} inscrits</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 mb-3">
                    <div class="card bg-success text-white shadow">
                        <div class="card-body d-flex align-items-center gap-3">
                            <div class="icon-box">
                                <i class="fas fa-calendar-check fa-2x"></i>
                            </div>
                            <div>
                                <h5 class="card-title">Présences</h5>
                                <p class="card-text fs-5 fw-bold">0 ce mois</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 mb-3">
                    <div class="card bg-warning text-white shadow">
                        <div class="card-body d-flex align-items-center gap-3">
                            <div class="icon-box">
                                <i class="fas fa-chart-pie fa-2x"></i>
                            </div>
                            <div>
                                <h5 class="card-title">Statistiques</h5>
                                <p class="card-text fs-5 fw-bold">0% d’inscriptions</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card shadow-sm p-3 mb-5">
                <h5 class="mb-3">Évolution des inscriptions</h5>
                <canvas id="inscriptionsChart" height="100"></canvas>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    const ctx = document.getElementById('inscriptionsChart').getContext('2d');
    const inscriptionsChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: ['Juin', 'JUIL', 'Aôut', 'Sep', 'Oct', 'Nov'],
            datasets: [{
                label: 'Inscriptions',
                data: [${sessionScope.somme}, 0, 0, 0, 0, 0],
                borderColor: '#0d6efd',
                backgroundColor: 'rgba(13, 110, 253, 0.2)',
                borderWidth: 2,
                tension: 0.4,
                fill: true
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: { display: false }
            },
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>

</body>
</html>

