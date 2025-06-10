package tn.tekup.model;

import java.sql.Timestamp;

public class Etudiant {
    private int idEtudiant;
    private String nomcompletEtudiant;
    private String emailEtudiant;
    private String mdpEtudiant;
    private Timestamp dateInscrit;
    // hedha pour l'insertion
    public Etudiant(String nomcompletEtudiant,String emailEtudiant,String mdpEtudiant) {
        this.nomcompletEtudiant = nomcompletEtudiant;
        this.emailEtudiant = emailEtudiant;
        this.mdpEtudiant = mdpEtudiant;
    }
// pour l'affichage
    public Etudiant(int idEtudiant, String nomcompletEtudiant, String emailEtudiant, Timestamp dateInscrit ) {
        this.idEtudiant = idEtudiant;
        this.nomcompletEtudiant = nomcompletEtudiant;
        this.emailEtudiant = emailEtudiant;
        this.dateInscrit=dateInscrit;

    }

    public int getIdEtudiant() {
        return idEtudiant;
    }

    public void setIdEtudiant(int idEtudiant) {
        this.idEtudiant = idEtudiant;
    }

    public String getNomcompletEtudiant() {
        return nomcompletEtudiant;
    }

    public void setNomcompletEtudiant(String nomcompletEtudiant) {
        this.nomcompletEtudiant = nomcompletEtudiant;
    }

    public String getEmailEtudiant() {
        return emailEtudiant;
    }

    public void setEmailEtudiant(String emailEtudiant) {
        this.emailEtudiant = emailEtudiant;
    }

    public String getMdpEtudiant() {
        return mdpEtudiant;
    }

    public void setMdpEtudiant(String mdpEtudiant) {
        this.mdpEtudiant = mdpEtudiant;
    }

    public Timestamp getDateInscrit() {
        return dateInscrit;
    }

    public void setDateInscrit(Timestamp dateInscrit) {
        this.dateInscrit = dateInscrit;
    }
}
