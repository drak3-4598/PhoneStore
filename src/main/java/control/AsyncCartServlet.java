package control;

import com.google.gson.GsonBuilder;
import model.Carrello;
import model.Ordine;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;


@WebServlet("/AsyncCartServlet")
public class AsyncCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {

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
                Ordine o = new Ordine();
                c.addOrder(o);
                myMap.put("qty", c.count());
                response.getWriter().write(new GsonBuilder().create().toJson(myMap));
            }


        }
    }
}
