package model;

public class Ordine {

    private Fattura f;
    private Prodotto p;

    public Ordine(){}

    public Ordine(Fattura f, Prodotto p) {
        this.f = f;
        this.p = p;
    }

    public Fattura getF() {
        return f;
    }

    public void setF(Fattura f) {
        this.f = f;
    }

    public Prodotto getP() {
        return p;
    }

    public void setP(Prodotto p) {
        this.p = p;
    }
}
