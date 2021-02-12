package model;

import java.sql.Date;


public class Fattura {

    private int codice;
    private Date data;
    private Utente utente;
    private Carrello carrello;

    public Fattura(){}

    public Fattura(int codice, Date data, Utente utente, Carrello carrello) {
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

    public Utente getUtente() {
        return utente;
    }

    public void setUtente(Utente utente) {
        this.utente = utente;
    }

    public Carrello getCarrello() {
        return carrello;
    }

    public void setCarrello(Carrello carrello) {
        this.carrello = carrello;
    }
}
