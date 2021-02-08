package control;

import model.Carrello;
import model.CarrelloModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/AcquistaServlet")
public class AcquistaServlet extends HttpServlet {
    CarrelloModel model = new CarrelloModel();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        if(session.getAttribute("utente")!=null){
            Carrello c = (Carrello) session.getAttribute("carrello");
            if(c != null ? c.count() > 0 : false){
                try {
                    model.doSave(c);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}
