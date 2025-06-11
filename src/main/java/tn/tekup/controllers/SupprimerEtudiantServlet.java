package tn.tekup.controllers;
import tn.tekup.DB.EtudiantDb;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/supprimerEtudiant")
public class SupprimerEtudiantServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
        int id =Integer.parseInt(request.getParameter("id"));
        boolean test =new EtudiantDb().deleteEtudiant(id);
        if(test){
            request.getSession().setAttribute("ids", id);
            response.sendRedirect("getEtudiants");
        }
        else{
            request.setAttribute("messagesuppression", " Erreur Dans la suppression.");
            request.getRequestDispatcher("/WEB-INF/Erreur.jsp").forward(request,response);
        }
    }
}
