package tn.tekup.controllers;
import tn.tekup.DB.EtudiantDb;
import tn.tekup.model.Etudiant;

import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/RecupererEtudiantsParId")
public class RecupererEtudiantParId extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req , HttpServletResponse res ) throws IOException,ServletException {
        int id =Integer.parseInt(req.getParameter("id"));
        Etudiant etudiant = new EtudiantDb().getEtudiantsparId(id);
        req.setAttribute("etudiant", etudiant);
        req.getRequestDispatcher("WEB-INF/Etudiants.jsp").forward(req,res);


    }

}
