package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class CarrelloModel implements DAOInterface<Integer,Fattura>{

    private DriverManagerConnectionPool dmcp;

    public CarrelloModel(){}

    public CarrelloModel(DriverManagerConnectionPool dmcp) {
        this.dmcp = dmcp;

        System.out.println("DriverManager  CarrelloModel creation....");
    }

    private static final String TABLE_NAME = "Fattura";
    private static final String TABLE_NAME2 = "Ordine";


    @Override
    public void doSave(Fattura item) throws SQLException {
        //per salvare prima bisogna creare la fattura, poi le righe nella tabella degli ordini
        Connection connection = null;
        PreparedStatement ps = null, ps1 = null;

        String insertSQL = " INSERT INTO " + CarrelloModel.TABLE_NAME + " (codiceFattura, data_fattura, codiceUtente) VALUES (?,?,?)";
        String insert = "INSERT INTO " + CarrelloModel.TABLE_NAME2 + " (codiceTel, codiceFattura, quantita) VALUES (?,?,?)";

        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(insertSQL);
            ps1 = connection.prepareStatement(insert);

            Fattura f = new Fattura();
            ps.setInt(1, f.getCodice());
            ps.setDate(2, f.getData());
            ps.setInt(3, f.getUtente().getCodiceUtente());
            ps.executeUpdate();
            connection.commit();

            ResultSet s = ps.getGeneratedKeys();  // prende il codice auto generato delle fattura
            if (s.next()) {
                HashMap<Prodotto, Integer> map = f.getCarrello().getOrdine();
                Long idFatture = s.getLong(1); //si prende id della Fattura
                Ordine o= new Ordine();
                for (Map.Entry<Prodotto, Integer> entry : map.entrySet()) {
                    //chiave è il prodotto
                    int pId = entry.getKey().getCodiceTel(); //chiave del telefono
                    int pqt = entry.getValue(); // qt del prodotto

                    ps1.setLong(1,idFatture);
                    ps1.setInt(2,pId);
                    ps1.setInt(3,pqt);
                    ps1.executeUpdate();
                    connection.commit();

                }
            }

            if (ps != null)
                ps.close();
        } finally {
            dmcp.releaseConnection(connection);
        }
    }

    @Override
    public boolean doDelete(Integer key) throws SQLException {
        return false;
    }

    @Override
    public Fattura doRetrieveByKey(Integer key) throws SQLException {
        //prendere gli ordini che hanno come codice di fattura uguale a quello dell'input

        Connection connection = null;
        PreparedStatement ps = null;

        String selectSQL = "SELECT FROM " + CarrelloModel.TABLE_NAME2 + " WHERE codiceFattura = ?";


        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(selectSQL);

            ps.setInt(1, key);
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                Carrello c = new Carrello();
            }
        }finally {
            try {
                if (ps != null)
                    ps.close();
            } finally {
                dmcp.releaseConnection(connection);
            }

        }return null;

    }

    @Override
    public boolean doUpdate(Fattura item) throws SQLException {
        return false;
    }

    @Override
    public ArrayList<Fattura> doRetrieveAll() throws SQLException {
        return null;
    }
}
