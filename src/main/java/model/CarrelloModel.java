package model;

import java.sql.SQLException;
import java.util.ArrayList;

public class CarrelloModel implements DAOInterface<Integer, Carrello>{

    @Override
    public void doSave(Carrello item) throws SQLException {
        //per salvare prima bisogna creare la fattura, poi le righe nella tabella degli ordini
    }

    @Override
    public boolean doDelete(Integer key) throws SQLException {
        return false;
    }

    @Override
    public Carrello doRetrieveByKey(Integer key) throws SQLException {
        //prendere gli ordini che hanno come codice di fattura uguale a quello dell'input
        return null;
    }

    @Override
    public boolean doUpdate(Carrello item) throws SQLException {
        return false;
    }

    @Override
    public ArrayList<Carrello> doRetrieveAll() throws SQLException {
        //order by
        return null;
    }
}
