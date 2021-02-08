package control;

import com.google.gson.GsonBuilder;
import model.Carrello;
import model.Prodotto;
import model.ProdottoModel;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;


@WebServlet("/AsyncCartServlet")
public class AsyncCartServlet extends HttpServlet {

    ProdottoModel model = new ProdottoModel();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("codiceTel"));
        int qt = Integer.parseInt(request.getParameter("qt"));
        String op = request.getParameter("op");

        HttpSession session = request.getSession();


        if(session.getAttribute("utente") != null){
            Carrello c = session.getAttribute("carrello") == null ? new Carrello() : (Carrello) session.getAttribute("carrello");
            if("add".equals(op)){
                try {
                    c.addOrder(model.doRetrieveByKey(id), qt);
                    session.setAttribute("carrello", c);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }

            }else if("update".equals(op)){
                c.modifyOrder(new Prodotto(id), qt);

            }else if("remove".equals(op)){
                c.removeOrder(new Prodotto(id));
            }
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        if(session.getAttribute("utente") != null){
            Carrello c = session.getAttribute("carrello") == null ? new Carrello() : (Carrello) session.getAttribute("carrello");
            /*view per visualizzare le info del carrello*/
            String view = request.getParameter("view");
            response.setContentType("application/json");
            if("all".equals(view)){

            }else if("qt".equals(view)){
                Map<String,Integer> myMap = new HashMap<>();

                myMap.put("qty", c.count());
                response.getWriter().write(new GsonBuilder().create().toJson(myMap));
            }


        }
    }
}
