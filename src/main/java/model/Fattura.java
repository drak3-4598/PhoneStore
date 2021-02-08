package model;

import java.sql.Date;
import java.util.Calendar;

public class Fattura {

    private int codice;
    private Date data;
    private Utente utente;

    public Fattura(){}

    public Fattura(int codice, Date data, Utente utente) {
        this.codice = codice;
        this.data = data;
        this.utente = utente;
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
}
