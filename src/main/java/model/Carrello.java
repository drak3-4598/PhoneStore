package model;

import java.util.ArrayList;
import java.util.HashMap;

public class Carrello {

    public Carrello() {
        ordine = new HashMap<Prodotto, Integer>();
    }

    private HashMap<Prodotto, Integer> ordine;


    /*public double prezzoTotale(){
        return this.ordine.parallelStream().map((e)->{return e.prezzoTotale();}).reduce((double) 0, (sum, current) -> sum + current);
    }*/

    public int count(){
        return ordine.size();
    }

    public void addOrder(Prodotto p, int qt){
        this.ordine.put(p,qt);
    }

    public void removeOrder(Prodotto p){
        ordine.remove(p);
    }

    public void modifyOrder(Prodotto p, int qt){
        if(ordine.get(p)!=null)
            ordine.replace(p,qt);


    }
}
