package model;

import java.util.ArrayList;
import java.util.HashMap;


public class Carrello {

    private HashMap<Prodotto, Integer> ordine = new HashMap<Prodotto, Integer>();

    public Carrello() {
        ordine = new HashMap<Prodotto, Integer>(); //Integer si riferisce al codice fattura
    }

    public HashMap<Prodotto, Integer> getOrdine() {
        return ordine;
    }

    public void setOrdine(HashMap<Prodotto, Integer> ordine) {
        this.ordine = ordine;
    }


    public int count(){
        return ordine.size();
    }

    public void addOrder(Prodotto p, int qt){
        this.ordine.put(p,qt);
    }

    public void removeOrder(Prodotto p){
        ordine.remove(p);
    }

    public void modifyOrder(Prodotto p, int qt) {
        if (ordine.get(p) != null)
            ordine.replace(p, qt);

    }


}
