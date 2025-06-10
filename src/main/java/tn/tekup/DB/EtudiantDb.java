package tn.tekup.DB;
import tn.tekup.utils.DbConnection;
import tn.tekup.model.Etudiant;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import org.mindrot.jbcrypt.BCrypt;


public class EtudiantDb {
    //methode bech naamlou l"insertion
    public boolean insertEtudiant(Etudiant etudiant) {
        String requete = "insert into etudiant (NOM_COMPLET, EMAIL, mot_de_passe) values(?,?,?)";
        try (Connection db = DbConnection.etablirConnection();
             PreparedStatement ps = db.prepareStatement(requete)) {
            ps.setString(1, etudiant.getNomcompletEtudiant());
            ps.setString(2, etudiant.getEmailEtudiant());
            ps.setString(3, BCrypt.hashpw((etudiant.getMdpEtudiant()), BCrypt.gensalt()));
            return ps.executeUpdate() > 0; // bech ntastou si la  ligne est inserer ou non
        } catch (SQLException error) {
            error.printStackTrace();
            return false;
        }
    }

    //modification mte3 etudiant ism w email
    public boolean updateEtudiant(Etudiant etudiant) {
        String requete = "update etudiant set NOM_COMPLET = ?,EMAIL=? where id=?";
        try (Connection db = DbConnection.etablirConnection();
             PreparedStatement ps = db.prepareStatement(requete)) {
            if (!etudiant.getEmailEtudiant().isEmpty() || !etudiant.getNomcompletEtudiant().isEmpty()) {
                ps.setString(1, etudiant.getNomcompletEtudiant());
                ps.setString(2, etudiant.getEmailEtudiant());
                ps.setInt(3, etudiant.getIdEtudiant());
                return ps.executeUpdate() > 0;
            } else {
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // bech naamlou l"affichage mte3 etudiant
    public List<Etudiant> getEtudiants() {
        List<Etudiant> listeEtudiants = new ArrayList<>();
        String requete = "select * from etudiant ";
//        Etudiant etudiant = null; ken taamel Etudiant etudiant ;  fi return ygolek variable no initialisee naamlou null bech on peut l"utiliser el barra men ay bloc
        try (Connection db = DbConnection.etablirConnection();
             PreparedStatement ps = db.prepareStatement(requete)) {
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) { // sera false si l"email n"existe pas
                    Etudiant etudiant = new Etudiant(
                            rs.getInt("id"),
                            rs.getString("NOM_COMPLET"),
                            rs.getString("EMAIL"),
                            rs.getTimestamp("DATE_D'INSCRIT")
                    );
                    listeEtudiants.add(etudiant);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listeEtudiants;
    }
    //afficher un seul etudiant
    public  Etudiant getEtudiantsparId(int id){
        Etudiant etudiant = null;
        String requete = "select * from etudiant where id=?";
        try(Connection con = DbConnection.etablirConnection();
        PreparedStatement ps = con.prepareStatement(requete)){
            ps.setInt(1,id);
            try(ResultSet res = ps.executeQuery()){
                if(res.next()){
                    etudiant=new Etudiant(
                    res.getInt("id"),
                    res.getString("NOM_COMPLET"),
                    res.getString("EMAIL"),
                    res.getTimestamp("DATE_D'INSCRIT"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace() ;
        }
        return etudiant;
    };

    // bech tfasakh etudiant
    public boolean deleteEtudiant(int id) {
        String requete = "delete from etudiant where id=?";
        try (Connection db = DbConnection.etablirConnection();
             PreparedStatement ps = db.prepareStatement(requete)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }

    }

}

