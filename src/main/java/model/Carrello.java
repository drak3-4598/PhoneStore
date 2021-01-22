package model;

import java.util.ArrayList;

public class Carrello {

    public Carrello() {
        ordine = new ArrayList<>();
    }

    private ArrayList<Ordine> ordine;

    public ArrayList<Ordine> getOrdine() {
        return ordine;
    }

    public void setOrdine(ArrayList<Ordine> ordine) {
        this.ordine = ordine;
    }

    public double prezzoTotale(){
        return this.ordine.parallelStream().map((e)->{return e.prezzoTotale();}).reduce((double) 0, (sum, current) -> sum + current);
    }

    public int count(){
        return ordine.size();
    }

    public void addOrder(Ordine o){
        this.ordine.add(o);
    }

    public void removeOrder(Ordine o){

    }
}
