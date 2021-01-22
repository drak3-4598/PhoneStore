package model;

public class Ordine {

    private int quantità;
    private Prodotto p;

    public Ordine(int quantità, Prodotto p) {
        this.quantità = quantità;
        this.p = p;
    }

    public Ordine() {

    }

    public int getQuantità() {
        return quantità;
    }

    public void setQuantità(int quantità) {
        this.quantità = quantità;
    }

    public Prodotto getP() {
        return p;
    }

    public void setP(Prodotto p) {
        this.p = p;
    }

    public double prezzoTotale(){
        return this.quantità * p.getPrezzo();
    }
}
