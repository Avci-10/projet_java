package tn.tekup.controllers;
import javax.servlet.annotation.WebServlet; // importation de hedhi @WebServlet
import javax.servlet.http.*;//Tu importes toutes les classes utiles des servlets :

//HttpServlet (que ta classe va étendre) class abstraite adheka aalech naamlou fi @override
//
//        HttpServletRequest ( interface pour lire les données du formulaire)
//
//        HttpServletResponse (interface pour écrire une réponse au navigateur)
import javax.servlet.http.HttpSession;
import tn.tekup.DB.EtudiantDb;
import tn.tekup.model.Etudiant;
import java.io.*;
import javax.servlet.ServletException; //on la leve si exemple le nom est vide pour la validation

// hedhi bech nefehmou bih mais mehouch recomndee lezem tsir separation bin el code java wel .jsp ou sera l"affichage
//@WebServlet("/ajouterEtudiant") // hedhi tekhdem ken avec un formulaire envoie une requette post et action= ajouterEtudiant
//public class AjouterEtudiantServlet extends HttpServlet {
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException { //doPost peut provoquer une exception
//        String nom = req.getParameter("nom");
//        String email = req.getParameter("email");
//
//        res.setContentType("text/html");//le navigateur va interpréter le contenu comme une vraie page HTML et image/png pour l"image 	application/pdf pour pdf
//        PrintWriter out = res.getWriter();//Tu demandes à l'objet HttpServletResponse de te donner un "stylo" (Writer) pour écrire du texte dans la réponse envoyée au navigateur.
//        //lehna ynajem yssir el IO EXCEPTION Tu lis/écris un fichier ou une répons Le navigateur interrompt la connexion.
//        out.println("<h3>Bienvenue " + nom + " !</h3>");//hedha elli bech yektbou
//        out.println("<p>Email : " + email + "</p>");//hedha elli bech yektbou
//    }
//}

//hedhi la plus recommonde
//@WebServlet("/ajouterEtudiant")
//public class AjouterEtudiantServlet extends HttpServlet {
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//        String nom = req.getParameter("nom");
//        String email = req.getParameter("email");
//
//        // Passer les données à la JSP
//        req.setAttribute("nom", nom);
//        req.setAttribute("email", email);
//
//        // Appeler la JSP pour l'affichage
//        req.getRequestDispatcher("/WEB-INF/confirmation.jsp").forward(req, res);
//    }
//}
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
            req.getSession().setAttribute("messageSuccess", etudiant.getNomcompletEtudiant()+" ajouté avec succès !");
            res.sendRedirect("getEtudiants");
        } else {
            req.setAttribute("messageinsertion", "❌ Erreur lors de l’ajout.");
        req.getRequestDispatcher("/WEB-INF/Erreur.jsp").forward(req, res);
        }
    }
}



