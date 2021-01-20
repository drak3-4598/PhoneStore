package control;

import model.UtenteModel;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;

@WebServlet("/EliminaUtenteServlet")
public class EliminaUtenteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        String email = request.getParameter("email");
        UtenteModel utenteModel = new UtenteModel();
        try {
            utenteModel.doDelete(email);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

        protected void doGet(HttpServletRequest request, HttpServletResponse response) {

        }

    }
