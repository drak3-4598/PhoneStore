package model;

import java.sql.Date;


public class Fattura {

    private int codice;
    private Date data;
    private String utente;
    private Carrello carrello;

    public Fattura(){}

    public Fattura(int codice, Date data, String utente, Carrello carrello) {
        this.codice = codice;
        this.data = data;
        this.utente = utente;
        this.carrello = carrello;
    }



    public int getCodice() {
        return codice;
    }

    public void setCodice(int codice) {
        this.codice = codice;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public String getUtente() {
        return utente;
    }

    public void setUtente(String utente) {
        this.utente = utente;
    }

    public Carrello getCarrello() {
        return carrello;
    }

    public void setCarrello(Carrello carrello) {
        this.carrello = carrello;
    }
}
