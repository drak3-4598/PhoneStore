package control;

import com.google.gson.GsonBuilder;
import model.Prodotto;
import model.ProdottoModel;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/ModificaProdottoServlet")
public class ModificaProdottoServlet extends HttpServlet {

    ProdottoModel model = new ProdottoModel();


    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("codiceTel"));
        boolean update = request.getParameter("update") == null ? false : request.getParameter("update").equals("true");

        try {
            Prodotto p = null;

            if(update == true){
                p = new Prodotto();
                String marca = request.getParameter("marca");
                String nome = request.getParameter("nome");
                String descrizione = request.getParameter("descrizione");
                double prezzo = Double.parseDouble(request.getParameter("prezzo"));
                int qt = Integer.parseInt(request.getParameter("quantita"));
                p.setMarca(marca);
                p.setNome(nome);
                p.setDescrizione(descrizione);
                p.setPrezzo(prezzo);
                p.setQuantita(qt);
                model.doUpdate(p);
            }else {
                p = model.doRetrieveByKey(id);
                response.setContentType("application/json");
                response.getWriter().write(new GsonBuilder().create().toJson(p));
            }

        } catch (SQLException | IOException throwables) {
            throwables.printStackTrace();
        }

    }
}
