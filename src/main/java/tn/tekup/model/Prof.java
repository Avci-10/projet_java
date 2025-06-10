package tn.tekup.model;

public class Prof {
    private int idprof;
    private int salaireprof;
    private String nomprof;
    private String emailprof;
    private String mdpprof;

    //nest7a9ou fel insertion baaed
    public Prof() {
    }

    //9bal me naccidou lel base de donnes mzel me aanech id
    public Prof(int salaireprof, String emailprof, String nomprof, String mdpprof) {
        this.salaireprof = salaireprof;
        this.emailprof = emailprof;
        this.nomprof = nomprof;
        this.mdpprof = mdpprof;

    }

    public Prof(int idprof, int salaireprof, String nomprof, String emailprof, String mdpprof) {
        this.idprof = idprof;
        this.salaireprof = salaireprof;
        this.nomprof = nomprof;
        this.emailprof = emailprof;
        this.mdpprof = mdpprof;
    }

    public int getIdprof() {
        return idprof;
    }

    public void setIdprof(int idprof) {
        this.idprof = idprof;
    }

    public int getSalaireprof() {
        return salaireprof;
    }

    public void setSalaireprof(int salaireprof) {
        this.salaireprof = salaireprof;
    }

    public String getNomprof() {
        return nomprof;
    }

    public void setNomprof(String nomprof) {
        this.nomprof = nomprof;
    }

    public String getEmailprof() {
        return emailprof;
    }

    public void setEmailprof(String emailprof) {
        this.emailprof = emailprof;
    }

    public String getMdpprof() {
        return mdpprof;
    }

    public void setMdpprof(String mdpprof) {
        this.mdpprof = mdpprof;
    }
}
