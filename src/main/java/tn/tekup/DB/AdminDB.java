package tn.tekup.DB;

import tn.tekup.model.Admin;
import tn.tekup.utils.DbConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class AdminDB {
    public Admin recupererAdmin(){
        String requete = " SELECT Adresse,MDP FROM admin";
        Admin admin =null;
        try (Connection db = DbConnection.etablirConnection();
             PreparedStatement ps = db.prepareStatement(requete);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) { //
                String adresse = rs.getString("Adresse");
                String pass = rs.getString("MDP");
                admin = new Admin(adresse, pass);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return admin;
    }
}
