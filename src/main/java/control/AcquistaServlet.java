package control;

import model.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.HashMap;

@WebServlet("/AcquistaServlet")
public class AcquistaServlet extends HttpServlet {

    CarrelloModel model = new CarrelloModel();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Date today = Date.valueOf(request.getParameter("today"));
        HttpSession session = request.getSession();
        Utente u = (Utente) session.getAttribute("utente");

        Fattura fattura = null;
        if(session.getAttribute("admin") == null){
            Carrello c = (Carrello) session.getAttribute("carrello");
            if(c != null ? c.count() > 0 : false){

                try {
                    fattura.setData(today);
                    fattura.setUtente(u.getCodiceUtente());
                    model.doSave(fattura);
                    session.setAttribute("fattura", fattura);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }

            }
        }

    }



    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
