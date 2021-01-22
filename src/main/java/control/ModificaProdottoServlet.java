package control;

import model.DriverManagerConnectionPool;
import model.Prodotto;
import model.ProdottoModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/ModificaProdottoServlet")
public class ModificaProdottoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        Prodotto p = (Prodotto) session.getAttribute("prodotto");

        String nome = request.getParameter("nome");
        String marca = request.getParameter("marca");
        String descr = request.getParameter("descrizione");
        double prezzo = Double.parseDouble(request.getParameter("prezzo"));
        int qt = Integer.parseInt(request.getParameter("quantita"));

        ProdottoModel prodottoModel = new ProdottoModel();


        if(p!=null){
            try {
                p.setMarca(marca);
                p.setNome(nome);
                p.setDescrizione(descr);
                p.setPrezzo(prezzo);
                p.setQuantita(qt);
                prodottoModel.doUpdate(p);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }

        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) {

    }
}
