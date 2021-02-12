package model;

public class Ordine {
    private int cod_fat;
    private Prodotto cod_prod;
    private int qt;

    public Ordine(int cod_fat, Prodotto cod_prod, int qt) {
        this.cod_fat = cod_fat;
        this.cod_prod = cod_prod;
        this.qt = qt;
    }

    public Ordine(Prodotto cod_prod, int qt){
        this.cod_prod = cod_prod;
        this.qt = qt;
    }

    public Ordine() {

    }

    public int getCod_fat() {
        return cod_fat;
    }

    public void setCod_fat(int cod_fat) {
        this.cod_fat = cod_fat;
    }

    public Prodotto getCod_prod() {
        return cod_prod;
    }

    public void setCod_prod(Prodotto cod_prod) {
        this.cod_prod = cod_prod;
    }

    public int getQt() {
        return qt;
    }

    public void setQt(int qt) {
        this.qt = qt;
    }


}
