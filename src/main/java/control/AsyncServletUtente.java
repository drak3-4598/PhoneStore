package control;

import com.google.gson.GsonBuilder;

import model.Utente;
import model.UtenteModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/AsyncServletUtente")
public class AsyncServletUtente extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UtenteModel u = new UtenteModel();
        List<Utente> list = null;
        try {
                list = u.doRetrieveAll();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        response.setContentType("application/json");
        response.getWriter().write(new GsonBuilder().create().toJson(list));

    }
}
