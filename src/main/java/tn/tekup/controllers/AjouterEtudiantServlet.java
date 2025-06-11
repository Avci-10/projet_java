package tn.tekup.controllers;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import tn.tekup.DB.EtudiantDb;
import tn.tekup.model.Etudiant;

import java.io.*;
import javax.servlet.ServletException;


@WebServlet("/ajouterEtudiant")
public class AjouterEtudiantServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {


        String nom = req.getParameter("nomComplet");
        String email = req.getParameter("email");
        String mdp = req.getParameter("mdp");

        Etudiant etudiant = new Etudiant(nom, email, mdp);


        boolean success = new EtudiantDb().insertEtudiant(etudiant);

        if (success) {
            req.getSession().setAttribute("messageSuccess", etudiant.getNomcompletEtudiant() + " ajouté avec succès !");
            res.sendRedirect("getEtudiants");
        } else {
            req.setAttribute("messageinsertion", " Erreur lors de l’ajout.");
            req.getRequestDispatcher("/WEB-INF/Erreur.jsp").forward(req, res);
        }
    }
}



