package tn.tekup.controllers;
import tn.tekup.DB.EtudiantDb;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;


@WebServlet("/sommeEtudiant")
public class SommeDesEtudiants extends HttpServlet {
    protected void doGet (HttpServletRequest request,HttpServletResponse response) throws IOException {
        int somme = new EtudiantDb().sommeEtudiants();
        if (somme != 0) {
            request.getSession().setAttribute("somme", somme);
            response.sendRedirect("DashboardAdmin.jsp");
        }
    }

}
