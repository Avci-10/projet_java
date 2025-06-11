package tn.tekup.controllers;
import tn.tekup.DB.EtudiantDb;
import tn.tekup.model.Etudiant;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import javax.servlet.annotation.WebServlet;

@WebServlet("/modifierEtudiants")
public class ModifierEtudiantServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nom = request.getParameter("nomCompletmodif");
        String email = request.getParameter("emailmodif");
        int idEtudiant = Integer.parseInt(request.getParameter("idmodif"));
        Etudiant etudiant = new Etudiant(idEtudiant,nom,email);
        boolean test =new EtudiantDb().updateEtudiant(etudiant);
        if(test){
            request.getSession().setAttribute("id", idEtudiant);
            response.sendRedirect("getEtudiants");
        }
        else {
            request.setAttribute("messagemodification", " Erreur Dans la modification.");
            request.getRequestDispatcher("/WEB-INF/Erreur.jsp").forward(request,response);
        }


    }


}
