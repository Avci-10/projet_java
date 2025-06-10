package tn.tekup.controllers;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import tn.tekup.model.Etudiant;
import tn.tekup.DB.EtudiantDb;

@WebServlet("/getEtudiants")
public class RecupererTousEtudiantsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse reponse) throws ServletException, IOException {
        List<Etudiant> listeEtudiants=new EtudiantDb().getEtudiants();
        if (listeEtudiants!=null){

        req.setAttribute("listeEtudiant",listeEtudiants );
        req.getRequestDispatcher("WEB-INF/Etudiants.jsp").forward(req, reponse);
        }
        else {
            req.setAttribute("msgaffichage", "  email introuvable");
            req.getRequestDispatcher("WEB-INF/Erreur.jsp").forward(req, reponse);// .forward() taamel redirection interne mesh au sens de http yaani el conserve el
            // methode elli jetelha post ou get

        }


    }






}
