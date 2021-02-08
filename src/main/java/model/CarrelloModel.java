package model;

import javax.swing.text.Caret;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CarrelloModel implements DAOInterface<Integer, Carrello>{

    private final DriverManagerConnectionPool dmcp;

    public CarrelloModel(){dmcp = DriverManagerConnectionPool.getIstance();};

    public CarrelloModel(DriverManagerConnectionPool dmcp) {
        this.dmcp = dmcp;
    }

    private static final String TABLE_NAME = "Fattura";
    private static final String TABLE_NAME2 = "Ordine";

    @Override
    public void doSave(Carrello item) throws SQLException {
        Connection connection = null;
        PreparedStatement ps = null;


        String insertSQL = " INSERT INTO " + CarrelloModel.TABLE_NAME + " (codiceFattura, data_fattura, codiceUtente, indirizzo) VALUES (?,?,?,?)";

        try{
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(insertSQL);

            Fattura f = new Fattura();
            ps.setInt(1,f.getCodice());
            ps.setDate(2,f.getData());
            ps.setInt(3,f.getUtente().getCodiceUtente());
            ps.setString(4,f.getUtente().getIndirizzo());
            ps.executeUpdate();
            connection.commit();
        }finally {
            try {
                if (ps != null)
                    ps.close();
            } finally {
                dmcp.releaseConnection(connection);
            }
        }

        //per salvare prima bisogna creare la fattura, poi le righe nella tabella degli ordini
    }

    @Override
    public boolean doDelete(Integer key) throws SQLException {
        return false;
    }

    @Override
    public Carrello doRetrieveByKey(Integer key) throws SQLException {

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
    public boolean doUpdate(Carrello item) throws SQLException {
        return false;
    }

    @Override
    public ArrayList<Carrello> doRetrieveAll() throws SQLException {
        //order by
        return null;
    }
}
