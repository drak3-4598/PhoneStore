package control;

import com.google.gson.GsonBuilder;
import json.JsonBuilderFattura;
import model.CarrelloModel;
import model.Fattura;
import model.Utente;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/AsyncOrdineServlet")
public class AsyncOrdineServlet extends HttpServlet {

    CarrelloModel model = new CarrelloModel();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        Utente u = (Utente) session.getAttribute("utente");

        ArrayList<Fattura> lista = null;


        try {
            lista = model.doRetrieveAll(u);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


        response.setContentType("application/json");
        response.getWriter().write(new GsonBuilder().registerTypeAdapter(Fattura.class, new JsonBuilderFattura()).create().toJson(lista));

    }


}
