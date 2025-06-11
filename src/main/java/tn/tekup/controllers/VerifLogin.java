package tn.tekup.controllers;
import tn.tekup.DB.AdminDB;
import tn.tekup.model.Admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/verifLogin")
public class VerifLogin extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String emailus = request.getParameter("email");
        String passwordus = request.getParameter("password");
        Admin admin = new AdminDB().recupererAdmin();
        if (emailus.equals(admin.getEmail()) && passwordus.equals(admin.getPassword())) {
            response.sendRedirect("DashboardAdmin.jsp");
        }
        else {
            request.setAttribute("error", "Email ou Password incorrect");
            request.getRequestDispatcher("/WEB-INF/Erreur.jsp").forward(request, response);
        }

    }
}
