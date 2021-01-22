package control;

import model.Utente;
import model.UtenteModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/ModificaProfiloServlet")
public class ModificaProfiloServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {

        String nome = request.getParameter("nome");
        String cognome = request.getParameter("cognome");
        String indirizzo = request.getParameter("indirizzo");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UtenteModel utenteModel = new UtenteModel();
        Utente u = (Utente) request.getSession().getAttribute("utente");

        if( u!=null){
            u.setNome(nome);
            u.setCognome(cognome);
            u.setIndirizzo(indirizzo);
            u.setEmail(email);
            u.setPassword(password);
            try {
                utenteModel.doUpdate(u);
                RequestDispatcher d = getServletContext().getRequestDispatcher("/index.jsp");
                d.forward(request, response);
            } catch (SQLException | IOException | ServletException throwables) {
                throwables.printStackTrace();
            }
        }




    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) {

    }
}
