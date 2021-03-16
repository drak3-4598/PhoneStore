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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Locale;


@WebServlet("/AcquistaServlet")
public class AcquistaServlet extends HttpServlet {

    CarrelloModel model = new CarrelloModel();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        HttpSession session = request.getSession();

        Utente u = (Utente) session.getAttribute("utente");
        int id = u.getCodiceUtente();



        if(session.getAttribute("admin") == null && u!=null){
            Carrello c = (Carrello) session.getAttribute("carrello");
            if(c != null ? c.count() > 0 : false){

                try {

                    Fattura f = new Fattura();

                    java.sql.Date timeNow = new Date(Calendar.getInstance().getTimeInMillis());

                    f.setUtente(id);
                    f.setData(timeNow);

                    model.doSave(f);

                    response.sendRedirect("Checkout.jsp");


                } catch (SQLException  throwables) {
                    throwables.printStackTrace();
                }

            }
        }

    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
