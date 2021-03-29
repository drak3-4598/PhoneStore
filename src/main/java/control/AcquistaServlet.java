package control;

import model.Carrello;
import model.CarrelloModel;
import model.Fattura;
import model.Utente;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.Calendar;

@WebServlet("/AcquistaServlet")
public class AcquistaServlet extends HttpServlet {

    CarrelloModel model = new CarrelloModel();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        Utente u = (Utente) session.getAttribute("utente");

        if(session.getAttribute("admin") != null) {
            response.sendError(404);
            return;
        }

        Fattura f = new Fattura();
        java.sql.Date timeNow = new Date(Calendar.getInstance().getTimeInMillis());


        if(u!=null){

            String email = u.getEmail();
            Carrello c = (Carrello) session.getAttribute("carrello");

            if(c!=null ? c.count() > 0 : false){

                f.setCarrello(c);
                f.setUtente(email);
                f.setData(timeNow);

                try {
                    model.doSave(f);
                    session.setAttribute("carrello", new Carrello());
                    response.sendRedirect("checkout.jsp");

                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
        }else response.sendRedirect("Login.jsp");
    }

}
