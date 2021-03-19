package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class CarrelloModel implements DAOInterface<Integer,Fattura>{

    private DriverManagerConnectionPool dmcp;

    public CarrelloModel(DriverManagerConnectionPool dmcp) {
        this.dmcp = dmcp;

        System.out.println("DriverManager  CarrelloModel creation....");
    }

    private static final String TABLE_NAME = "Fattura";
    private static final String TABLE_NAME2 = "Ordine";

    public CarrelloModel(){ dmcp=DriverManagerConnectionPool.getIstance();}

    @Override
    public void doSave(Fattura item) throws SQLException {

        Connection connection = null;
        PreparedStatement ps = null;

        String insertSQL = " INSERT INTO " + CarrelloModel.TABLE_NAME + " (data_fattura, codiceUtente) VALUES (?,?)";

        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(insertSQL, java.sql.Statement.RETURN_GENERATED_KEYS);

            ps.setDate(1, item.getData());
            ps.setString(2,item.getUtente());
            ps.executeUpdate();
            connection.commit();


        } finally {
            int id = 0;
            ResultSet rs = ps.getGeneratedKeys();
            if(rs.next()){
                id = rs.getInt(1);
            }
            doSaveOrders(item.getCarrello(), id);
            try {
                if (ps != null)
                    ps.close();
            } finally {

                dmcp.releaseConnection(connection);
            }


        }


    }

    private void doSaveOrders(Carrello c, int codiceFattura) throws SQLException {

        Connection connection = null;
        PreparedStatement ps = null;

        String insert = "INSERT INTO " + CarrelloModel.TABLE_NAME2 + " (codiceFattura, codiceTel,  quantita, prezzo) VALUES (?,?,?,?)";

        try{
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(insert);


            // prende il codice auto generato delle fattura
            if (codiceFattura != 0) {
                HashMap<Prodotto, Integer> map = c.getOrdine();


                for (Map.Entry<Prodotto, Integer> entry : map.entrySet()) {
                    //chiave è il prodotto
                    int pId = entry.getKey().getCodiceTel(); //chiave del telefono
                    int pqt = entry.getValue(); // qt del prodotto
                    double pPrice = entry.getKey().getPrezzo(); //prezzo del prodotto

                    ps.setLong(1, codiceFattura);
                    ps.setInt(2, pId);
                    ps.setInt(3, pqt);
                    ps.setDouble(4, pPrice);
                    ps.executeUpdate();
                    connection.commit();

                }
            }
        }finally {
            try {
                if (ps != null)
                    ps.close();
            } finally {
                dmcp.releaseConnection(connection);
            }
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
        PreparedStatement ps = null, ps1;
        Fattura f = null;

        String selectSQL = "SELECT FROM " + CarrelloModel.TABLE_NAME + " WHERE codiceFattura = ?";
        String select = "SELECT FROM " + CarrelloModel.TABLE_NAME2 + " WHERE  codiceFattura = ?";


        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(selectSQL);
            ps1 = connection.prepareStatement(select);

            ps.setInt(1, key);
            ResultSet rs = ps.executeQuery();
            Carrello c = new Carrello();

            if(rs.next()){
                ps1.setInt(1,rs.getInt(1)); //codiceFattura nella tabella Ordine
                ResultSet rs1 = ps1.executeQuery();
                Utente u =  utenteModel.doRetrieveByKey(rs.getString(3));
                //int codiceUtente = u.getCodiceUtente();
                String email = u.getEmail();
                Date data = rs.getDate(2);
                int id = rs.getInt(1);
                while(rs1.next()){
                   Prodotto p = model.doRetrieveByKey(rs1.getInt(2));
                   int qt = rs1.getInt(3);
                    c.addOrder(p,qt);
                }

                f = new Fattura(id,data,email,c);
            }
        }finally {
            try {
                if (ps != null)
                    ps.close();
            } finally {
                dmcp.releaseConnection(connection);
            }

        }return f;

    }

    @Override
    public boolean doUpdate(Fattura item) throws SQLException {
        return false;
    }

    @Override
    public ArrayList<Fattura> doRetrieveAll() throws SQLException {
        return null;
    }

    public ArrayList<Fattura> doRetrieveAll(Utente u) throws SQLException {

        Connection connection = null;
        PreparedStatement ps = null, ps1;

        ArrayList<Fattura> fatture;

        String selectSQL = "SELECT * FROM " + CarrelloModel.TABLE_NAME + " WHERE codiceUtente = ?";
        String select = "SELECT * FROM " + CarrelloModel.TABLE_NAME2 + " WHERE  codiceFattura = ?";


        try {
            connection = dmcp.getConnection();
            ps = connection.prepareStatement(selectSQL);
            ps1 = connection.prepareStatement(select);

            ps.setString(1, u.getEmail());
            ResultSet rs = ps.executeQuery();

            Carrello c = new Carrello();
            fatture = new ArrayList<>();

            while(rs.next()){
                ps1.setInt(1,rs.getInt(1));
                ResultSet rs1 = ps1.executeQuery();
                Date data = rs.getDate(2);
                int id = rs.getInt(1);
                while(rs1.next()){
                    Prodotto p = model.doRetrieveByKey(rs1.getInt(2));
                    int qt = rs1.getInt(3);
                    c.addOrder(p,qt);
                }

                fatture.add(new Fattura(id,data,u.getEmail(),c));

            }
        }finally {
            try {
                if (ps != null)
                    ps.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                dmcp.releaseConnection(connection);
            }

        }return fatture;



    }




    ProdottoModel model = new ProdottoModel();
    UtenteModel utenteModel = new UtenteModel();
}
